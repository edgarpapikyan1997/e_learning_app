import 'package:e_learning_app/blocs/registration_bloc/register_states.dart';
import 'package:e_learning_app/extensions/extensions.dart';
import 'package:e_learning_app/pages/register/register_widgets/register_controller.dart';
import 'package:e_learning_app/widgets/methods_returning_widgets/progress_methods.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../blocs/registration_bloc/register_bloc.dart';
import '../../utils/app_colors.dart';
import '../../widgets/custom_button_widget/custom_button.dart';
import '../../widgets/custom_text_field_widget/custom_signup_text_field.dart';
import '../../widgets/methods_returning_widgets/custom_app_bar.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterBloc, RegisterStates>(builder: (context, state) {
      return Scaffold(
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(50),
            child: customAppBar(
              toPage: 'signIn',
              context,
              autoLeading: true,
              title: 'signInLogIn.register'.tr(),
            )),
        backgroundColor: AppColors.whiteSmock,
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  'signInLogIn.registerAdvice'.tr(),
                  style: context.theme.headline6.grayOption,
                ),
              ).paddingOnly(top: 30),
              Container(
                margin: const EdgeInsets.only(
                  top: 33,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'profile.userName'.tr(),
                      style: context.theme.headline6.grayOption,
                    ).paddingOnly(bottom: 5),
                    CustomSignUpTextField(
                      icon: const Icon(Icons.person),
                      fieldName: 'profile.userName'.tr(),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Text(
                      'signInLogIn.email'.tr(),
                      style: context.theme.headline6.grayOption,
                    ).paddingOnly(bottom: 5),
                    CustomSignUpTextField(
                      icon: const Icon(Icons.person),
                      fieldName: 'signInLogIn.email'.tr(),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Text(
                      'signInLogIn.password'.tr(),
                      style: context.theme.headline6.grayOption,
                    ).paddingOnly(bottom: 5),
                    CustomSignUpTextField(
                      icon: const Icon(Icons.lock_rounded),
                      passwordField: true,
                      fieldName: 'signInLogIn.password'.tr(),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Text(
                      'signInLogIn.confirm'.tr(),
                      style: context.theme.headline6.grayOption,
                    ).paddingOnly(bottom: 5),
                    CustomSignUpTextField(
                      icon: const Icon(Icons.lock_rounded),
                      passwordField: true,
                      fieldName: 'signInLogIn.confirm'.tr(),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      'signInLogIn.registerAgreement'.tr(),
                      style: context.theme.headline7.grayOption,
                    ).paddingOnly(bottom: 100),
                    GestureDetector(
                      onTap: () {
                        checkValidity(
                          context: context,
                          userName: state.userName,
                          email: state.email,
                          password: state.password,
                          confirm: state.confirm,
                        );
                      },
                      child: CustomButton(
                        height: 50,
                        borderRadius: 15,
                        buttonColor: AppColors.lightBlue,
                        buttonShadowColor: AppColors.darkBlue,
                        buttonTitle: 'signInLogIn.register'.tr(),
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: context.bottomPadding + 50,
              ),
            ],
          ).paddingHorizontal(25),
        ),
      );
    });
  }
}

void checkValidity({
  required BuildContext context,
  required String userName,
  required String email,
  required String password,
  required String confirm,
}) {
  circularProgress(context);
  Future.delayed(const Duration(seconds: 2), () {
    RegisterController(
            context: context,
            userName: userName,
            email: email,
            password: password,
            confirm: confirm)
        .handleEmailRegister();
  });
}
