
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'homeservice/home_service.dart';



class ListOfAmin extends StatefulWidget {
  static const String routeName = '/string';
  const ListOfAmin({Key? key}) : super(key: key);

  @override
  State<ListOfAmin> createState() => _ListOfAminState();
}

class _ListOfAminState extends State<ListOfAmin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 200,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 14, 30, 40)
            ),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child:
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 15,),
                  IconButton(onPressed: () {

                  }, icon: Icon(Icons.arrow_back, color: Colors.white, size: 20,)),
                  SizedBox(height: 18,),
                  Text("Adminstrators", style: TextStyle(color:
                  Color.fromARGB(255, 243, 243, 244), fontSize: 23), ),
                  SizedBox(height: 12,),
                  Text("10 members", style: TextStyle(color:
                  Color.fromARGB(255, 71, 83, 90), fontSize: 12),),
                  SizedBox(height: 15,),
                ],
              ),
            ),
          ),
          Container(
            height: 200,
            decoration: BoxDecoration(
              color:  Color.fromARGB(255, 244, 244, 244),
            ),
            child: Column(
              children: [
                SizedBox(height: 10,),
            Align(
              alignment: Alignment.center,
              child: Container(
                height: 5,
              width: 100,
              decoration: BoxDecoration(
                color:  Color.fromARGB(255, 252, 117, 27),
                borderRadius: BorderRadius.all(Radius.circular(12))
          ),
              ),
            ),
                SizedBox(height: 1,),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Stack(
                    children: [
                      Row(
                        children: [
                          Container(
                            height: 60,
                            width: 60,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color:  Color.fromARGB(255, 41, 203, 57),
                            ),
                            child: Image.asset(
                              "image/Hands Phone.png",

                              fit: BoxFit.contain,
                            ),
                          ),
                          SizedBox(width: 20,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Mr Goodluck", style: TextStyle(
                                color: Color.fromARGB(255, 129, 129, 129),
                              ),),
                              SizedBox(height: 3,),
                              Text("Oflline", style: TextStyle(
                                color: Color.fromARGB(255, 98, 208, 155),
                              ),),

                            ],
                          ),
                        ],
                      ),
                      Positioned(
                        top: 4,
                        right:3 ,
                          child: Icon(Icons.toggle_off, color: Colors.grey
                            ,))
                    ],
                  ),
                ),
                
                
              ],
            ),
          )
        ]
      ) ,
    );
  }
}
