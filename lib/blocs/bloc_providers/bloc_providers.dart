import 'package:flutter_bloc/flutter_bloc.dart';

import '../custom_button_bloc/custom_button_bloc.dart';
import '../dot_indicator_bloc/dot_indicator_bloc.dart';
import '../sign_in_bloc/sign_in_bloc.dart';
import '../welcome_bloc/welcome_bloc.dart';

class AppBlocProviders {
  static get allBlocProviders => [
        BlocProvider(
          lazy: false,
          create: (context) => WelcomeBloc(),
        ),
        BlocProvider(
          create: (_) => DotIndicatorBloc(),
        ),
        BlocProvider(
          create: (_) => CustomButtonBloc(),
        ),
        BlocProvider(
          create: (context) => SignInBloc(),
        ),
      ];
}
