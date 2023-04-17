import 'package:eccomplaint2/commons/custombutton.dart';
import 'package:eccomplaint2/commons/customtextfil.dart';
import 'package:eccomplaint2/features/registerscreen/Resetpasswo.dart';
import 'package:eccomplaint2/features/registerscreen/login.dart';
import 'package:eccomplaint2/features/registerscreen/serivce/registerservice.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../commons/iconnav.dart';

class ForgotPassworScreen extends StatefulWidget {
  static const String routeName = '/forgotpa';
  const ForgotPassworScreen({Key? key}) : super(key: key);

  @override
  State<ForgotPassworScreen> createState() => _ForgotPassworScreenScreenState();
}

class _ForgotPassworScreenScreenState extends State<ForgotPassworScreen> {

  final _forgotpasswouser = GlobalKey<FormState>();

  final RegisterService registerService = RegisterService();


  final TextEditingController _forgotpasswoController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _forgotpasswoController.dispose();
  }

  void forgot() async {
    registerService.forgotPassword(context: context, forgotPassword: _forgotpasswoController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
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
                        child: Image.asset("image/undraw_my_password_re_ydq7 (1) 1.png",  height: 200, width: 200,
                          fit: BoxFit.contain,),
                      ),

                      SizedBox(height: 30,),

                          Align(
                            alignment: Alignment.topLeft,
                            child: Text("Forgot", style: TextStyle(fontSize: 20, color: Color.fromARGB(
                                255, 21, 43, 75)),),
                          ),
                         SizedBox(height: 3,),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text("Password?", style: TextStyle(fontSize: 20, color: Color.fromARGB(
                                255, 21, 43, 75)) ,),
                          ),
                          SizedBox(height: 7,),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text("Don’t worry ! It happens. Please enter the phone", style: TextStyle(fontSize: 12, color: Color.fromARGB(
                                255, 19, 23, 28)), textAlign: TextAlign.start,),
                          ),
                          SizedBox(height: 3,),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text("number we will send the OTP in this phone number.", style: TextStyle(fontSize: 12,
                                color: Color.fromARGB(
                                255, 19, 23, 28)), textAlign: TextAlign.start,),
                          ),
                          SizedBox(height: 5,),







                    /*  Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 165.0),
                        child: Form(
                          key: _forgotpasswouser ,
                          child:  Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [

                              SizedBox(height: 12,),
                             // CustomButton2(text: "Continue", colors: Colors.green)

                            ],

                          )  ,
                        )

                        ,
                      ),*/

                      Container(
                        child: Form(
                          key: _forgotpasswouser,
                            child: CustomTextfiel(controller: _forgotpasswoController , hintext: 'Email')),
                      ),

                      SizedBox(height: 10,),
                      CustomButton2(text: "Continue", colors: Colors.green, onTap: () {
                        if(_forgotpasswouser.currentState!.validate()){
                          forgot();
                        }

                      },)







                    ],
                  ),
                )
            ),

          ],
        ),

    );
  }
}
