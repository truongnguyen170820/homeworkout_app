import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:homeworkout_app/widget/animation_pushto.dart';
import 'package:multi_image_picker/multi_image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppUtils {
  static final shared = AppUtils();
  static SharedPreferences sharedPreferences;

  static Future sharedF() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }
  saveDataShowChart(String key,value){
   return sharedPreferences.setString(key, jsonEncode(value));
  }
  getDataShowChart(String key){
    return jsonDecode(sharedPreferences.getString(key));
  }




  void pushReplacementWidget(BuildContext context, Widget widget,
      {String routeName = ""}) {
    if (routeName.isEmpty) routeName = widget.toString();
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) => widget,
          settings: RouteSettings(
            name: routeName,
          ),
        ));
  }

  void pushWidget(BuildContext context, Widget widget) {
    Navigator.push(
        context, SlideRightRoute(page: widget,));
  }

  dynamic pushWidgetValueReturn(BuildContext context, Widget widget) async {
    dynamic result = await Navigator.push(
        context, SlideRightRoute(page: widget));
    return result;
  }

//  Future<List<MultipartFile>> writeToFile(List<Asset> images,
//      {int maxSize = 700}) async {
//    List<MultipartFile> listFile = new List<MultipartFile>();
//    for (Asset asset in images) {
//      int mod = asset.originalWidth % maxSize;
//      if (mod <= 0) mod = 1;
//      int quality = (100 / mod).floor();
//      ByteData byte = await asset.getByteData(quality: quality);
//      Directory tempDir = await getTemporaryDirectory();
//      StringBuffer buffer = new StringBuffer();
//      buffer.write(tempDir.path);
//      buffer.write("/");
//      buffer.write(asset.name);
//      File file = await File(buffer.toString()).writeAsBytes(
//          byte.buffer.asUint8List(byte.offsetInBytes, byte.lengthInBytes));
//      listFile.add( MultipartFile.fromFileSync(file.path, filename: asset.name));
//    }
//    return listFile;
//  }
  Future<List<String>> writeToFile(List<Asset> images,
      {int maxSize = 700}) async {
    List<String> listFile = new List();
    for (Asset asset in images) {
      int mod = asset.originalWidth % maxSize;
      if (mod <= 0) mod = 1;
      int quality = (100 / mod).floor();
      ByteData byte = await asset.getByteData(quality: quality);
      Directory tempDir = await getTemporaryDirectory();
      StringBuffer buffer = new StringBuffer();
      buffer.write(tempDir.path);
      buffer.write("/");
      buffer.write(asset.name);
      File file = await File(buffer.toString()).writeAsBytes(
          byte.buffer.asUint8List(byte.offsetInBytes, byte.lengthInBytes));
      listFile.add(file.path);
    }
    return listFile;
  }
}
