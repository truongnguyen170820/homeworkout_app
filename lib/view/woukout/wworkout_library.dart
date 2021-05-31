import 'package:flutter/material.dart';
import 'package:homeworkout_app/blocs/api_service.dart';
import 'package:homeworkout_app/blocs/base_response.dart';
import 'package:homeworkout_app/blocs/remote/api_response.dart';
import 'package:homeworkout_app/model/api_constants.dart';
import 'package:homeworkout_app/model/workout/library_workout_model.dart';
import 'package:homeworkout_app/utils/screen/screen.dart';
import 'package:homeworkout_app/utils/utilites.dart';
import 'package:homeworkout_app/widget/global.dart';
import 'package:homeworkout_app/widget/loadding.dart';

import 'list_library_workout_page.dart';

class WorkoutLibrary extends StatefulWidget {
  @override
  _WorkoutLibraryState createState() => _WorkoutLibraryState();
}

class _WorkoutLibraryState extends State<WorkoutLibrary> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            itemCard("bn_tap_gym_nam.png", 0),
            itemCard("bn_tap_gym_nu.png", 1),
            itemCard("bn_tap_yoga.png", 2),
            itemCard("bn_aerobic.png", 4),
            itemCard("bn_kick_boxing.png", 3),
          ],
        ),
      ),
    );
  }
  Widget itemCard(String image, int type) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        showLoading(context);
        var data = Map<String, dynamic>();
        data['AppType'] = type;
        data['Language'] = 'vi';
        data['PageIndex'] = 1;
        data['PageSize'] = 20;
        ApiService(ApiConstants.LIBRARY_WORKOUT, data, null)
            .getResponse()
            .then((data) {
          if (data.status == Status.SUCCESS) {
            JDIResponse response = data.data;
            Navigator.pop(context);
            if (response != null && response.ErrorCode == "000000") {
              List<LibraryWorkoutModel> result =
              response.Data.map((e) => LibraryWorkoutModel.fromJson(e))
                  .toList();
              if (result != null && result.length > 0) {
                pushTo(context, ListLibraryWorkoutPage(appType: type));
              }else{
                Utilities.showToast(context, "Chức năng đang phát triển");
              }
              return;
            }
            String message = response != null
                ? ((response.ErrorMessage == null || response.ErrorCode.isEmpty)
                ? response.ErrorCode
                : response.ErrorMessage)
                : "Lỗi ngoại lệ";
            Utilities.showToast(context, message);
          } else {
            Navigator.pop(context);
            Utilities.showToast(context, "Có lỗi xảy ra");
          }
        });
      },
      child: Container(

        margin: EdgeInsets.only(
            top: setHeight(13), right: setWidth(10), left: setHeight(10)),

        child: Card(
            elevation: 1,
            shadowColor: Colors.black,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(5)),
              child: Image.asset(
                getAssetsImage(image),
                fit: BoxFit.fitWidth,
                width: Screen.width,
              ),
            )),
      ),
    );
  }
}
