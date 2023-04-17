import 'dart:convert';

import 'package:flutter/cupertino.dart';

import '../../../constraint/error_handling.dart';
import '../../../constraint/utils.dart';
import '../../model/register_model.dart';
import '../../model/user_model.dart';
import 'package:http/http.dart' as http;

import '../../provider/provider.dart';
import '../../welcomepage/welcomepage.dart';

class profileService{
  void getUserProfile({
    required BuildContext context,
    required String pin,
    required String email,
  }) async {
    try{
      http.Response res = await http.get(Uri.parse("https://voiceout.onrender.com/api/user/me"),
      );

      debugPrint(pin);

      print(res.body);

      httpErrorHandle(response: res, context: context, onSuccess: (){
        showSnackBar(context, jsonDecode(res.body)["message"]);

      });


    }catch(e){
      showSnackBar(context, e.toString());
    }
  }
/*
  Future<> resendToken(BuildContext context) async {
    try {
      http.Response res =
      await http.get(Uri.parse('https://voiceout.onrender.com/api/auth/verify'), headers: {
        'Content-type': 'application/json;charset=UTF-8',
      });

      httpErrorHandle(
          response: res,
          context: context,
          onSuccess: () {
            for (int i = 0; i < jsonDecode(res.body).length; i++) {
              productList
                  .add(Product.fromJson(jsonEncode(jsonDecode(res.body)[i])));
            }
          });
    } catch (e) {
      showSnackBar(context, e.toString());
    }

    return productList;
  } */
/*
  Future<User>  refreshToken(BuildContext context) async {
    try{
      http.Response res = await http.get(Uri.parse("https://voiceout.onrender.com/api/auth/verify"),
      );

      httpErrorHandle(response: res, context: context, onSuccess: (){
        showSnackBar(context, jsonDecode(res.body)['message']);
      });
    }catch(e){
       showSnackBar(context, e.toString());
    }

  }
 */



  void resendtoken({
    required BuildContext context,
    required String firstname,
    required String lastname,
    required String  matric,
    required String  academic_status,
    required String  university,
    required String skills,
    required String  year_of_graduation,
    required String  about,
    required String  reset_password_pin,
    required String  email,

  }) async {
    try{
      http.Response res = await http.put(
        Uri.parse("https://voiceout.onrender.com/api/user/me?action=setup&role=student"),
        body: {
          "firstname":firstname,
          "lastname":lastname,
          "matric":matric,
          "academic_status":academic_status,
          "university":university,
          //"firstname":
          "skills":skills,
          "year_of_graduation":year_of_graduation,
          "about":about,
          "reset_password_pin":reset_password_pin,
          "email":email,
        }
      );

      print(res.body);

      httpErrorHandle(response: res, context: context, onSuccess: (){
        showSnackBar(context, jsonDecode(res.body)["message"]);

      });


    }catch(e){
      showSnackBar(context, e.toString());
    }
  }

}