import 'package:flutter/material.dart';
import 'ui/auth/screens/sign_in_screen.dart';
import 'ui/auth/screens/sign_up_screen.dart';
import 'ui/auth/screens/splash_screen.dart';
import 'ui/user_list/screens/user_detail_screen.dart';
import 'ui/user_list/screens/user_list_screen.dart';

class RouteGenerator {

  static Route<dynamic>? generateRoute(RouteSettings settings) {

    switch(settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case 'routeSignIn':
        return MaterialPageRoute(builder: (_) => const SignInScreen());
      case 'routeSignUp':
        return MaterialPageRoute(builder: (_) => const SignUpScreen());
      case 'routeUserList':
        return MaterialPageRoute(builder: (_) => const UserListScreen());
      case 'routeUserProfile':
        return MaterialPageRoute(builder: (_) => const UserDetailScreen());
      default:
        "Error";
    }
    return null;
  }

}