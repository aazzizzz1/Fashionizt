import 'package:fashionizt/pages/home_pages.dart';
import 'package:fashionizt/pages/login_screen.dart';
import 'package:fashionizt/pages/splash_screen.dart';

const String SplashRoute = "/splash";
const String HomeRoute = "/home";
const String LoginRoute = "/login";

final routes = {
  SplashRoute: (context) => SplashScreen(),
  HomeRoute: (context) => HomePages(),
  LoginRoute: (context) => LoginScreen()
};