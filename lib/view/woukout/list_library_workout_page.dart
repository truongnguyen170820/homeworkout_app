import 'package:flutter/material.dart';
import 'package:homeworkout_app/blocs/app_constant.dart';
import 'package:homeworkout_app/blocs/base_response.dart';
import 'package:homeworkout_app/blocs/bloc_impl/event_type.dart';
import 'package:homeworkout_app/blocs/bloc_impl/stream_event.dart';
import 'package:homeworkout_app/blocs/remote/api_response.dart';
import 'package:homeworkout_app/blocs/workout/list_library_workout_bloc.dart';
import 'package:homeworkout_app/model/workout/library_workout_model.dart';
import 'package:homeworkout_app/utils/color_utils.dart';
import 'package:homeworkout_app/utils/screen/screen.dart';
import 'package:homeworkout_app/utils/strings.dart';
import 'package:homeworkout_app/utils/utilites.dart';
import 'package:homeworkout_app/view/woukout/exercise_by_week_page.dart';
import 'package:homeworkout_app/widget/custom_appbar.dart';
import 'package:homeworkout_app/widget/fail_widget.dart';
import 'package:homeworkout_app/widget/font_utils.dart';
import 'package:homeworkout_app/widget/global.dart';
import 'package:homeworkout_app/widget/image_view.dart';
import 'package:homeworkout_app/widget/loading_widget.dart';
import 'package:homeworkout_app/widget/star.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class ListLibraryWorkoutPage extends StatefulWidget {
  final appType;

  const ListLibraryWorkoutPage({Key key, this.appType}) : super(key: key);
  @override
  _ListLibraryWorkoutPageState createState() => _ListLibraryWorkoutPageState();
}

class _ListLibraryWorkoutPageState extends State<ListLibraryWorkoutPage> {
  ListLibraryWorkoutBloc bloc = ListLibraryWorkoutBloc();
  RefreshController controller = RefreshController();

