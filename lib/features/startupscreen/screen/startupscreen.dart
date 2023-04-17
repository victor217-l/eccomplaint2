import 'package:eccomplaint2/features/startupscreen/screen/startscreen2.dart';
import 'package:flutter/material.dart';

class StartScreen1 extends StatelessWidget {
  const StartScreen1({Key? key}) : super(key: key);

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
                child: Image.asset("image/Hands Phone.png",  height: 200, width: 200,
                fit: BoxFit.fill,),
              ),

              SizedBox(height: 2,),

               Text("We Listen", style: TextStyle(fontWeight: FontWeight.bold,
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
                           color: Colors.black,
                             borderRadius: BorderRadius.all(Radius.circular(12))
                         ),),
                       SizedBox(width: 5,),
                       Container(
                         height: 6,
                         width: 6,
                         decoration: BoxDecoration(
                             color: Colors.grey,
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
               GestureDetector(
                 onTap: ()  => Navigator.pushNamed(context, StartScreen2.routeName),
                 child: Container(
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
                     child: Icon(Icons.arrow_forward_ios , size: 12,
                       color: Colors.green,),
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
