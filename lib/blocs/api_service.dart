
import 'package:dio/dio.dart';
import 'package:homeworkout_app/blocs/app_constant.dart';
import 'package:homeworkout_app/blocs/base_response.dart';
import 'package:homeworkout_app/blocs/remote/api_response.dart';
import 'package:homeworkout_app/blocs/remote/data_fetch_call.dart';
import 'package:homeworkout_app/blocs/remote/network_util.dart';
import 'package:homeworkout_app/model/api_constants.dart';
import 'package:homeworkout_app/utils/app_cache.dart';
import 'package:rxdart/rxdart.dart';

class ApiService extends DataFetchCall<JDIResponse> {
  String _path;
  Map<String, dynamic> _request;
  FormData _fromData = FormData.fromMap({});
  String sessionId;

  ApiService(String path, Map<String, dynamic> request,
      Subject<ApiResponse<JDIResponse>> responseSubject,{this.sessionId,FormData fromData})
      : super(responseSubject) {
    this._request = request;
    this._path = path;
    this._fromData=fromData;
  }

  Map<String, String> getHeader() {
    Map<String, String> map = new Map();
    map["AppKey"] = AppConstants.APP_KEY;
    if(AppCache().getMember()!=null) {
      map["SessionId"] = AppCache().getMember().SessionId;
    }
    if(sessionId!=null) map["SessionId"] = sessionId;
    return map;
  }

  @override
  bool shouldFetchFromDB() {
    return false;
  }

  @override
  void loadFromDB() {}

  @override
  Future<Response> createApiAsync({CancelToken cancelToken}) {
    print("networkUtil" + ApiConstants.BASE_URL + _path + _request.toString());
    return networkUtil.post(ApiConstants.BASE_URL + _path,formData: _fromData,
        mapData: _request, headers: getHeader(),cancelToken: cancelToken);
  }

  @override
  void onSuccess(JDIResponse response) {}

  @override
  JDIResponse parseJson(Response response) {
    return JDIResponse.fromJson(response.data);
  }
}
