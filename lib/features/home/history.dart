import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HistoryofComplaint extends StatefulWidget {
  static const String routeName = '/histroy';
  const HistoryofComplaint({Key? key}) : super(key: key);

  @override
  State<HistoryofComplaint> createState() => _HistoryofComplaintState();
}

class _HistoryofComplaintState extends State<HistoryofComplaint> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 253, 253, 254),
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: Color.fromARGB(255, 246, 246, 249),
              width: 1,
            )
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20,),
                Container(
                  height: 30,

                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 253, 253, 254),
                   border: Border.all(color: Colors.grey)
                  ),
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      "Message History",
                    ),
                  ),
                ),
                SizedBox(height: 10,),




                Text("All Messages", style: TextStyle(color: Color.fromARGB(
                        255, 60, 62, 73), fontSize: 15, fontWeight: FontWeight.w500),) ,

                SizedBox(height: 20 ,),
                Row(
                  children: [
                    Text("Message Details",style: TextStyle(
                      color:  Color.fromARGB(255, 14, 30, 40),
                      fontSize: 15,
                    ),),
                    SizedBox(width: 100,),
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        "Student Name",
                        style: TextStyle(
                          color:  Color.fromARGB(255, 14, 30, 40),
                          fontSize: 15,
                        ),

                      ) ,)
                  ],
                ),
                SizedBox(height: 5,),
                Container(
                  width: double.infinity,
                  height: 2,
                  decoration: BoxDecoration(
                    color: Colors.grey[300]
                  ),

                ),
                SizedBox(height: 10,),
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: Color.fromARGB(255, 246, 246, 249),
                        width: 0.20,
                      )
                  ),
                  child: Row(
                    children: [
                      Container(
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Image.asset(
                          "image/Hands Phone.png",
                          fit: BoxFit.fill,
                        ),
                      ),
                      SizedBox(width: 10,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Mr Goodluck", style: TextStyle(
                            color: Color.fromARGB(255, 129, 129, 129),
                          ),),
                          SizedBox(height: 3,),
                          Text("Oflline", style: TextStyle(
                            color: Color.fromARGB(255, 222, 223, 226),   
                          ),),



                        ],
                      ),
                      SizedBox(width: 70,),

                      Align(
                        alignment: Alignment.center,
                        child: Column(
                          children: [
                            Text("David Eze", style: TextStyle(
                                color:  Color.fromARGB(255, 124, 126, 132),
                                fontSize: 13, fontWeight: FontWeight.w400
                            ),),
                            SizedBox(height: 12,),
                            Text("099200", style: TextStyle(
                              color: Color.fromARGB(255, 165, 165, 168),
                              fontSize: 8,
                            ),)
                          ],
                        ) ,
                      )

                    ],
                  ),
                )

              ],
            ),
          ),
        ),
      ) ,
    );
  }
}

/*
Container(
decoration: BoxDecoration(
color: Color.fromARGB(255, 253, 253, 254),
),
child: Align(
alignment: Alignment.center,
child: Text(
"Message History",
),
),
), */