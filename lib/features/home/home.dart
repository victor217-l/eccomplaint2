import 'package:eccomplaint2/commons/customtextfil.dart';
import 'package:eccomplaint2/features/home/complaint.dart';
import 'package:eccomplaint2/features/home/history.dart';
import 'package:eccomplaint2/features/home/listofadmin.dart';
import 'package:eccomplaint2/features/home/menupage.dart';
import 'package:eccomplaint2/features/provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'homeservice/home_service.dart';

class HomePage extends StatefulWidget {
  static const String routeName = '/homepage';
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();



}

class _HomePageState extends State<HomePage> {
  final _addKeyComplaint = GlobalKey<FormState>();

  final TextEditingController submitcomplain = TextEditingController();
  final TextEditingController detailcomplain = TextEditingController();

  void logout() async {
    homeservice.logout(context);
  }



  final HomeService homeservice = HomeService();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    submitcomplain.dispose();
    detailcomplain.dispose();
  }




    @override
    Widget build(BuildContext context) {
    final User = Provider.of<UserProvider>(context).user;
      return Scaffold(
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  SizedBox(height: 40,),
                  Row(
                    children: [
                      Container(
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(20))
                        ),
                        child: Image.asset(
                          "image/Hands Phone.png", fit: BoxFit.fill,),
                      ),
                      SizedBox(width: 6,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Benedit",
                            style: TextStyle(fontWeight: FontWeight.bold,
                                fontSize: 12,
                                color: Color.fromARGB(255, 27, 29, 40)),),
                          SizedBox(height: 2,),
                          Text("Benedit", style: TextStyle(

                              color: Color.fromARGB(255, 137, 140, 134)),),

                        ],),
                      SizedBox(width: 160,),

                      Expanded(
                        child: IconButton(icon: Icon(Icons.logout), onPressed: () {
                          logout();
                        }),),


                    ],
                  ),

                  SizedBox(height: 30,),
                  Container(
                    height: 150,
                    width: 250,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("image/Rectangle 22.png",)
                        )
                    ),
                    child: Column(
                      children: [
                        SizedBox(height: 12,),
                        Text('Welcome ${User.name}',
                          style: TextStyle(color: Colors.white),),
                        SizedBox(height: 12,),
                        Text('We would respond to you as possible',
                          style: TextStyle(color: Colors.white, fontSize: 8),)
                      ],
                    ),
                  ),
                  SizedBox(height: 20,),

                  Container(
                    height: 80,
                    width: 250,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      color: Color.fromARGB(
                          255, 21, 43, 75),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, HistoryofComplaint.routeName);
                            },
                            child: Text("History of complaint",
                              style: TextStyle(color: Colors.white),),
                          ),
                          SizedBox(width: 12,),
                          Icon(Icons.history, color: Colors.white,)
                        ],
                      ),
                    ),
                  ),

                  SizedBox(height: 20,),
                  Container(
                    height: 80,
                    width: 250,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      color: Color.fromARGB(
                          255, 21, 43, 75),
                    ),
                    child:
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Row(
                              children: [
                                GestureDetector(
                              onTap: () {
                    Navigator.pushNamed(context, HomePage2.routeName);
                    },
                                  child: Text("Submit Complaint",
                                    style: TextStyle(color: Colors.white),),
                                ),
                                SizedBox(width: 12,),
                                Icon(Icons.commit, color: Colors.white,)
                              ],
                            ),
                          ),

                  ),
                  Align(
                    alignment: Alignment.center,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, ListOfAmin.routeName);
                      },
                      child: Text(
                        "List of Adminstrators", style: TextStyle(
                        color:  Color.fromARGB(
                            255, 250, 117, 27),
                      ),
                      ),
                    ),
                  )


                ],


              ),
            ),
          )
      );
    }
  }




