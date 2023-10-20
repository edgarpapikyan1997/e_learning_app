import 'package:e_learning_app/pages/home_page/home_page.dart';
import 'package:go_router/go_router.dart';
import '../../pages/sign_in/sign_in_page.dart';
import '../../pages/welcome/welcome.dart';

final GoRouter router = GoRouter(

  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const WelcomePage(),
      routes: [
        GoRoute(
          path: 'signIn',
          builder: (context, state) => const SignInPage(),
        ),
      ],
    ),
    GoRoute(
      path: '/homePage',
      builder: (context, state) => const HomePage(),
    ),
  ],
);