  @override
  void initState() {
    bloc.getListLibraryWorkoutBloc(widget.appType);
   bloc.init();
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbarVideo(context, checkTitleAppbar()),
      body: StreamBuilder(
          stream: bloc.getLibraryStream,
          initialData: StreamEvent(eventType: StreamEventType.Loading),
          builder: (context, snapshot){
        switch (snapshot.data.eventType) {
          case StreamEventType.Loading:
            return LoadingWidget();
            break;
          case StreamEventType.Error:
            return InkWell(
              child: FailWidget(mess: snapshot.data.message),
              onTap: () => bloc.getListLibraryWorkoutBloc(widget.appType),
            );
            break;
          case StreamEventType.Loaded:
            controller.refreshCompleted();
        }
        return bloc.listData.length == 0 ?
        Container(
          height: 100,
          alignment: Alignment.center,
          child: Text(
            "Danh sách bài tập trống",
            style: FontUtils.MEDIUM.copyWith(fontSize: setSp(14)),
          ),
        ) :
         ListView.builder(
            padding: EdgeInsets.zero,
            physics: BouncingScrollPhysics(),
            itemCount: bloc.listData.length,
            itemBuilder: (context, index) {
              if (bloc.canLoadMore(index, bloc.listData.length)) {
                bloc.getListLibraryWorkoutBloc(widget.appType);
                return LoadingWidget();
              }
              return bloc.listData[index].children == null || bloc.listData[index].children.length == 0
                  ? itemLibraryWorkoutNoChidreen(bloc.listData[index])
                  : itemLibraryWorkout(bloc.listData[index]);
            });
      })
    );
  }
  Future<Null> _refreshPage() async{
    return bloc.getListLibraryWorkoutBloc(widget.appType, isRefresh: true);
  }
  checkTitleAppbar(){
    switch(widget.appType){
      case 0 :
        return 'Bài tập gym nam';
        break;
        case 1 :
        return 'Bài tập gym nữ';
        break;
        case 2 :
        return 'Bài tập gym yoga';
        break;
        // case 3 :
        // return 'Bài tập gym aerobic';
        // break;
      case 4:
        return 'Bài tập aerobic';
        break;
      default:
        return 'Bài tập kick-boxing';
        break;
    }
  }
  Widget itemLibraryWorkoutNoChidreen(LibraryWorkoutModel model) {
    return Container(
      margin: EdgeInsets.only(
        left: setWidth(10),
        right: setWidth(10),
        top: setHeight(10),
      ),
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () {
        //   if(model.totalWorkout>0)
        //     // pushTo(context, ListExcercisePage(libraryWorkoutModel: model));
        },
        child: Card(
          child: Padding(
            padding: EdgeInsets.only(
                left: setWidth(10), top: setHeight(10), bottom: setHeight(10)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  model.name.toUpperCase() ?? '',
                  style: FontUtils.MEDIUM
                      .copyWith(fontSize: setSp(14), color: Colors.black),
                ),
                model.totalWorkout==0? Text('Ngày nghỉ',style: FontUtils.NORMAL
                    .copyWith(fontSize: setSp(14), color: Colors.black)):Text('${model.totalWorkout} bài tập',style: FontUtils.NORMAL
                    .copyWith(fontSize: setSp(14), color: Colors.black))
              ],
            ),
          ),
        ),
      ),
    );
  }
  Widget itemLibraryWorkout(LibraryWorkoutModel model) {
    return Container(
      margin: EdgeInsets.only(
          left: setWidth(10),
          right: setWidth(10),
          top: setHeight(20),
          bottom: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            model.name.toUpperCase() ?? '',
            style: FontUtils.MEDIUM
                .copyWith(fontSize: setSp(14), color: Colors.black),
          ),
          ListView.builder(
              padding: EdgeInsets.zero,
              physics: NeverScrollableScrollPhysics(),
              itemCount: model.children.length > 5 ? 5 : model.children.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return checkStatusLibraryWorkView(model.children[index]);
              }),
        ],
      ),
    );
  }
  checkStatusLibraryWorkView(LibraryWorkoutModel children) {
    switch (children.type) {
      case 1:
        return fullBody(children);
        break;
      case 3:
        return buildWiderShoulder(children);
        break;
      default:
        return _listLibrary(children);
        break;
    }
  }
  Widget fullBody(LibraryWorkoutModel model) {
    var process= model.totalCategory==null||model.totalCategory==0?0.0:(1-(((model.totalCategory??0) -
        (model.totalCategoryCompleted??0)) / (model.totalCategory??0)));
    var processRound=model.totalCategory==null||model.totalCategory==0?0.0:double.parse(process.toStringAsFixed(4));
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        pushTo(
            context,
            ExerciseByWeekPage(
              libraryWorkoutModel: model,
            ));
      },
      child: Container(
          margin: EdgeInsets.only(top: setHeight(8)),
          height: setHeight(150),
          width: Screen.width,
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            child: Stack(
              children: <Widget>[
                Container(
                  width: Screen.width,
                  height: setHeight(150),
                  child: viewImage(model.imageUrl ?? '', setHeight(150),
                      Screen.width, context),
                ),
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
                        model.name.toUpperCase(),
                        style: FontUtils.MEDIUM
                            .copyWith(fontSize: setSp(20), color: Colors.black),
                      ),
                      SizedBox(
                        height: setHeight(3),
                      ),
                      Text(
                        '${model.totalCategory ?? 0} ngày',
                        style: FontUtils.MEDIUM.copyWith(
                            fontSize: setSp(14), color: Color(0xff29ABE2)),
                      ),
                      Spacer(),
                      Row(
                        children: <Widget>[
                          Text(
                              'Còn ${(model.totalCategory??0) - (model.totalCategoryCompleted??0)} ngày',
                              style: FontUtils.NORMAL.copyWith(
                                  fontSize: setSp(12),
                                  color: Color(0xff848484))),
                          Spacer(),
                          Text(processRound>0?' ${(processRound * 100).toString().substring(0,4)} %':"0 %",
                              style: FontUtils.NORMAL.copyWith(
                                  fontSize: setSp(12), color: Colors.white)),
                        ],
                      ),
                      SizedBox(
                        height: setHeight(5),
                      ),
                      ClipRRect(
                        borderRadius:
                        BorderRadius.all(Radius.circular(setHeight(2.5))),
                        child: LinearPercentIndicator(
                          padding: EdgeInsets.zero,
                          animation: true,
                          animationDuration: 1000,
                          lineHeight: setHeight(5),
                          restartAnimation: true,
                          percent: processRound??0,
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
            ),
          )),
    );
  }
  Widget buildWiderShoulder(LibraryWorkoutModel model) {
    return Container(
        margin: EdgeInsets.only(top: setHeight(8)),
        decoration:
        BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(10))),
        height: setHeight(150),
        width: Screen.width,
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          child: Stack(
            children: <Widget>[
              Container(
                width: Screen.width,
                height: setHeight(150),
                child: viewImage(model.imageUrl ?? '', setHeight(150),
                    Screen.width, context),
              ),
              Container(
                height: setHeight(150),
                width: Screen.width,
                padding: EdgeInsets.only(
                    top: setHeight(30),
                    right: setWidth(15),
                    left: setWidth(15),
                    bottom: setHeight(5)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      model.name.toUpperCase(),
                      style: FontUtils.MEDIUM
                          .copyWith(fontSize: setSp(20), color: Colors.white),
                      textAlign: TextAlign.start,
                    ),
                    Spacer(),
                    Align(
                      alignment: Alignment.centerRight,
                      child: GestureDetector(
                          behavior: HitTestBehavior.translucent,
                          onTap: () {
                            // pushTo(
                            //     context,
                            //     ExerciseWorkoutByLevelPage(
                            //         libraryWorkoutModel: model));
                          },
                          child: Container(
                            alignment: Alignment.center,
                            child: Text('Tập ngay'.toUpperCase(),
                                style: FontUtils.NORMAL.copyWith(
                                  fontSize: setSp(12),
                                  color: Color(0xff29ABE2),
                                )),
                            width: setWidth(80),
                            height: setHeight(24),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(18)),
                          )),
                    ),
                    SizedBox(
                      height: setHeight(15),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
  _listLibrary(LibraryWorkoutModel model) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        // pushTo(context, ListExcercisePage(libraryWorkoutModel: model));
      },
      child: Container(
          margin: EdgeInsets.only(top: setHeight(8)),
          color: Colors.transparent,
          width: Screen.width,
          height: setHeight(150),
          child:ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            child: Card(
              elevation: 1,
              shadowColor: Colors.black,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child:  Stack(
                children: <Widget>[
                  Container(
                    width: Screen.width,
                    height: setHeight(150),
                    child: viewImage(model.imageUrl ?? '', setHeight(150),
                        Screen.width, context),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Padding(
                          padding: EdgeInsets.only(
                            top: setHeight(30),
                            left: setWidth(14),
                          ),
                          child: Text(
                            model.name.toUpperCase() ?? '',
                            style: FontUtils.MEDIUM.copyWith(
                                fontSize: setSp(20), color: Colors.black),
                          )),
                      Padding(
                          padding: EdgeInsets.only(
                            left: setWidth(14),
                            bottom: setHeight(14),
                          ),
                          child: star(model.level.toDouble(), setHeight(15),
                              count: 3))
                    ],
                  )
                ],
              ),
            ),
          )
      ),
    );
  }
}
