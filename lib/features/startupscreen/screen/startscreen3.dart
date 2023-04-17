import 'package:eccomplaint2/commons/custombutton.dart';
import 'package:eccomplaint2/commons/iconnav.dart';
import 'package:eccomplaint2/features/startupscreen/screen/startscreen4.dart';
import 'package:flutter/material.dart';

class StartScreen3 extends StatelessWidget {
  static const String routeName = '/startscreen3';
  const StartScreen3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
              child:
              Column(
                children: [
                  SizedBox(height: 100,),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40.0),
                    child: Image.asset("image/Tech Life Life Management.png",  height: 200, width: 200,
                      fit: BoxFit.contain,),
                  ),

                  SizedBox(height: 10,),

                  Text(" Get fast  response", style: TextStyle(fontWeight: FontWeight.bold,
                  ), ),
                  SizedBox(height: 2,),



                  SizedBox(height: 130,),


                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 50.0),
                      child: CustomButton2(text: "Get Started", colors: Colors.green,
                      onTap: () => Navigator.pushNamed(context, StartScreen4.routeName),)
                  )


                ],
              )
          ),

        ],
      ),
    );
  }
}
