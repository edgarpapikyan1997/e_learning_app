import 'package:e_learning_app/extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/dot_indicator_bloc/dot_indicator_bloc.dart';

class DotIndicator extends StatelessWidget {
  final int dotCount;
  final Color regularColor;
  final Color selectedColor;
  final int currentIndex;

  const DotIndicator(
      {super.key,
      required this.dotCount,
      required this.regularColor,
      required this.selectedColor,
      required this.currentIndex});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DotIndicatorBloc, DotIndicatorState>(
      builder: ( context,  state) {
        final blocCurrentState = (state as DotCurrentIndex).dotCurrentIndex;
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            for (var i = 0; i < dotCount; ++i)
              Container(
                decoration: BoxDecoration(
                  color: i == blocCurrentState ? selectedColor : regularColor,
                  borderRadius: BorderRadius.circular(8),
                ),
                width: i == blocCurrentState ? 15 : 10,
                height: 10,
              ).paddingHorizontal(8),
          ],
        );
      }
    );
  }
}
