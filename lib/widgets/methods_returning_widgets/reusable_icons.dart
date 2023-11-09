import 'package:e_learning_app/extensions/extensions.dart';
import 'package:flutter/cupertino.dart';

Widget reusableIcons({
  double? height,
  double? width,
  Image? image,
}) {
  return GestureDetector(
    onTap: () {
      print('printed');
    },
    child: SizedBox(
      height: 50,
      width: 50,
      child: image,
    ).paddingHorizontal(10),
  );
}