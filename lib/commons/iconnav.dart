import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class IconNav extends StatelessWidget {
  final IconData icon;
  const IconNav({Key? key, required this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      height: 30,
      width: 30,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(25)),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 6.0,
              color: Colors.black26,
              offset: Offset(0,1),
              spreadRadius: 0.1,
            )
          ]
      ),
      child: Center(
        child: Icon(icon , size: 12,
          color: Colors.green,),
      ),
    );
  }
}

class IconNav2 extends StatelessWidget {
  final IconData icon;
  const IconNav2({Key? key, required this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      height: 25,
      width: 25,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(30)),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 6.0,
              color: Colors.black26,
              offset: Offset(0,1),
              spreadRadius: 0.1,
            )
          ]
      ),
      child: Center(
        child: Icon(icon , size: 12,
          color: Colors.green,),
      ),
    );
  }
}

class NextLogo extends StatelessWidget {
  const NextLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 25,
      width: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20.0)),
        boxShadow: [
          BoxShadow(
            blurRadius: 6.0,
            color: Colors.black26,
            offset: Offset(0,1),
            spreadRadius: 0.1,
          )
        ],
        color: Colors.green,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: Center(
          child: Row(
            children: [
               Text("Next", style: TextStyle(fontSize: 7,
                   color: Colors.white),),
              SizedBox(width: 2,),
              Icon(Icons.arrow_forward_ios, size: 10, color: Colors.white,)
            ],

          ),
        ),
      ),
    );
  }
}

class NextLogo1 extends StatelessWidget {
  final String text;
  const NextLogo1({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height:35,
      width: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20.0)),
        boxShadow: [
          BoxShadow(
            blurRadius: 6.0,
            color: Colors.black26,
            offset: Offset(0,1),
            spreadRadius: 0.1,
          )
        ],
        color: Colors.green,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: Center(
          child: Row(
            children: [
              Text(text, style: TextStyle(fontSize: 7,
                  color: Colors.white),),
              SizedBox(width: 2,),
              Icon(Icons.arrow_forward_ios, size: 10, color: Colors.white,)
            ],

          ),
        ),
      ),
    );
  }
}


