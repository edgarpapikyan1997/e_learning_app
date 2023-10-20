import 'package:e_learning_app/extensions/extensions.dart';
import 'package:flutter/material.dart';

import '../../../utils/app_colors.dart';
import '../../../utils/assets.dart';

Widget reusableIcons({
  double? height,
  double? width,
  Image? image,
}) {
  return GestureDetector(
    onTap: () {},
    child: SizedBox(
      height: 50,
      width: 50,
      child: image,
    ).paddingHorizontal(10),
  );
}

