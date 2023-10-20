import 'package:e_learning_app/extensions/extensions.dart';
import 'package:e_learning_app/pages/sign_in/sign_in_page_widgets/sign_in_widgets.dart';
import 'package:e_learning_app/widgets/third_party_login/third_party_login.dart';
import 'package:flutter/material.dart';

import '../../utils/app_colors.dart';
import '../../widgets/custom_text_widget/custom_text_widget.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        shadowColor: AppColors.white,
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.white,
        title: Center(
          child: Text(
            'signInLogIn.signIn'.tr(),
            style: context.theme.headline5.chalkboardBlack.semiBold,
          ),
        ),
      ),
      body: SingleChildScrollView(
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
              margin: const EdgeInsets.only(top: 66,),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'signInLogIn.email'.tr(),
                    style: context.theme.headline6.grayOption,
                  ),
                  const CustomLoginTextField(icon: Icon(Icons.person)),
                  const SizedBox(height: 40,),
                  Text(
                    'signInLogIn.password'.tr(),
                    style: context.theme.headline6.grayOption,
                  ),
                  const CustomLoginTextField(icon: Icon(Icons.lock_rounded), passwordField: true),
                ],
              ),
            ),
          ],
        ).paddingHorizontal(25),
      ),
    );
  }
}
