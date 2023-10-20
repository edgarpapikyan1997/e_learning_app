import 'package:e_learning_app/blocs/custom_button_bloc/custom_button_bloc.dart';
import 'package:e_learning_app/extensions/context_extension.dart';
import 'package:e_learning_app/extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../utils/app_colors.dart';

class CustomButton extends StatelessWidget {
  final String? buttonTitle;
  final Color? buttonColor;
  final Color? buttonShadowColor;
  final double? borderRadius;
  final double? height;

  const CustomButton(
      {super.key,
      this.buttonColor = AppColors.lightBlue,
      this.borderRadius = 10,
      this.buttonShadowColor = AppColors.darkBlue,
      this.height = 50,
      this.buttonTitle});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CustomButtonBloc, CustomButtonState>(
      builder: (BuildContext context, state) {
        var stateFromEvent = (state as ButtonTitleChangeState).currentTitle;
        return Container(
          decoration: BoxDecoration(
            color: AppColors.lightBlue,
            borderRadius: BorderRadius.circular(borderRadius!),
            boxShadow: const [
              BoxShadow(
                  color: AppColors.darkBlue,
                  offset: Offset(0, 3),
                  blurRadius: 0.2)
            ],
          ),
          height: height,
          width: context.width,
          child: Center(
            child: Text(
              stateFromEvent,
              style: context.theme.headline3.semiBold,
            ),
          ),
        );
      },
    );
  }
}
