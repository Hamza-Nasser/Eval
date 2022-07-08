import 'package:eval/utilities/routing/routes.dart';
import 'package:eval/views/screens/auth/cubit/auth_cubit.dart';
import 'package:eval/views/screens/auth/forgot_pass_screen.dart';
import 'package:eval/views/screens/auth/login_screen.dart';
import 'package:eval/views/screens/auth/register_screen.dart';
import 'package:eval/views/screens/mainlayout/cubit/cubit.dart';
import 'package:eval/views/screens/mainlayout/edit_profile/edit_profile_screen.dart';
import 'package:eval/views/screens/mainlayout/main_layout_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  final _authCubit = AuthCubit();
  late AppCubit appCubit = AppCubit()..getUserData();

  Route<dynamic> onGenerate(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.loginScreenRoute:
        return CupertinoPageRoute(
            builder: ((context) => BlocProvider.value(
                  value: _authCubit,
                  child: const LoginScreen(),
                )));

      case AppRoutes.registerScreenRoute:
        return CupertinoPageRoute(
            builder: ((context) => BlocProvider.value(
                value: _authCubit, child: const RegisterScreen())));
      case AppRoutes.forgotPassScreenRoute:
        return CupertinoPageRoute(
            builder: ((context) => BlocProvider.value(
                value: _authCubit, child: const ForgotPassScreen())));

      case AppRoutes.mainLayoutScreenRoute:
        return CupertinoPageRoute(
            builder: (context) => BlocProvider.value(
                  value: appCubit,
                  child: const MainLayoutScreen(),
                ));
      case AppRoutes.editProfileScreenRoute:
        return CupertinoPageRoute(
            builder: (context) => BlocProvider.value(
                  value: appCubit,
                  child: const EditProfileScreen(),
                ));
      // return CupertinoPageRoute(

      //   builder: (context) {

      //       return const MainLayoutScreen();
      //   }

      default:
        return CupertinoPageRoute(
            builder: ((context) => BlocProvider.value(
                value: _authCubit, child: const ForgotPassScreen())));
    }
  }

  void dispose() {
    appCubit.close();
    _authCubit.close();
  }
}
