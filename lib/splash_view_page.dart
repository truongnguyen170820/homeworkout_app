import 'package:flutter/material.dart';
import 'package:homeworkout_app/utils/color_utils.dart';
import 'package:homeworkout_app/utils/screen/screen_utils.dart';

class SplashView extends StatefulWidget {
  @override
  _SplashViewState createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context,
        height: 667, width: 375, allowFontScaling: true);
    return Scaffold(
      body: Container(
        height: 100,
         color: ColorUtils.blueAccent,
      ),
    );
  }
}
