import 'dart:convert';
import 'dart:io';


import 'package:eccomplaint2/features/provider/provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:path/path.dart';

import '../../../constraint/utils.dart';

import 'package:shared_preferences/shared_preferences.dart';


import 'package:http/http.dart' as http;

import '../../registerscreen/registerscreen.dart';
import 'dart:async';

class HomeService{
  void sendComplaint({
  required BuildContext context,
  required String subject,
    required String details,
    required File image,
    required String priority,
    required String receiver,
    required String anonymity,

  }) async {
    try{
/*
      final cloudinary = CloudinaryPublic('detjbvvp6', 'wmjhlswd');
      List<String> imageUrls = [];

      for (int i = 0; i < image.length; i++) {
        CloudinaryResponse res = await cloudinary.uploadFile(
          CloudinaryFile.fromFile(image[i].path, folder: subject),
        );
        imageUrls.add(res.secureUrl);
      } */

      SharedPreferences prefs = await SharedPreferences.getInstance();
      final token = await prefs.getString("x-auth-token");

      //history of complaint

      final jsondata =  {
        "subject": subject,
        "details": details,
        //"university": "bells",
       /* "images": [],
        "sender": "641ae33312d5d1d53dd950c7",
        "receiver": "dan@gmail.com",
        "priority": "medium",
        "anonymity": false, */
        "address_to_superadmin": true.toString()
      };

      String jsonMap = jsonEncode(jsondata);
      var request = http.MultipartRequest('POST',
        Uri.parse("https://voiceout.onrender.com/api/complaint"),);




// Add form fields to the request
      request.fields['data'] = jsonMap;

      request.files.add(
         await http.MultipartFile.fromPath('image', image.path ));
     /* request.fields['details'] = 'Just stop it sir';
      request.fields['address_to_superadmin'] = 'true'; */
      request.headers.addAll({
        'Authorization': 'Bearer $token',
        'Content-Type': 'multipart/form-data',
      });



      //"coverimage". coverimage.path!
      print(token);

      final streamedResponse = await request.send();

      final response = await http.Response.fromStream((streamedResponse));
      if (response.statusCode == 200) {
        print('Request sent successfully ${response.body}');
      } else {
        print('Request failed with status: ${response.statusCode}');
        print('Request failed with status: ${response.body}');
      }



      debugPrint(subject);
      debugPrint(details);
      print(request.fields);

      
    }catch(e){
      showSnackBar(context, e.toString());
    }
  }

  void logout(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('token','');
    Navigator.pushNamedAndRemoveUntil(context, RegisterScreen.routeName, (route) => false);
  }

}