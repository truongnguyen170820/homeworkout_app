import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:homeworkout_app/utils/color_utils.dart';
import 'package:homeworkout_app/widget/font_utils.dart';
import 'package:homeworkout_app/widget/global.dart';
import 'package:homeworkout_app/widget/widget_spacer.dart';
import 'package:intl/intl.dart';

class Utilities{
  static String formatNumber({dynamic number,String format = "#0.00"}){
    return new NumberFormat(format).format(number);
  }
  static String formatMoney(dynamic number,{String suffix = "VNĐ"}){
    final oCcy = new NumberFormat("#,##0", "vi_VN");
    return oCcy.format(number) + suffix;
  }
  static showToast(BuildContext context,String mess,{Color textColor = Colors.white}){
    FlutterToast(context).showToast(
      child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25.0),
            color: ColorUtils.BLACK_BACKGROUND,
          ),
          child: Text(mess,style: FontUtils.NORMAL.copyWith(color: textColor),)
      ),
      gravity: ToastGravity.BOTTOM,
      toastDuration: Duration(seconds: 2),
    );
  }
  static getRandomNumber(String text,int number){
    if(text==null||text.isEmpty) return Random().nextInt(number);
    return utf8.encode(text).fold(0, (result, item) => result + item)%number;
  }
  static String getAcronym(String text){
    if(text==null||text.isEmpty) return "";
    var words = text.split(' ');
    if(words.length==1){
      if(words[0].length==1) return words[0];
      return words[0].substring(0,2);
    }
    var first = words.first;
    var last = words.last;
    return first.substring(0,1)+last.substring(0,1);
  }
  showToastLostInternet(BuildContext context){
    FlutterToast(context).showToast(child: Container(
      width: setWidth(188),
      height: setWidth(188),
      padding: EdgeInsets.fromLTRB(setWidth(30),setWidth(20),setWidth(30),setWidth(30)),
      decoration: BoxDecoration(
          borderRadius:BorderRadius.circular(setWidth(19)),
          color: ColorUtils.BLACK_BACKGROUND
      ) ,
      child: Column(
        children: <Widget>[
          CircleAvatar(
            radius: setWidth(40),
            backgroundColor: ColorUtils.RED_BACKGROUND,
            child: Icon(
              Icons.signal_wifi_off,
              color: Colors.white,
              size: setWidth(30),
            ),
          ),
          WidgetSpacer(height:setWidth(5)),
          Text("Không có kết nối internet",textAlign: TextAlign.center,
            style: FontUtils.NORMAL.copyWith(fontSize: setSp(16),color: Colors.white),)
        ],
      ),
    ),gravity: ToastGravity.CENTER);
  }

  showToastGetLocationFail(BuildContext context){
    FlutterToast(context).showToast(child: Container(
      width: setWidth(200),
      height: setWidth(200),
      padding: EdgeInsets.fromLTRB(setWidth(30),setWidth(20),setWidth(30),setWidth(30)),
      decoration: BoxDecoration(
          borderRadius:BorderRadius.circular(setWidth(19)),
          color: ColorUtils.BLACK_BACKGROUND
      ) ,
      child: Column(
        children: <Widget>[
          CircleAvatar(
            radius: setWidth(40),
            backgroundColor: ColorUtils.RED_BACKGROUND,
            child: Icon(
              Icons.location_off,
              color: Colors.white,
              size: setWidth(30),
            ),
          ),
          WidgetSpacer(height:setWidth(5)),
          Text("Không tìm được vị trí của bạn",textAlign: TextAlign.center,
            style: FontUtils.NORMAL.copyWith(fontSize: setSp(16),color: Colors.white),)
        ],
      ),
    ),gravity: ToastGravity.CENTER);
  }
}