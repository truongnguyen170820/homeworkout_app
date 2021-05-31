import 'package:flutter/material.dart';
import 'package:homeworkout_app/blocs/bloc_impl/event_type.dart';
import 'package:homeworkout_app/blocs/bloc_impl/stream_event.dart';
import 'package:homeworkout_app/blocs/workout/list_exercise_by_parrent_bloc.dart';
import 'package:homeworkout_app/model/workout/library_workout_model.dart';
import 'package:homeworkout_app/utils/color_utils.dart';
import 'package:homeworkout_app/utils/screen/screen.dart';
import 'package:homeworkout_app/utils/utilites.dart';
import 'package:homeworkout_app/widget/custom_appbar.dart';
import 'package:homeworkout_app/widget/custombutton.dart';
import 'package:homeworkout_app/widget/fail_widget.dart';
import 'package:homeworkout_app/widget/font_utils.dart';
import 'package:homeworkout_app/widget/global.dart';
import 'package:homeworkout_app/widget/image_view.dart';
import 'package:homeworkout_app/widget/loading_widget.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class ExerciseByWeekPage extends StatefulWidget {
  final LibraryWorkoutModel libraryWorkoutModel;

  const ExerciseByWeekPage({Key key, this.libraryWorkoutModel})
      : super(key: key);

  @override
  _ExerciseByWeekPageState createState() => _ExerciseByWeekPageState();
}

class _ExerciseByWeekPageState extends State<ExerciseByWeekPage> {
  ListExerciseByParrentBloc bloc = ListExerciseByParrentBloc();
  List<LibraryWorkoutModel> listLibraryWorkoutModel = [];
  List<LibraryWorkoutModel> model = [];
  int i, pos;
  var listExercisedone = [];
  RefreshController controller = RefreshController();

