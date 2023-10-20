import 'package:e_learning_app/extensions/widget_extension.dart';
import 'package:flutter/material.dart';

import '../../pages/sign_in/sign_in_page_widgets/sign_in_widgets.dart';
import '../../utils/assets.dart';

class ThirdPartyLogin extends StatelessWidget {
  const ThirdPartyLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            reusableIcons(
              height: 40,
              width: 40,
              image: Image.asset(Assets.googleIcon),
            ),
            reusableIcons(
              height: 40,
              width: 40,
              image: Image.asset(Assets.appleIcon),
            ),
            reusableIcons(
              height: 40,
              width: 40,
              image: Image.asset(Assets.facebookIcon),
            ),
          ],
        ),
      ),
    ).paddingOnly(top: 40, bottom: 20);
  }
}
