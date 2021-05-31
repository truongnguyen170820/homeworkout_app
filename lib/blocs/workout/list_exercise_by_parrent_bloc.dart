import 'dart:async';

import 'package:homeworkout_app/blocs/api_service.dart';
import 'package:homeworkout_app/blocs/app_constant.dart';
import 'package:homeworkout_app/blocs/base_list_bloc.dart';
import 'package:homeworkout_app/blocs/base_response.dart';
import 'package:homeworkout_app/blocs/bloc.dart';
import 'package:homeworkout_app/blocs/bloc_impl/event_type.dart';
import 'package:homeworkout_app/blocs/bloc_impl/stream_event.dart';
import 'package:homeworkout_app/blocs/remote/api_response.dart';
import 'package:homeworkout_app/model/api_constants.dart';
import 'package:homeworkout_app/model/workout/library_workout_model.dart';
import 'package:rxdart/rxdart.dart';

// class ListExerciseByParrentBloc extends BaseListBlock<>
class ListExerciseByParrentBloc extends BaseListBlock<LibraryWorkoutModel> implements Bloc {
  Subject subjectListLibraryWorkoutBloc = BehaviorSubject<ApiResponse<JDIResponse>>();
  StreamController<StreamEvent<LibraryWorkoutModel>> _libraryCtrl = StreamController.broadcast();
  Stream<StreamEvent<LibraryWorkoutModel>> get getLibraryStream =>
      _libraryCtrl.stream;

  getListLibraryWorkoutBloc(int appType,{String parrentId,bool isRefresh=false}){
    if (isRequesting())
      return;
    if (isRefresh)
      refreshPage();
    var data = Map<String, dynamic>();
    data['ParrentId'] =parrentId;
    data['AppType'] =appType;
    data['Language'] = 'vi';
    data['PageIndex'] =pageIndex;
    data['PageSize'] = 100;
    ApiService(ApiConstants.LIBRARY_WORKOUT_BY_PARRENT,
        data,subjectListLibraryWorkoutBloc).execute();
  }
  init(){
    subjectListLibraryWorkoutBloc.listen((respon) {
      if (respon.status == Status.SUCCESS) {
        requestFinished();
        JDIResponse response = respon.data;
        if (response != null && response.ErrorCode == "000000") {
          List<LibraryWorkoutModel> result =
          response.Data.map((e) => LibraryWorkoutModel.fromJson(e)).toList();
          setList(result, AppConstants.PAGE_SIZE);
          increasePage();
          _libraryCtrl.sink
              .add(StreamEvent(eventType: StreamEventType.Loaded, data: result));
        } else {
          var error = "";
          if (response != null && response.ErrorMessage != null)
            error = response.ErrorMessage != null
                ? response.ErrorMessage
                : response.ErrorCode;
          _libraryCtrl.sink.add(
              StreamEvent(eventType: StreamEventType.Error, message: error));
        }
      }
      else if (respon.status == Status.LOADING) {
        _libraryCtrl.sink.add(StreamEvent(
          eventType: StreamEventType.Loading,
        ));
      }
      else {
        requestFinished();

        _libraryCtrl.sink.add(StreamEvent(
            eventType: StreamEventType.Error,
            message: "Có lỗi khi lấy dữ liệu"));
      }
    });
  }


  @override
  void dispose() {
    subjectListLibraryWorkoutBloc.close();
    _libraryCtrl.close();
    // TODO: implement dispose
  }
}