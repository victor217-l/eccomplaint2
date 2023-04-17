
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class CustomTextfiel extends StatelessWidget {
  final TextEditingController controller;
  final String hintext;
  const CustomTextfiel({Key? key,
    required this.controller,
    required this.hintext}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextFormField(

        controller: controller,
        decoration: InputDecoration(
          hintStyle: TextStyle(fontSize: 12, color: Colors.black),
          hintText: hintext,
          focusColor: Colors.grey ,
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
                color: Colors.grey
            ),
          ),
          enabledBorder: UnderlineInputBorder(

            borderSide: BorderSide(
                color: Colors.grey,
                width: 1),
          ),
          /*  border:OutlineInputBorder(
            borderSide: BorderSide(width: 1)
          ),
          disabledBorder:  OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(12)),
              borderSide: BorderSide(
                  color: Colors.grey,
                  width: 1.0)),

          errorBorder:  OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(12)),
              borderSide: BorderSide(
                  color: Colors.grey,
                  width: 1.0)),
          enabledBorder: OutlineInputBorder(

              borderSide: BorderSide(width: 1),
          )),
          focusedErrorBorder:  OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(12)),
              borderSide: BorderSide(
                  color: Colors.grey,
                  width: 1.0)), */
        ),
        validator: (val) {
          if (val == null || val.isEmpty) {
            return 'Enter your $hintext';
          }
        },
      ),
    );
  }
}


class PasswordFieldState extends StatelessWidget {
  final TextEditingController controller;
  final String hintext;

  const PasswordFieldState({
    super.key,
    required this.controller,
    required this.hintext
  });

  @override
  Widget build(BuildContext context) {
    bool obscurePassword = true;
    return TextFormField(

      controller: controller,
      validator: (val) {
        if (val == null || val.isEmpty) {
          return hintext;
        }
      },
      obscureText: obscurePassword,
      keyboardType: TextInputType.visiblePassword,
      decoration: const InputDecoration(
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
              color: Colors.grey
          ),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
              color: Colors.grey,
              width: 1),
        ),



        fillColor: Colors.grey,
        hintText: "Password",

      ),
    );
  }
}






class ForComplaint extends StatelessWidget {
  final TextEditingController controller;
  final String hintext;
  const ForComplaint({Key? key,
    required this.controller,
    required this.hintext}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  TextFormField(
        controller: controller,
        minLines: 3,
        maxLines: 20,
        decoration: InputDecoration(
          hintStyle: TextStyle(fontSize: 12, color: Colors.black),
          hintText: hintext,
          focusColor: Colors.grey ,
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: Colors.white
            ),
          ),
            border:OutlineInputBorder(
            borderSide: BorderSide(width: 1)
          ),
          disabledBorder:  OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(12)),
              borderSide: BorderSide(
                  color: Colors.grey,
                  width: 1.0)),

          errorBorder:  OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(12)),
              borderSide: BorderSide(
                  color: Colors.grey,
                  width: 1.0)),
          enabledBorder: OutlineInputBorder(

              borderSide: BorderSide(width: 1),
          )),


        validator: (val) {
          if (val == null || val.isEmpty) {
            return 'Enter your $hintext';
          }
        },
      );
  }
}






/*
flutter_icons:
image_path: "image/Charco Launch.png"
android: true
*/