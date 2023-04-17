import 'package:eccomplaint2/features/home/complaint.dart';
import 'package:eccomplaint2/features/otpverification/otpverification.dart';
import 'package:eccomplaint2/features/startupscreen/screen/startupscreen.dart';
import 'package:eccomplaint2/router.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'features/home/home.dart';
import 'features/profile/profilescren.dart';
import 'features/provider/provider.dart';


void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => UserProvider(),),
  ]  ,child: const MyApp())
  );}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      onGenerateRoute: (settings) => generateRoute(settings) ,
      home: const StartScreen1()
    );
  }
}
