import 'package:e_learning_app/extensions/context_extension.dart';
import 'package:e_learning_app/extensions/widget_extension.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../utils/app_colors.dart';

void circularProgress(
  BuildContext context, {
  double containerWidth = 80,
  double containerHeight = 80,
}) {
  showDialog(
    context: context,
    builder: (context) => Dialog(
      shadowColor: Colors.white.withOpacity(0.0),
      backgroundColor: Colors.white.withOpacity(0.0),
      child: const SizedBox(
          height: 50,
          width: 50,
          child: CircularProgressIndicator(
            strokeWidth: 10,
            color: AppColors.lightBlue,
            backgroundColor: AppColors.white,
          )),
    )
        .paddingHorizontal(context.width / 3),
    // child: CircularProgressIndicator()),
  );
}
