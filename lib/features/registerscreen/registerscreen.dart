import 'package:eccomplaint2/commons/custombutton.dart';
import 'package:eccomplaint2/commons/customtextfil.dart';
import 'package:eccomplaint2/features/otpverification/otpverification.dart';
import 'package:eccomplaint2/features/registerscreen/createyourprofile.dart';
import 'package:eccomplaint2/features/registerscreen/login.dart';
import 'package:eccomplaint2/features/registerscreen/serivce/registerservice.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../commons/iconnav.dart';

class RegisterScreen extends StatefulWidget {
  static const String routeName = '/regsterscreen';
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {


  final _registeruser = GlobalKey<FormState>();


  
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _countryController = TextEditingController();

  final RegisterService registerService = RegisterService();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();

  }



  void registerDriver(){
    registerService.signUpUser(
      context: context,
      email: _emailController.text,
      password: _passwordController.text,
    );
  }

  bool isLoading = false;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              SizedBox(height: 60,),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40.0),
                child: Image.asset("image/Tech Life Chat.png",  height: 200, width: 200,
                  fit: BoxFit.contain,),
              ),

              SizedBox(height: 30,),

             Align(
               alignment: Alignment.topLeft,
              child: Text("Register", style: TextStyle(fontSize: 20, color: Color.fromARGB(
                  255, 21, 43, 75),
                  fontWeight: FontWeight.w600),),

             ),
             SizedBox(height: 12,),



             Container(
               height: 150,
               width: double.infinity,
               color: Colors.white,
                    child: Form(
                      key: _registeruser ,

                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomTextfiel(controller: _emailController , hintext: 'Email'),
                            SizedBox(height: 6,),
                            PasswordFieldState(controller: _passwordController, hintext: "Password"),
                            SizedBox(height: 6,),
                            ElevatedButton(
                              style:ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(12.0))),
                                  minimumSize: Size(
                                      double.infinity, 50),
                                  primary: Colors.green),
                              onPressed: () async {
                                setState(() {
                                  isLoading = true;
                                });
                                if(_registeruser.currentState!.validate()){
                                  registerDriver();
                                }
                                await Future.delayed(const Duration(seconds: 50));
                                setState(() {
                                  isLoading = false;
                                });
                              },
                              child: (isLoading)
                                  ? const SizedBox(
                                  width: 16,
                                  height: 16,
                                  child: CircularProgressIndicator(
                                    color: Colors.white,
                                    strokeWidth: 1.5,
                                  ))
                                  : const Text('Get Started'),
                            ),


                          ],

                      )  ,
                    ),

             ),



              SizedBox(height: 10,),
              Align(
                alignment: Alignment.center,
                child: Row(
                   mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Have an account?", style: TextStyle(color: Colors.black),),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, MyProfile.routeName);
                      },
                      child: Text("login otp page",style: TextStyle(color: Colors.green),),
                    )
                  ],
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Have an account?", style: TextStyle(color: Colors.black),),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, LoginScreen.routeName);
                      },
                      child: Text("Login",style: TextStyle(color: Colors.green),),
                    )
                  ],
                ),
              )




            ],
          ),
        ),
      )
    );
             /*  */

  }
}
