import 'package:e_learning_app/extensions/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../utils/app_colors.dart';

Widget customAppBar(BuildContext context,
    {double elevation = 0.2,
    Color shadowColor = AppColors.white,
    bool autoLeading = false,
    Color backgroundColor = AppColors.whiteSmock,
    String? toPage = 'homePage',
    String? title}) {
  return AppBar(
    leading: IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () => context.go('/$toPage')),
    elevation: elevation,
    shadowColor: shadowColor,
    automaticallyImplyLeading: autoLeading,
    iconTheme: const IconThemeData(
      color: AppColors.black,
    ),
    backgroundColor: AppColors.whiteSmock,
    centerTitle: true,
    title: Text(
      title ?? "",
      style: context.theme.headline5.chalkboardBlack.semiBold,
    ),
  );
}
