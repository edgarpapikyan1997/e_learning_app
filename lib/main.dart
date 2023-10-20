import 'package:e_learning_app/blocs/custom_button_bloc/custom_button_bloc.dart';
import 'package:e_learning_app/extensions/extensions.dart';
import 'package:e_learning_app/pages/welcome/welcome.dart';
import 'package:e_learning_app/utils/app_colors.dart';
import 'package:e_learning_app/utils/go_router/go_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'blocs/dot_indicator_bloc/dot_indicator_bloc.dart';
import 'blocs/welcome_bloc/welcome_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('en')],
      path: 'assets/translations',
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (_) => WelcomeBloc(),
          ),
          BlocProvider(
            create: (_) => DotIndicatorBloc(),
          ),
          BlocProvider(
            create: (_) => CustomButtonBloc(),
          ),
        ],
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
