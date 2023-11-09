import 'package:e_learning_app/pages/register/register_page.dart';
import 'package:go_router/go_router.dart';
import '../../pages/application_page/application_page.dart';
import '../../pages/sign_in/sign_in_page.dart';
import '../../pages/welcome/welcome.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      /// IN THE END OF DEVELOPING IT SHOULD BE CHANGE TO NORMAL ENTERING
      name: 'app_page',
      path: '/',
      builder: (context, state) => const ApplicationPage(),
      routes: [
        GoRoute(
          path: 'signIn',
          builder: (context, state) => const SignInPage(),
        ),
        GoRoute(
          path: 'ApplicationPage',
          builder: (context, state) => const ApplicationPage(),
        ),
        GoRoute(
          path: 'registerPage',
          builder: (context, state) => const RegisterPage(),
        ),
        GoRoute(
          path: 'ApplicationPage',
          builder: (context, state) => const ApplicationPage(),
        ),
      ],
    ),
  ],
);
