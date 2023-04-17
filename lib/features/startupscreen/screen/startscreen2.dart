import 'package:eccomplaint2/commons/iconnav.dart';
import 'package:eccomplaint2/features/startupscreen/screen/startscreen3.dart';
import 'package:flutter/material.dart';

class StartScreen2 extends StatelessWidget {
  static const String routeName = '/startscreen2';
  const StartScreen2({Key? key}) : super(key: key);

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
                    child: Image.asset("image/Tech Life Communication.png",  height: 200, width: 200,
                      fit: BoxFit.contain,),
                  ),

                  SizedBox(height: 2,),

                  Text("Fast & Secure", style: TextStyle(fontWeight: FontWeight.bold,
                  ), ),
                  SizedBox(height: 1,),
                  Text(" Response", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20
                  ), ),


                  SizedBox(height: 130,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 165.0),
                    child: Row(
                      children: [
                        Container(
                          height: 6,
                          width: 6,
                          decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.all(Radius.circular(12))
                          ),),
                        SizedBox(width: 5,),
                        Container(
                          height: 6,
                          width: 6,
                          decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.all(Radius.circular(12))
                          ),),
                        SizedBox(width: 4,),
                        Container(
                          height: 6,
                          width: 6,
                          decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.all(Radius.circular(12))
                          ),),
                      ],

                    ),
                  ),
                  SizedBox(height: 10,),
                 Padding(
                   padding: const EdgeInsets.symmetric(horizontal: 50.0),
                   child: Center(
                     child: Row(
                       children: [
                         IconNav2(icon: Icons.arrow_back_ios),
                         SizedBox(width: 170,),
                         GestureDetector(
                           onTap: () => Navigator.pushNamed(context, StartScreen3.routeName ),
                             child: NextLogo()),

                       ],
                     ),
                   ),
                 )


                ],
              )
          ),

        ],
      ),
    );
  }
}
