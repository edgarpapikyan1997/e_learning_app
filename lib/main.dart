import 'dart:io';
import 'package:e_learning_app/blocs/bloc_providers/bloc_providers.dart';
import 'package:e_learning_app/blocs/custom_button_bloc/custom_button_bloc.dart';
import 'package:e_learning_app/blocs/sign_in_bloc/sign_in_bloc.dart';
import 'package:e_learning_app/extensions/extensions.dart';
import 'package:e_learning_app/utils/app_colors.dart';
import 'package:e_learning_app/utils/go_router/go_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'blocs/dot_indicator_bloc/dot_indicator_bloc.dart';
import 'blocs/welcome_bloc/welcome_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Platform.isAndroid
      ? await Firebase.initializeApp(
          options: const FirebaseOptions(
              apiKey: "AIzaSyBxMaIOAShGvXQGAC_u-5kn0JsO887Xw90",
              appId: "1:205233086782:android:20354cbbc0792461ad0c6f",
              messagingSenderId: "205233086782",
              projectId: "e-learning-app-98835"))
      : await Firebase.initializeApp();

  await EasyLocalization.ensureInitialized();

  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('en')],
      path: 'assets/translations',
      child: MultiBlocProvider(
        providers: AppBlocProviders.allBlocProviders,
        child: const MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(backgroundColor: AppColors.whiteSmock),
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
      ),
      themeMode: ThemeMode.light,
    );
  }
}
