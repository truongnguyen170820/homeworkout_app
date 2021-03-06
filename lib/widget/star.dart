import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

import 'global.dart';

Widget star(num rate,double size,{Function(double) onrated,bool isReadOnly=true,int count=5}) {
  return SmoothStarRating(
    color: Colors.yellow,
    borderColor: Colors.black26,
    rating: rate??3.0,
    isReadOnly: isReadOnly,
    size: setWidth(size),
    filledIconData: Icons.star,
    halfFilledIconData: Icons.star_half,
    defaultIconData: Icons.star,
    starCount: count,
    allowHalfRating: true,
    spacing: 1.0,
    onRated: onrated
  );
}