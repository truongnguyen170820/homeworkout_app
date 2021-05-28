
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:homeworkout_app/model/api_constants.dart';
import 'package:homeworkout_app/utils/color_utils.dart';
import 'package:homeworkout_app/utils/utilites.dart';
import 'package:homeworkout_app/widget/font_utils.dart';
import 'package:homeworkout_app/widget/global.dart';

Widget circleAvatar(String path,{String replaceName="",double radius = 22}) {
  radius = setWidth(radius);
  return ClipRRect(
      borderRadius: BorderRadius.circular(radius),
      child: CachedNetworkImage(
        width: radius*2,
        height: radius*2,
        fit: BoxFit.cover,
        errorWidget: (context, url, error) => Container(
          child: Center(
            child: Text(Utilities.getAcronym(replaceName).toUpperCase(),style: FontUtils.SEMIBOLD.copyWith(color: Colors.white),),
          ),
          color: ColorUtils.DEFAULT_AVATAR_COLOR[Utilities.getRandomNumber(replaceName, ColorUtils.DEFAULT_AVATAR_COLOR.length)],
          width: radius*2,
          height: radius*2,
        ),
        imageUrl:  ApiConstants.shared.getFullImage(path),
      )
  );
}