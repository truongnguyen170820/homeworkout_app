import 'package:flutter/material.dart';
import 'package:homeworkout_app/utils/color_utils.dart';
import 'package:homeworkout_app/widget/global.dart';

Widget appbarVideo(BuildContext context, String title, {

  Color bgColor = ColorUtils.blue1, List<Widget> actions,bool value}) {
  return AppBar(
    leading: IconButton(
      onPressed: () => Navigator.pop(context,value),
      icon: Icon(Icons.arrow_back_ios),
    ),
    title: Text(
      title, style: TextStyle(fontSize: setSp(18), fontWeight: FontWeight.bold),),
    centerTitle: true,
    actions: actions,
    flexibleSpace: Container(
      decoration: BoxDecoration(
        gradient: ColorUtils.APPBAR_GRADIENT,
      ),
    ),
    textTheme: TextTheme(
        title: TextStyle(color: Colors.white, fontSize: 18)
    ),
    iconTheme: IconThemeData(color: Colors.white),
    elevation: 0.0,
  );
}
