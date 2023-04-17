import 'package:eccomplaint2/commons/custombutton.dart';
import 'package:eccomplaint2/commons/customtextfil.dart';
import 'package:eccomplaint2/features/home/home.dart';
import 'package:eccomplaint2/features/profile/profilescren.dart';
import 'package:eccomplaint2/features/registerscreen/login.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../commons/iconnav.dart';

class WelcomePage extends StatefulWidget {
  static const String routeName = '/WelcomePage';
  const WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePage();
}

class _WelcomePage extends State<WelcomePage> {


  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
              child:
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    SizedBox(height: 50,),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40.0),
                      child: Image.asset("image/Shiny Happy Standing.png",  height: 200, width: 200,
                        fit: BoxFit.contain,),
                    ),

                    SizedBox(height: 12,),

                    Text("Welcome to the app", style: TextStyle(fontSize: 20, color: Color.fromARGB(
                        255, 21, 43, 75)),),

                    SizedBox(height: 12),
                    Text("This is the home",),
                    SizedBox(height: 10,),
                    Text("time to start exploring "),



                    SizedBox(height: 30,),


                      Align(
                        alignment: Alignment.center,
                          child: Row(
                            children: [
                              GestureDetector(
                                  onTap: () => Navigator.pushNamed(context, HomePage.routeName ),
                                  child: NextLogo1(text: "Home",)),

                              SizedBox(width: 170,),


                            ],
                          ),


                      )],
                ),
              )
          ),

        ],
      ),
    );
  }
}
