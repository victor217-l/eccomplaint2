import 'dart:convert';

import 'package:eccomplaint2/features/home/home.dart';
import 'package:eccomplaint2/features/otpverification/otpverification.dart';
import 'package:eccomplaint2/features/registerscreen/createyourprofile.dart';
import 'package:eccomplaint2/features/registerscreen/login.dart';
import 'package:eccomplaint2/features/registerscreen/profilecreate.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../constraint/error_handling.dart';
import '../../../constraint/utils.dart';
import '../../model/register_model.dart';
import '../../model/user_model.dart';
import 'package:http/http.dart' as http;

import '../../provider/provider.dart';
import '../../welcomepage/welcomepage.dart';

class RegisterService{
  void signUpUser({
    required BuildContext context,
    required String password,
    required String email,
  }) async {
    try {
debugPrint(email);

String validEmail = email.trim();

      http.Response res = await http.post(Uri.parse('https://voiceout.onrender.com/api/auth/signup'),
          body:  {
            'email': validEmail,
            'password': password,
          },);

      //Bearer token



      httpErrorHandle(
          response: res,
          context: context,
          onSuccess: () {
            showSnackBar(
              context, jsonDecode(res.body)['message']);

            if(jsonDecode(res.body)['message'] == 'A verification code has been sent to $validEmail') {
             Navigator.pushNamedAndRemoveUntil(context, OtpverificationScreen.routeName, (route) => false);
            };
            if(jsonDecode(res.body)['message'] == 'you can still login $validEmail') {
            Navigator.pushNamedAndRemoveUntil(context, LoginScreen.routeName, (route) => false);
            };


            });



           // Navigator.pop(context, CreateYourProfile.routeName);

      print(res.body);
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }


  void signInUser({
    required BuildContext context,
    required String password,
    required String email,
  }) async {
    try {
     /* Register register = Register(
        id: '',
        username: 'name',
        email: email,
        password: password,
        country: 'mark',
      ); */

      http.Response res = await http.post(Uri.parse('https://voiceout.onrender.com/api/auth/login'),
          body: {
            'email':email,
            'password':password,
          },
    );


      print(res.body);

      httpErrorHandle(
          response: res,
          context: context,
          onSuccess: () async {
            showSnackBar(context, jsonDecode(res.body)['message']);
            SharedPreferences prefs = await SharedPreferences.getInstance();
            await prefs.setString(
                "x-auth-token", jsonDecode(res.body)['data']["accessToken"]);
            Navigator.pushNamedAndRemoveUntil(
                context,
                ProfileCreate.routeName,
                    (route) => false);
          });
      //  print(res.body);
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }



  void Logout({
    required BuildContext context,
  }) async {
    try {


      http.Response res = await http.post(Uri.parse(''),
          body: json,
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8'
          });

      httpErrorHandle(
          response: res,
          context: context,
          onSuccess: () async {

          });
      //  print(res.body);
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }


  void createYourProfile({
    required BuildContext context,
    required String firstname,
    required String lastname,
    required String matric,
    required String university,
    required String faculty,
    required String department,
    required String email,


  }) async {
    try {

      SharedPreferences prefs = await SharedPreferences.getInstance();
      final token = await prefs.getString("x-auth-token");


      Map<String, dynamic> jsondata = {
    "firstname": firstname,
    "lastname": lastname,
    "matric": matric,
    "academic_status": "undergraduate",
    "university": university,
    "faculty": "same",
    "department": department,
    "skills": "coding",
    "year_of_graduation": "2023",
    "about": "I am a programmer",
    "reset_password_pin": "1234",
    "email": email,
    };
    
    String jsonString = jsonEncode(jsondata);

    
    var request = http.MultipartRequest('PUT', Uri.parse(
    "https://voiceout.onrender.com/api/user/me?action=setup&role=student"),
    );


    request.fields['data'] = jsonString;
    request.headers.addAll({
      "Authorization": 'Bearer $token',
      'Content-Type': 'multipart/form-data',
    });

      final streamedResponse = await request.send();

      final response = await http.Response.fromStream((streamedResponse));
      if (response.statusCode == 200) {
        showSnackBar(context, response.body);
        print('Request sent successfully');
      } else {
        print('Request failed with status: ${response.statusCode}');
        showSnackBar(context, response.body);
        print('Request failed with status: ${response.body}');
      }
      //  print(res.body);
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  void resetProfile({
    required BuildContext context,
    required String resetPassword,
  }) async {
    try {


      http.Response res = await http.put(Uri.parse('https://voiceout.onrender.com/api/auth/forgot'),
          body: {
            "resetPassword" : resetPassword,
          });

      httpErrorHandle(
          response: res,
          context: context,
          onSuccess: ()  {
            showSnackBar(context, jsonDecode(res.body)["message"]);
          });
      //  print(res.body);
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  void forgotPassword({
    required BuildContext context,
    required String forgotPassword,
  }) async {
    try {


      http.Response res = await http.post(Uri.parse('https://voiceout.onrender.com/api/auth/forgot'),
          body: {
            "email" : forgotPassword,
          });

      httpErrorHandle(
          response: res,
          context: context,
          onSuccess: ()  {
            showSnackBar(context, jsonDecode(res.body)["message"]);
          });
      //  print(res.body);
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }





}