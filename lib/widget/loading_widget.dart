import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoadingWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    if (Platform.isAndroid)
      return Center(
        child: CircularProgressIndicator(),
      );
    return Center(
      child: CupertinoActivityIndicator(
        radius: 15,
      ),
    );
  }
}
Widget customLoading= Container(
  width: 20,
  height: 20,
  margin: EdgeInsets.only(bottom: 10),
  child: CupertinoActivityIndicator(),
);