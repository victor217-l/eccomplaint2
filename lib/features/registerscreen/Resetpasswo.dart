import 'package:eccomplaint2/commons/custombutton.dart';
import 'package:eccomplaint2/commons/customtextfil.dart';
import 'package:eccomplaint2/features/registerscreen/forgotpasswo.dart';
import 'package:eccomplaint2/features/registerscreen/login.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../commons/iconnav.dart';

class ResetPassword extends StatefulWidget {
  static const String routeName = '/resetPassword';
  const ResetPassword({Key? key}) : super(key: key);

  @override
  State<ResetPassword> createState() => _ResetPassword();
}

class _ResetPassword extends State<ResetPassword> {

  final _resetpasswor = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
              child:
              Column(
                children: [
                  SizedBox(height: 50,),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40.0),
                    child: Image.asset("image/Tech Life Management.png",  height: 200, width: 200,
                      fit: BoxFit.contain,),
                  ),

                  SizedBox(height: 30,),
                  Column(
                    children: [
                      Text("Reset Paasword", style: TextStyle(fontSize: 20, color: Color.fromARGB(
                          255, 21, 43, 75)),),

                    ],
                  ),


                  Container(
                    height: 150,
                    width: double.infinity,
                    color: Colors.white,
                    child: Form(
                      key: _resetpasswor,

                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomTextfiel(controller: _emailController  , hintext: 'Name'),
                          SizedBox(height: 6,),
                          CustomButton2(text: "Continue", colors: Colors.green, onTap: () =>
                              Navigator.pushNamed(context, LoginScreen.routeName),)


                        ],

                      )  ,
                    ),

                  ),


                  SizedBox(height: 10,),
                  Row(
                    children: [
                      GestureDetector(
                          onTap: () => Navigator.pushNamed(context, ForgotPassworScreen.routeName ),
                          child:
                          Text("Forgot password?", style: TextStyle(color: Colors.green),)),

                    ],
                  )




                ],
              )
          ),

        ],
      ),
    );
  }
}
