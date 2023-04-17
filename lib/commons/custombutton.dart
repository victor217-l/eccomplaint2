import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Color color;
  final VoidCallback? onTap;
  const CustomButton({Key? key, required this.text, required this.color,  this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      child: Center(child: Text(text)),
      style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                  Radius.circular(12.0))),
          minimumSize: Size(
              double.infinity, 50,),
          primary: color,
         ),
    );
  }
}

class CustomButton2 extends StatelessWidget {
  final String text;
  final Color colors;
  final VoidCallback onTap;
  const CustomButton2({Key? key, required this.text,
    required this.colors, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 45,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(12)),
          color: colors,
        ),
        child: Center(
          child: Text(text, style: TextStyle(color: Colors.white),),
        ),
      ),
    );
  }
}

class CustomButtonForComplaint extends StatelessWidget {
  final String text;
  final Color colors;
  final VoidCallback onTap;
  const CustomButtonForComplaint({Key? key, required this.text,
    required this.colors, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 45,
        width: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(12)),
          color: colors,
        ),
        child: Center(
          child: Text(text, style: TextStyle(color: Colors.white),),
        ),
      ),
    );
  }
}

