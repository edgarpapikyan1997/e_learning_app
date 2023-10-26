import 'package:e_learning_app/blocs/custom_button_bloc/custom_button_bloc.dart';
import 'package:e_learning_app/extensions/extensions.dart';
import 'package:e_learning_app/pages/welcome/welcome_page_widget/welcome_page_widget.dart';
import 'package:e_learning_app/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../blocs/dot_indicator_bloc/dot_indicator_bloc.dart';
import '../../blocs/welcome_bloc/welcome_bloc.dart';
import '../../utils/app_colors.dart';
import '../../widgets/custom_button_widget/custom_button.dart';
import '../../widgets/dot_indicator/dot_indicator.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  final PageController pageController = PageController();
  final int welcomePagesCount = 3;
  String? buttonTitle;

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<WelcomeBloc, WelcomeState>(builder: (context, state) {
        int currentState = (state as WelcomeCurrentPage).currentIndex;
        return SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              SizedBox(
                  width: context.width,
                  height: context.height / 1.4,
                  child: PageView(
                    onPageChanged: (index) {
                      currentState = index;
                      BlocProvider.of<DotIndicatorBloc>(context)
                          .add(DotIndicatorEventChanged(index: currentState));
                      if (index == 2) {
                        buttonTitle = 'commonWords.getStarted'.tr();
                        BlocProvider.of<CustomButtonBloc>(context).add(
                            ButtonTitleChangeEvent(
                                newTitle: buttonTitle as String));
                      } else {
                        buttonTitle = 'commonWords.next'.tr();
                        BlocProvider.of<CustomButtonBloc>(context).add(
                            ButtonTitleChangeEvent(
                                newTitle: buttonTitle as String));
                      }
                    },
                    controller: pageController,
                    scrollDirection: Axis.horizontal,
                    children: [
                      WelcomePageWidget(
                          color: AppColors.lightBlue,
                          headerText: 'welcomePagesText.firstPageHeader'.tr(),
                          secondText:
                              'welcomePagesText.firstPageUnderText'.tr(),
                          image: Image.asset(
                            Assets.reading,
                            fit: BoxFit.cover,
                          )),
                      WelcomePageWidget(
                          color: AppColors.lightBlue,
                          headerText: 'welcomePagesText.secondPageHeader'.tr(),
                          secondText:
                              'welcomePagesText.secondPageUnderText'.tr(),
                          image: Image.asset(
                            Assets.boy,
                            fit: BoxFit.cover,
                          )),
                      WelcomePageWidget(
                        color: AppColors.lightBlue,
                        headerText: 'welcomePagesText.thirdPageHeader'.tr(),
                        secondText: 'welcomePagesText.thirdPageUnderText'.tr(),
                        image: Image.asset(
                          Assets.man,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  )),
              DotIndicator(
                dotCount: welcomePagesCount,
                currentIndex: currentState,
                regularColor: AppColors.grayRegular,
                selectedColor: AppColors.lightBlue,
              ).paddingOnly(
                top: 35,
              ),
              GestureDetector(
                onTap: () {
                  BlocProvider.of<DotIndicatorBloc>(context)
                      .add(DotIndicatorEventChanged(index: currentState));
                  pageController.animateToPage(
                    currentState += 1,
                    duration: const Duration(milliseconds: 800),
                    curve: Curves.decelerate,
                  );
                  if (currentState == welcomePagesCount) {
                    currentState -= 1;
                  }
                  if (buttonTitle == 'commonWords.getStarted'.tr()) {
                    context.go('/signIn');
                  }
                },
                child: const CustomButton(),
              ).paddingOnly(right: 25, left: 25, top: 40),
            ],
          ),
        );
      }),
    );
  }
}
