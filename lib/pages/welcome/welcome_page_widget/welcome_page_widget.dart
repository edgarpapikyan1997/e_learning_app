import 'package:e_learning_app/extensions/extensions.dart';
import 'package:flutter/material.dart';


class WelcomePageWidget extends StatelessWidget {
  final Color color;
  final String headerText;
  final String secondText;
  final Image image;

  const WelcomePageWidget(
      {super.key,
      required this.color,
      required this.headerText,
      required this.secondText,
      required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          image,
          Text(
            headerText,
            style: context.theme.headline2.semiBold,
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 15,
          ),
          Text(
            secondText,
            style: context.theme.headline6,
            textAlign: TextAlign.center,
          ),
        ],
      ).paddingOnly(left: 15, right: 15),
    );
  }
}
