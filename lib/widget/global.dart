
import 'package:flutter/material.dart';
import 'package:homeworkout_app/utils/screen/screen_utils.dart';

import 'animation_pushto.dart';


class Global {
}
setHeight(num value) {
  return ScreenUtil().setHeight(value);
}

setWidth(num value) {
  return ScreenUtil().setWidth(value);
}

setSp(num value) {
  return ScreenUtil().setSp(value);
}

String getAssetsIcon(String icon){
  return "assets/icons/" + icon;
}

String getAssetsImage(String image){
  return "assets/images/" + image;
}

void dismissKeyboard(BuildContext context) {
  FocusScope.of(context).unfocus();
}
String timeExercise(int time) {
  return (time ~/ 60>9?'${time ~/ 60}': '0${time ~/ 60}')+':'+((time % 60)<10?'0${time % 60}':'${time % 60}');
}
void pop(BuildContext context, {dynamic result}) {
  Navigator.pop(
    context,
    result,
  );}
void pushTo(BuildContext context,Widget widget, ){
  Navigator.push(context, SlideRightRoute(page: widget,),);
}

