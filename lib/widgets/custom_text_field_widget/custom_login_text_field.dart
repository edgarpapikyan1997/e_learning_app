import 'package:e_learning_app/blocs/sign_in_bloc/sign_in_state.dart';
import 'package:e_learning_app/extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../blocs/sign_in_bloc/sign_in_bloc.dart';
import '../../blocs/sign_in_bloc/sign_in_event.dart';
import '../../utils/app_colors.dart';

class CustomLoginTextField extends StatefulWidget {
  final Icon icon;
  final bool passwordField;

  const CustomLoginTextField({
    Key? key,
    required this.icon,
    this.passwordField = false,
  }) : super(key: key);

  @override
  State<CustomLoginTextField> createState() => _CustomLoginTextFieldState();
}

class _CustomLoginTextFieldState extends State<CustomLoginTextField> {
  bool obscureSwitch = true;
  bool selectedField = false;
  final _textController = TextEditingController();

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(

      controller: _textController,
      onChanged: (value) {
        widget.passwordField == false
            ? BlocProvider.of<SignInBloc>(context).add(SignInEmailEvent(value))
            : BlocProvider.of<SignInBloc>(context)
                .add(SignInPasswordEvent(value));
      },
      onTap: () {
        selectedField = true;
      },
      onTapOutside: ((event) {
        selectedField = false;
        FocusScope.of(context).unfocus();
      }),
      obscureText: widget.passwordField ? obscureSwitch : !obscureSwitch,
      obscuringCharacter: '*',
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(width: 1, color: AppColors.lightBlue)),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(width: 1, color: AppColors.black)),
        prefixIcon: widget.icon,
        iconColor: AppColors.lightBlue,
        hintText: widget.icon == const Icon(Icons.person)
            ? 'signInLogIn.emailHint'.tr()
            : 'signInLogIn.passwordHint'.tr(),
        hintStyle: context.theme.headline6.grayOption,
        border: InputBorder.none,
        suffixIconColor: selectedField
            ? AppColors.lightBlue
            : AppColors.gray.withOpacity(0.8),
        suffixIcon: widget.passwordField == false
            ? const SizedBox()
            : IconButton(
                icon: obscureSwitch == true
                    ? const Icon(Icons.visibility_off)
                    : const Icon(Icons.visibility),
                onPressed: () {
                  obscureSwitch = !obscureSwitch;
                  BlocProvider.of<SignInBloc>(context).add(PasswordObscureEvent(obscureSwitch));
                },
              ),
      ),
      style: context.theme.headline6.chalkboardBlack,
    );
  }
}
