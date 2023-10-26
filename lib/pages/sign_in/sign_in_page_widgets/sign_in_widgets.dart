import 'package:e_learning_app/extensions/extensions.dart';
import 'package:flutter/material.dart';

import '../../../utils/app_colors.dart';

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

Widget customAppBar(BuildContext context,
    {double elevation = 0.2,
    Color shadowColor = AppColors.white,
    bool autoLeading = false,
    Color backgroundColor = AppColors.whiteSmock,
    String? title}) {
  return AppBar(
    elevation: elevation,
    shadowColor: shadowColor,
    automaticallyImplyLeading: false,
    backgroundColor: AppColors.whiteSmock,
    title: Center(
      child: Text(
        title ?? "",
        style: context.theme.headline5.chalkboardBlack.semiBold,
      ),
    ),
  );
}
