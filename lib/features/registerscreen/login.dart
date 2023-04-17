import 'package:eccomplaint2/commons/custombutton.dart';
import 'package:eccomplaint2/commons/customtextfil.dart';
import 'package:eccomplaint2/features/registerscreen/Resetpasswo.dart';
import 'package:eccomplaint2/features/registerscreen/forgotpasswo.dart';
import 'package:eccomplaint2/features/registerscreen/serivce/registerservice.dart';
import 'package:eccomplaint2/features/welcomepage/welcomepage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../commons/iconnav.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = '/login';
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final _loginuser = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final RegisterService registerService = RegisterService();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  void loginDriver(){
    registerService.signInUser(
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
        child: Stack(
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
                        child: Image.asset("image/Tech Life Virtual Reality.png",  height: 200, width: 200,
                          fit: BoxFit.contain,),
                      ),

                      SizedBox(height: 30,),

                          Align(
                            alignment: Alignment.topLeft,
                            child: Text("Login", style: TextStyle(fontSize: 20, color: Color.fromARGB(
                                255, 21, 43, 75)),),
                          ),
                      SizedBox(height: 12,),

                      Container(
                        height: 150,
                        width: double.infinity,
                        color: Colors.white,
                        child: Form(
                          key: _loginuser,

                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomTextfiel(controller: _emailController , hintext: 'Email'),
                              SizedBox(height: 6,),
                              CustomTextfiel(controller: _passwordController , hintext: 'password'),
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
                                  if(_loginuser.currentState!.validate()){
                                    loginDriver();
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






                    /*  Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 165.0),
                        child: Form(
                          key: _registeruser ,
                          child:  Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomTextfiel(controller: _emailController , hintext: 'Email'),
                              SizedBox(height: 6,),
                              CustomTextfiel(controller: _passwordController , hintext: 'Email'),
                              SizedBox(height: 12,),
                              CustomButton2(text: "Login", colors: Colors.green)

                            ],

                          )  ,
                        )

                        ,
                      ), */
                      SizedBox(height: 10,),
                      Row(
                        children: [
                          GestureDetector(
                            onTap:  () => Navigator.pushNamed(context, ForgotPassworScreen.routeName),
                              child:
                              Text("Forgot password?", style: TextStyle(color: Colors.green),)),

                        ],
                      ),
                      SizedBox(height: 12,),







                    ],
                  ),
                )
            ),

          ],
        ),
      ),
    );
  }
}
