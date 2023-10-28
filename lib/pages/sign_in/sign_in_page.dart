import 'package:e_learning_app/blocs/sign_in_bloc/sign_in_bloc.dart';
import 'package:e_learning_app/blocs/sign_in_bloc/sign_in_state.dart';
import 'package:e_learning_app/extensions/extensions.dart';
import 'package:e_learning_app/pages/sign_in/sign_in_page_widgets/sign_in_controller.dart';
import 'package:e_learning_app/pages/sign_in/sign_in_page_widgets/sign_in_widgets.dart';
import 'package:e_learning_app/widgets/third_party_login/third_party_login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../utils/app_colors.dart';
import '../../widgets/custom_button_widget/custom_button.dart';
import '../../widgets/custom_text_field_widget/custom_login_text_field.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignInBloc, SignInState>(builder: (context, state) {
      var email = (state as SignInDataState).email;
      var password = state.password;
      return Scaffold(
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(50),
            child: customAppBar(
              context,
              title: 'signInLogIn.signIn'.tr(),
            )),
        backgroundColor: AppColors.whiteSmock,
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const ThirdPartyLogin(),
              Center(
                child: Text(
                  'signInLogIn.loginAdvice'.tr(),
                  style: context.theme.headline6.grayOption,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(
                  top: 33,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'signInLogIn.email'.tr(),
                      style: context.theme.headline6.grayOption,
                    ).paddingOnly(bottom: 5),
                    const CustomLoginTextField(
                      icon: Icon(Icons.person),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Text(
                      'signInLogIn.password'.tr(),
                      style: context.theme.headline6.grayOption,
                    ).paddingOnly(bottom: 5),
                    const CustomLoginTextField(
                      icon: Icon(Icons.lock_rounded),
                      passwordField: true,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Text(
                        'signInLogIn.forgot'.tr(),
                        style: context.theme.headline8.chalkboardBlack,
                      ),
                    ).paddingOnly(bottom: 100),
                    GestureDetector(
                      onTap: () {
                        String? validate = validateCheck(
                            checkEmailVal: email,
                            checkPasswordVal: password) as String?;
                        if (validate == '') {
                          SignInController(
                            context: context,
                            emailAddress: email,
                            password: password,
                          ).handleSignIn('signInLogIn.email'.tr());
                          print(email);
                          print(password);
                        }
                        else {

                        }
                      },
                      child: CustomButton(
                        height: 50,
                        borderRadius: 15,
                        buttonColor: AppColors.lightBlue,
                        buttonShadowColor: AppColors.darkBlue,
                        buttonTitle: 'signInLogIn.logIn'.tr(),
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: CustomButton(
                        height: 50,
                        borderRadius: 15,
                        buttonColor: AppColors.whiteSmock,
                        buttonShadowColor: AppColors.gray.withOpacity(0.2),
                        buttonTitle: 'signInLogIn.register'.tr(),
                      ),
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

Future<String?> validateCheck({
  String? checkEmailVal,
  String? checkPasswordVal,
}) async {
  if (checkEmailVal!.isEmpty && checkPasswordVal!.isEmpty) {
    return 'signInLogIn.emptyFields'.tr();
  } else {
    String? emailValidation = await validateEmail(checkEmailVal);
    String? passwordValidation = await validatePassword(checkPasswordVal);
    return emailValidation != null && passwordValidation != null
        ? ''
        : emailValidation ?? passwordValidation;
  }
}
