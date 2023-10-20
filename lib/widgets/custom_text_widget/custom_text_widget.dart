import 'package:e_learning_app/extensions/context_extension.dart';
import 'package:e_learning_app/extensions/extensions.dart';
import 'package:flutter/material.dart';

import '../../utils/app_colors.dart';

class CustomLoginTextField extends StatefulWidget {
  final Icon icon;
  final bool passwordField;

  const CustomLoginTextField({
    super.key,
    required this.icon,
    this.passwordField = false,
  });

  @override
  State<CustomLoginTextField> createState() => _CustomLoginTextFieldState();
}

class _CustomLoginTextFieldState extends State<CustomLoginTextField> {
  bool obscureSwitch = true;
  final _textController = TextEditingController();

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.whiteSmock,
        border: Border.all(width: 1.5),
        borderRadius: BorderRadius.circular(15),
      ),
      height: 50,
      width: context.width,
      child: TextField(
        controller: _textController,
        onTap: () {},
        onTapOutside: ((event) {
          FocusScope.of(context).unfocus();
        }),
        obscureText: widget.passwordField == true ? obscureSwitch : false,
        obscuringCharacter: '*',
        decoration: InputDecoration(
          icon: widget.icon,
          iconColor: AppColors.lightBlue,
          hintText: widget.icon == const Icon(Icons.person)
              ? 'signInLogIn.emailHint'.tr()
              : 'signInLogIn.passwordHint'.tr(),
          hintStyle: context.theme.headline6.grayOption,
          border: InputBorder.none,
          suffixIconColor:
              obscureSwitch ? AppColors.lightBlue : AppColors.brightRed,
          suffixIcon: widget.passwordField == false
              ? const SizedBox()
              : IconButton(
                  icon: obscureSwitch == true
                      ? const Icon(Icons.visibility_off)
                      : const Icon(Icons.visibility),
                  onPressed: () {
                    // setState(() {
                    //   obscureSwitch = !obscureSwitch;
                    // });
                  },
                ),
        ),
        style: context.theme.headline6.chalkboardBlack,
      ).paddingOnly(left: 10),
    );
  }
}
