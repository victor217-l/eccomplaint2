import 'package:eccomplaint2/features/home/complaint.dart';
import 'package:eccomplaint2/features/home/history.dart';
import 'package:eccomplaint2/features/home/home.dart';
import 'package:eccomplaint2/features/home/listofadmin.dart';
import 'package:eccomplaint2/features/home/menupage.dart';
import 'package:eccomplaint2/features/otpverification/otpverification.dart';
import 'package:eccomplaint2/features/registerscreen/Resetpasswo.dart';
import 'package:eccomplaint2/features/registerscreen/createyourprofile.dart';
import 'package:eccomplaint2/features/registerscreen/forgotpasswo.dart';
import 'package:eccomplaint2/features/registerscreen/login.dart';
import 'package:eccomplaint2/features/registerscreen/profilecreate.dart';
import 'package:eccomplaint2/features/registerscreen/registerscreen.dart';
import 'package:eccomplaint2/features/startupscreen/screen/startscreen2.dart';
import 'package:eccomplaint2/features/welcomepage/welcomepage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'features/profile/profilescren.dart';
import 'features/startupscreen/screen/startscreen3.dart';
import 'features/startupscreen/screen/startscreen4.dart';

Route<dynamic> generateRoute (RouteSettings routeSettings){
  switch(routeSettings.name){
    case StartScreen2.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
          builder: (_) => StartScreen2());
    case StartScreen3.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
          builder: (_) => StartScreen3());
    case StartScreen4.routeName:
      return MaterialPageRoute(
          settings: routeSettings,
          builder: (_) => StartScreen4());
    case RegisterScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
          builder: (_) => RegisterScreen());
    case HistoryofComplaint.routeName:
      return MaterialPageRoute(
          settings: routeSettings,
          builder: (_) => HistoryofComplaint());
    case ListOfAmin.routeName:
      return MaterialPageRoute(
          settings: routeSettings,
          builder: (_) => ListOfAmin());
   /* case CreateYourProfile.routeName:
      return MaterialPageRoute(
          settings: routeSettings,
          builder: (_) => CreateYourProfile()); */
    case ProfileCreate.routeName:
      return MaterialPageRoute(
          settings: routeSettings,
          builder: (_) => ProfileCreate());
    case  ResetPassword.routeName:
      return MaterialPageRoute(
          settings: routeSettings,
          builder: (_) => ResetPassword());
    case  LoginScreen.routeName:
      return MaterialPageRoute(
          settings: routeSettings,
          builder: (_) => LoginScreen());
    case  ForgotPassworScreen.routeName:
      return MaterialPageRoute(
          settings: routeSettings,
          builder: (_) => ForgotPassworScreen());
    case  WelcomePage.routeName:
      return MaterialPageRoute(
          settings: routeSettings,
          builder: (_) => WelcomePage());
    case  HomePage.routeName:
      return MaterialPageRoute(
          settings: routeSettings,
          builder: (_) => HomePage());
    case  MyProfile.routeName:
      return MaterialPageRoute(
          settings: routeSettings,
          builder: (_) => MyProfile());
    case  MenuPage.routeName:
      return MaterialPageRoute(
          settings: routeSettings,
          builder: (_) => MenuPage());
    case    OtpverificationScreen.routeName:
      return MaterialPageRoute(
          settings: routeSettings,
          builder: (_) => OtpverificationScreen());
    case    HomePage2.routeName:
      return MaterialPageRoute(
          settings: routeSettings,
          builder: (_) => HomePage2());


    default:
      return MaterialPageRoute(builder: (_) => Scaffold(
        body: Center(child: Text("page not ") ,),));

  }

}
