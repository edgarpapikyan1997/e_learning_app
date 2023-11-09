import 'package:e_learning_app/extensions/context_extension.dart';
import 'package:e_learning_app/widgets/methods_returning_widgets/bottom_bar_items.dart';
import 'package:flutter/material.dart';

import '../../utils/app_colors.dart';
import '../../utils/assets.dart';

class ApplicationPage extends StatefulWidget {
  const ApplicationPage({super.key});

  @override
  State<ApplicationPage> createState() => _ApplicationPageState();
}

class _ApplicationPageState extends State<ApplicationPage> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildPage(_index),
      bottomNavigationBar: SizedBox(
        height: context.bottomPadding + 60,
        child: BottomNavigationBar(
          currentIndex: _index,
          selectedItemColor: AppColors.lightBlue,
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          onTap: (value) {
            setState(() {
              _index = value;
            });
          },
          items: [
            BottomNavigationBarItem(
                label: 'Home',
                activeIcon: SizedBox(
                    height: 18,
                    width: 18,
                    child: Image.asset(
                      Assets.homeIcon,
                      fit: BoxFit.cover,
                      color: AppColors.lightBlue,
                    )),
                icon: SizedBox(
                  width: 15,
                  height: 15,
                  child: Image.asset(Assets.homeIcon, fit: BoxFit.cover),
                )),
            BottomNavigationBarItem(
                label: 'Search',
                activeIcon: SizedBox(
                    height: 18,
                    width: 18,
                    child: Image.asset(
                      Assets.searchIcon2,
                      fit: BoxFit.cover,
                      color: AppColors.lightBlue,
                    )),
                icon: SizedBox(
                  width: 15,
                  height: 15,
                  child: Image.asset(Assets.searchIcon2, fit: BoxFit.cover),
                )),
            BottomNavigationBarItem(
                label: 'Course',
                activeIcon: SizedBox(
                    height: 18,
                    width: 18,
                    child: Image.asset(
                      Assets.playCircleIcon,
                      fit: BoxFit.cover,
                      color: AppColors.lightBlue,
                    )),
                icon: SizedBox(
                  width: 15,
                  height: 15,
                  child: Image.asset(Assets.playCircleIcon, fit: BoxFit.cover),
                )),
            BottomNavigationBarItem(
                label: 'Chat',
                activeIcon: SizedBox(
                    height: 18,
                    width: 18,
                    child: Image.asset(
                      Assets.messageIcon,
                      fit: BoxFit.cover,
                      color: AppColors.lightBlue,
                    )),
                icon: SizedBox(
                  width: 15,
                  height: 15,
                  child: Image.asset(Assets.messageIcon, fit: BoxFit.cover),
                )),
            BottomNavigationBarItem(
                label: 'Profile',
                activeIcon: SizedBox(
                    height: 18,
                    width: 18,
                    child: Image.asset(
                      Assets.personIcon,
                      fit: BoxFit.cover,
                      color: AppColors.lightBlue,
                    )),
                icon: SizedBox(
                  width: 15,
                  height: 15,
                  child: Image.asset(Assets.personIcon, fit: BoxFit.cover),
                )),
          ],
        ),
      ),
    );
  }
}
