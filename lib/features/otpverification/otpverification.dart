

import 'package:eccomplaint2/commons/custombutton.dart';
import 'package:eccomplaint2/commons/customtextfil.dart';
import 'package:eccomplaint2/features/otpverification/server/otpservice.dart';
import 'package:eccomplaint2/features/registerscreen/Resetpasswo.dart';
import 'package:eccomplaint2/features/startupscreen/screen/startscreen2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

import 'package:pinput/pinput.dart';
import 'package:flutter_verification_code/flutter_verification_code.dart';

import '../../commons/iconnav.dart';

class OtpverificationScreen extends StatefulWidget {
  static const String routeName = '/otpscreen';
  const OtpverificationScreen({Key? key}) : super(key: key);

  @override
  State<OtpverificationScreen> createState() => _OtpverificationScreenState();
}

class _OtpverificationScreenState extends State<OtpverificationScreen> {

  final _otpverification = GlobalKey<FormState>();

  final Otpservice otpservice = Otpservice();


  final TextEditingController _otpinController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();


  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _otpinController.dispose();
    _emailController.dispose();

  }



  void otpverificato(){
    otpservice.otpverificat(context: context,
        pin: _otpinController.text,
    email: _emailController.text);

  }

  void resendtoken(){
    otpservice.resendtoken(context: context);
  }

  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Center(
                  child:
                  Column(
                    children: [
                      SizedBox(height: 50,),

                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 40.0),
                        child: Image.asset("image/undraw_completing_re_i7ap 1.png",  height: 200, width: 200,
                          fit: BoxFit.contain,),
                      ),

                      SizedBox(height: 17,),
                      Form(
                        key: _otpverification,
                        child: Column(
                          children: [
                            Text("OTP VERIFICATION",
                              style: TextStyle(fontSize: 15, color: Colors.black),),
                            SizedBox(height: 12,),
                            Text("Enter the OTP sent to exebosa***com ",
                              style: TextStyle(fontSize: 8, color: Colors.black),),
                            SizedBox(height: 12,),
                          Container(
                            height: 30,
                            width: double.infinity,
                            child: CustomTextfiel(controller: _emailController, hintext: "email"),
                          ),
                            SizedBox(height: 12,),
                            Container(
                              height: 30,
                              width: double.infinity,
                              child: CustomTextfiel(controller: _otpinController, hintext: "pin"),
                            ),
                            SizedBox(height: 12,),





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
                                if(_otpverification.currentState!.validate()){
                                  otpverificato();
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


                            SizedBox(height: 12,),
                            Text("00:120 sec",
                              style: TextStyle(fontSize: 12, color: Colors.black),),
                            SizedBox(height: 12,),
                            Row(
                              children: [
                                Text("Don't receive code?",
                                  style: TextStyle(fontSize: 12, color: Colors.black),),
                                SizedBox(width: 5,),
                                GestureDetector(
                                  onTap: resendtoken,
                                  child: Text(
                                    "Resend it"
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),






                      SizedBox(height: 10,),
                      Row(
                        children: [
                          GestureDetector(
                              onTap:  () => Navigator.pushNamed(context, ResetPassword.routeName),
                              child:
                              Text("Forgot password?", style: TextStyle(color: Colors.green),)),

                        ],
                      )




                    ],
                  )
              ),

            ],
          ),
        ),
      ),
    );
  }
}

/*


class OtpInput extends StatelessWidget {
  final TextEditingController controller;
  final bool autoFocus;
  const OtpInput(this.controller, this.autoFocus, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      width: 50,
      child: TextField(
        autofocus: autoFocus,
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        controller: controller,
        maxLength: 1,
        cursorColor: Theme.of(context).primaryColor,
        decoration: const InputDecoration(
            border: OutlineInputBorder(),
            counterText: '',
            hintStyle: TextStyle(color: Colors.black, fontSize: 20.0)),
        onChanged: (value) {
          if (value.length == 1) {
            FocusScope.of(context).nextFocus();
          }
        },
      ),
    );
  }
}

class HomePage1 extends StatefulWidget {
  static const String routeName = '/name';
  const HomePage1({Key? key}) : super(key: key);

  @override
  State<HomePage1> createState() => _HomePage1State();
}

class _HomePage1State extends State<HomePage1> {
  // 4 text editing controllers that associate with the 4 input fields
  final TextEditingController _fieldOne = TextEditingController();
  final TextEditingController _fieldTwo = TextEditingController();
  final TextEditingController _fieldThree = TextEditingController();
  final TextEditingController _fieldFour = TextEditingController();

  // This is the entered code
  // It will be displayed in a Text widget
  String? _otp;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('KindaCode'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Phone Number Verification'),
          const SizedBox(
            height: 30,
          ),
          // Implement 4 input fields
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              OtpInput(_fieldOne, true), // auto focus
              OtpInput(_fieldTwo, false),
              OtpInput(_fieldThree, false),
              OtpInput(_fieldFour, false)
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          ElevatedButton(
              onPressed: () {
                setState(() {
                  _otp = _fieldOne.text +
                      _fieldTwo.text +
                      _fieldThree.text +
                      _fieldFour.text;
                });
              },
              child: const Text('Submit')),
          const SizedBox(
            height: 30,
          ),
          // Display the entered OTP code
          Text(
            _otp ?? 'Please enter OTP',
            style: const TextStyle(fontSize: 30),
          )
        ],
      ),
    );
  }
}




VerificationCode(
    textStyle: TextStyle(fontSize: 20.0, color: Colors.red[900]),
    keyboardType: TextInputType.number,
    underlineColor: Colors.amber, // If this is null it will use primaryColor: Colors.red from Theme
    length: 4,
    cursorColor: Colors.blue, // If this is null it will default to the ambient
    // clearAll is NOT required, you can delete it
    // takes any widget, so you can implement your design
    clearAll: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        'clear all',
        style: TextStyle(fontSize: 14.0, decoration: TextDecoration.underline, color: Colors.blue[700]),
      ),
    ),
    onCompleted: (String value) {
      setState(() {
        _code = value;
      });
    },
    onEditing: (bool value) {
      setState(() {
        _onEditing = value;
      });
      if (!_onEditing) FocusScope.of(context).unfocus();
    },
  ),
 */