  @override
  void initState() {
    bloc.getListLibraryWorkoutBloc(widget.libraryWorkoutModel.appType,
        parrentId: widget.libraryWorkoutModel.originalIdStr);
    bloc.init();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var process = widget.libraryWorkoutModel.totalCategory == null ||
            widget.libraryWorkoutModel.totalCategory == 0
        ? 0.0
        : 1 -
            (((widget.libraryWorkoutModel.totalCategory ?? 0) -
                    (widget.libraryWorkoutModel.totalCategoryCompleted ?? 0)) /
                (widget.libraryWorkoutModel.totalCategory ?? 0));
    var processRound = widget.libraryWorkoutModel.totalCategory == null ||
            widget.libraryWorkoutModel.totalCategory == 0
        ? 0.0
        : double.parse(process.toStringAsFixed(4));
    return Scaffold(
      appBar: appbarVideo(context, 'Bài tập theo tuần'),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: <Widget>[
            Container(
                height: setHeight(150),
                width: Screen.width,
                child: Stack(
                  children: <Widget>[
                    viewImage(widget.libraryWorkoutModel.imageUrl, Screen.width,
                        setHeight(150), context),
                    Container(
                      height: setHeight(150),
                      width: Screen.width,
                      padding: EdgeInsets.only(
                          top: setHeight(30),
                          right: setWidth(15),
                          left: setWidth(15),
                          bottom: setHeight(5)),
                      alignment: Alignment.bottomCenter,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            widget.libraryWorkoutModel.name.toUpperCase(),
                            style: FontUtils.MEDIUM.copyWith(
                                fontSize: setSp(20), color: Colors.black),
                          ),
                          SizedBox(
                            height: setHeight(3),
                          ),
                          Text(
                            '${widget.libraryWorkoutModel.totalDay} ngày',
                            style: FontUtils.MEDIUM.copyWith(
                                fontSize: setSp(14), color: Color(0xff29ABE2)),
                          ),
                          Spacer(),
                          Row(
                            children: <Widget>[
                              Text(
                                  'Còn ${(widget.libraryWorkoutModel.totalCategory ?? 0) - (widget.libraryWorkoutModel.totalCategoryCompleted ?? 0)} ngày',
                                  style: FontUtils.NORMAL.copyWith(
                                      fontSize: setSp(12),
                                      color: Color(0xff848484))),
                              Spacer(),
                              Text(
                                  processRound > 0
                                      ? ' ${(processRound * 100).toString().substring(0, 4)} %'
                                      : "0 %",
                                  style: FontUtils.NORMAL.copyWith(
                                      fontSize: setSp(12),
                                      color: Colors.white)),
                            ],
                          ),
                          SizedBox(
                            height: setHeight(5),
                          ),
                          ClipRRect(
                            borderRadius: BorderRadius.all(
                                Radius.circular(setHeight(2.5))),
                            child: LinearPercentIndicator(
                              padding: EdgeInsets.zero,
                              animation: true,
                              animationDuration: 1000,
                              lineHeight: setHeight(5),
                              restartAnimation: true,
                              percent: processRound ?? 0,
                              linearStrokeCap: LinearStrokeCap.butt,
                              clipLinearGradient: true,
                              linearGradient:
                                  ColorUtils.PROGRESSCOLOR_EXERCISE_WORKOUT,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                )),
            Container(
              height: setHeight(5),
              color: Color(0xffF5F5F5),
            ),
            StreamBuilder(
                stream: bloc.getLibraryStream,
                initialData: StreamEvent(eventType: StreamEventType.Loading),
                builder: (context, snapshot) {

                  switch (snapshot.data.eventType) {
                    case StreamEventType.Loading:
                      return LoadingWidget();
                      break;
                    case StreamEventType.Error:
                      return InkWell(
                        child: FailWidget(mess: snapshot.data.message),
                        onTap: () => bloc.getListLibraryWorkoutBloc(
                            widget.libraryWorkoutModel.appType),
                      );
                      break;
                    case StreamEventType.Loaded:
                      controller.refreshCompleted();
                  }
                    bloc.listData.sort((listLibraryWorkoutModel,
                        model) =>
                        listLibraryWorkoutModel.index.compareTo(model.index));
                  // }
                  return bloc.listData.length > 0
                      ? ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: bloc.listData.length,
                          itemBuilder: (context, index) {
                            return exerciseByWeek(
                               bloc.listData, index);
                          })
                      : Center(
                          child: Text('Danh sách bài tập trống!'),
                        );
                }),
            SizedBox(
              height: setHeight(15),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                  height: setHeight(50),
                  margin: EdgeInsets.only(
                      left: setWidth(35),
                      right: setWidth(35),
                      bottom: setHeight(5)),
                  child: ButtonCustom(
                    onTap: () {
                      // pos != null && i != null
                      //     ? pushTo(
                      //     context,
                      //     ListExcercisePage(
                      //       libraryWorkoutModel:
                      //       listLibraryWorkoutModel[i].children[pos],
                      //     ))
                      //     : Utilities.showToast(
                      //     context, 'Chưa có dữ liệu bài tập!'
                      // );
                    },
                    title: 'Tập Ngay',
                    bgColor: Color(0xff29ABE2),
                    borderRadius: setSp(18 * 1.5),
                    textStyle: FontUtils.MEDIUM
                        .copyWith(fontSize: setSp(18), color: Colors.white),
                  )),
            )
          ],
        ),
      ),
    );
  }

  Future<Null> _refreshPage() async {
    return bloc.getListLibraryWorkoutBloc(widget.libraryWorkoutModel.appType,
        isRefresh: true);
  }

  Widget exerciseByWeek(List<LibraryWorkoutModel> workoutModel, int index) {
    if (workoutModel[index].children != null &&
        workoutModel[index].children.length > 0) {
      workoutModel[index].children.sort(
          (workoutModel, model) => workoutModel.index.compareTo(model.index));
      listExercisedone = workoutModel[index]
          .children
          .where((element) => element.isFinished == true)
          .toList();
    }
    return Container(
      margin: EdgeInsets.only(
          top: setHeight(14), right: setWidth(15), left: setWidth(15)),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Text(
                workoutModel[index].name,
                style: FontUtils.MEDIUM
                    .copyWith(fontSize: setSp(14), color: Colors.black),
              ),
              Spacer(),
              Text(
                '${listExercisedone.length ?? 0}/${workoutModel[index].children.length}',
                style: FontUtils.MEDIUM
                    .copyWith(fontSize: setSp(14), color: Color(0xff29ABE2)),
              ),
            ],
          ),
          SizedBox(
            height: setHeight(5),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children:
                List.generate(workoutModel[index].children.length, (indexs) {
              return itemDayWorkout(workoutModel, index, indexs);
            }),
          ),
          Divider(),
        ],
      ),
    );
  }

  Widget itemDayWorkout(
      List<LibraryWorkoutModel> workoutModel, int index, int indexChidlren) {
    if (index == 0 && indexChidlren >= 0) {
      if (index == 0 && indexChidlren == 0) {
        if (workoutModel[0].children[0].isFinished == true) {
          return itemExerciseDone(workoutModel, index, indexChidlren);
        } else {
          i = index;
          pos = indexChidlren;
          return itemNextExercise(workoutModel, index, indexChidlren);
        }
      } else {
        if (workoutModel[index].children[indexChidlren].isFinished == true) {
          return itemExerciseDone(workoutModel, index, indexChidlren);
        } else {
          if (workoutModel[index].children[indexChidlren - 1].isFinished ==
                  true &&
              workoutModel[index].children[indexChidlren].isFinished == false) {
            i = index;
            pos = indexChidlren;
            return itemNextExercise(workoutModel, index, indexChidlren);
          } else {
            return itemExercise(workoutModel, index, indexChidlren);
          }
        }
      }
    } else {
      if (workoutModel[index].children[indexChidlren].isFinished == true) {
        return itemExerciseDone(workoutModel, index, indexChidlren);
      } else {
        if (indexChidlren == 0) {
          if (workoutModel[index - 1].children.last.isFinished == true &&
              workoutModel[index].children[indexChidlren].isFinished == false) {
            i = index;
            pos = indexChidlren;
            return itemNextExercise(workoutModel, index, indexChidlren);
          } else {
            return itemExercise(workoutModel, index, indexChidlren);
          }
        } else {
          if (workoutModel[index].children[indexChidlren - 1].isFinished ==
                  true &&
              workoutModel[index].children[indexChidlren].isFinished == false) {
            i = index;
            pos = indexChidlren;
            return itemNextExercise(workoutModel, index, indexChidlren);
          } else {
            return itemExercise(workoutModel, index, indexChidlren);
          }
        }
      }
    }
  }

  Widget itemExerciseDone(
      List<LibraryWorkoutModel> workoutModel, int index, int indexChidlren) {
    return GestureDetector(
      onTap: () {
        // pushTo(
        // context,
        // ListExcercisePage(
        //     libraryWorkoutModel: workoutModel[index].children[indexChidlren]));
      },
      child: Icon(
        Icons.check_circle,
        color: Color(0xff34D182),
        size: setWidth(40),
      ),
    );
  }

  Widget itemExercise(
      List<LibraryWorkoutModel> workoutModel, int index, int indexChidlren) {
    return GestureDetector(
      onTap: () {
        Utilities.showToast(
            context, 'Vui lòng hoàn thành các bài tập trước đó!');
      },
      child: Container(
        width: setWidth(38),
        height: setWidth(38),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            shape: BoxShape.circle, border: Border.all(color: Colors.black12)),
        child: Text(
          '${indexChidlren + 1}',
          style: FontUtils.MEDIUM
              .copyWith(fontSize: setSp(16), color: Colors.black26),
        ),
      ),
    );
  }

  Widget itemNextExercise(
      List<LibraryWorkoutModel> workoutModel, int index, int indexChidlren) {
    return GestureDetector(
      onTap: () {
        // pushTo(
        //     context,
        //     ListExcercisePage(
        //       libraryWorkoutModel: workoutModel[index].children[indexChidlren],
        //     ));
      },
      child: Container(
        width: setWidth(38),
        height: setWidth(38),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            shape: BoxShape.circle, border: Border.all(color: Colors.black12)),
        child: Text(
          '${indexChidlren + 1}',
          style: FontUtils.MEDIUM
              .copyWith(fontSize: setSp(16), color: Colors.blue),
        ),
      ),
    );
  }
}
