import 'package:eccomplaint2/commons/custombutton.dart';
import 'package:eccomplaint2/commons/customtextfil.dart';
import 'package:eccomplaint2/features/registerscreen/createyourprofile.dart';
import 'package:eccomplaint2/features/registerscreen/login.dart';
import 'package:eccomplaint2/features/welcomepage/welcomepage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../commons/iconnav.dart';

class ProfileCreate extends StatefulWidget {
  static const String routeName = '/profileCreate';
  const ProfileCreate({Key? key}) : super(key: key);

  @override
  State<ProfileCreate> createState() => _ProfileCreate();
}

class _ProfileCreate extends State<ProfileCreate> {


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
                      child: Image.asset("image/Charco Launch.png",  height: 200, width: 200,
                        fit: BoxFit.contain,),
                    ),

                    SizedBox(height: 30,),

                    Text("Profile Created", style: TextStyle(fontSize: 20, color: Color.fromARGB(
                        255, 21, 43, 75)),),
                    SizedBox(height: 12),
                    Text("All your content in one place its",),
                    SizedBox(height: 10,),
                    Text("time to start exploring "),


                    SizedBox(height: 30,),
                   CustomButton2(text: "Get Started", colors: Colors.green, onTap: () {
                     Navigator.pushNamed(context, WelcomePage.routeName);
                   }),

                    SizedBox(height: 12,),
                    Row(
                      children: [
                        Text("Update the profile",
                          style: TextStyle(fontSize: 12, color: Colors.black),),
                        SizedBox(width: 5,),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, MyProfile.routeName);
                          },
                          child: Text(
                              "Your profile",
                          ),
                        )
                      ],
                    )

                   // CustomButton2(text: "Get started", colors: Colors.green)




                  ],
                ),
              )
          ),

        ],
      ),
    );
  }
}
