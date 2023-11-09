import 'package:e_learning_app/blocs/registration_bloc/register_events.dart';
import 'package:e_learning_app/blocs/registration_bloc/register_states.dart';
import 'package:e_learning_app/extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../blocs/registration_bloc/register_bloc.dart';
import '../../utils/app_colors.dart';
import '../methods_returning_widgets/sign_in_widgets.dart';

class CustomSignUpTextField extends StatefulWidget {
  final Icon icon;
  final bool passwordField;
  final String fieldName;

  const CustomSignUpTextField({
    Key? key,
    required this.icon,
    this.passwordField = false,
    required this.fieldName,
  }) : super(key: key);

  @override
  State<CustomSignUpTextField> createState() => _CustomSignUpTextFieldState();
}

class _CustomSignUpTextFieldState extends State<CustomSignUpTextField> {
  bool obscureSwitch = false;
  bool selectedField = false;
  final _textController = TextEditingController();

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterBloc, RegisterStates>(builder: (context, state) {
      return TextField(
        controller: _textController,
        onChanged: (value) {
          correctFieldFilling(
            fieldName: widget.fieldName,
            context: context,
            value: value,
          );
        },
        onTap: () {
          selectedField = true;
        },
        onTapOutside: ((event) {
          selectedField = false;
          FocusScope.of(context).unfocus();
        }),
        obscureText:
            widget.passwordField == true ? !obscureSwitch : obscureSwitch,
        obscuringCharacter: '*',
        decoration: InputDecoration(
          ///------------
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: const BorderSide(width: 1, color: AppColors.red)),
          focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: const BorderSide(width: 1, color: AppColors.red)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide:
                  const BorderSide(width: 1, color: AppColors.lightBlue)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(width: 1, color: AppColors.black)),
          errorText: state.nameError.isNotEmpty
              ? validateName(state.userName)
              : state.emailError.isNotEmpty
                  ? validatePassword(state.email)
                  : state.password.isNotEmpty
                      ? validatePassword(state.password)
                      : null,
          prefixIcon: widget.icon,
          iconColor: AppColors.lightBlue,
          hintText: hintTextChecker(fieldName: widget.fieldName),
          hintStyle: context.theme.headline6.grayOption,
          suffixIconColor: selectedField == true
              ? AppColors.lightBlue
              : AppColors.gray.withOpacity(0.8),
          suffixIcon: widget.passwordField == false
              ? const SizedBox()
              : IconButton(
                  icon: obscureSwitch == true
                      ? const Icon(Icons.visibility_off)
                      : const Icon(Icons.visibility),
                  onPressed: () {
                    /// MUST BE CHANGED TO REAL STATE CHANGE

                    setState(() {
                      obscureSwitch = !obscureSwitch;
                    });
                    // BlocProvider.of<SignInBloc>(context)
                    //     .add(PasswordObscureEvent(obscureSwitch));
                  },
                ),
        ),
        style: context.theme.headline6.chalkboardBlack,
      );
    });
  }

  String? checkErrors(String? nameError, String? emailError,
      String? passwordError, String? confirmError) {
    if (nameError!.isNotEmpty) {
      return nameError;
    }
    if (emailError!.isNotEmpty) {
      return emailError;
    }
    if (passwordError!.isNotEmpty) {
      return passwordError;
    }
    if (confirmError!.isNotEmpty) {
      return confirmError;
    }
    return null;
  }

  void correctFieldFilling(
      {required BuildContext context,
      required String value,
      required String fieldName}) {
    if (fieldName == 'profile.userName'.tr()) {
      BlocProvider.of<RegisterBloc>(context)
          .add(UserNameEvent(userName: value));
    }
    if (fieldName == 'signInLogIn.email'.tr()) {
      BlocProvider.of<RegisterBloc>(context).add(EmailEvent(userEmail: value));
    }
    if (fieldName == 'signInLogIn.password'.tr()) {
      BlocProvider.of<RegisterBloc>(context)
          .add(PasswordEvent(userPassword: value));
    }
    if (fieldName == 'signInLogIn.confirm'.tr()) {
      BlocProvider.of<RegisterBloc>(context)
          .add(ConfirmPassEvent(confirmPass: value));
    }
  }

  String? hintTextChecker({String? fieldName}) {
    if (fieldName == 'profile.userName'.tr()) {
      return 'signInLogIn.enterName'.tr();
    }
    if (fieldName == 'signInLogIn.email'.tr()) {
      return 'signInLogIn.emailHint'.tr();
    }
    if (fieldName == 'signInLogIn.password'.tr()) {
      return 'signInLogIn.passwordHint'.tr();
    }
    if (fieldName == 'signInLogIn.confirm'.tr()) {
      return 'signInLogIn.confirmPass'.tr();
    }
    return '';
  }
}
