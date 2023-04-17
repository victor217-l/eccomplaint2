import 'package:eccomplaint2/commons/customtextfil.dart';
import 'package:flutter/material.dart';

class MenuPage extends StatefulWidget {
  static const String routeName = '/menuepage';
  const MenuPage({Key? key}) : super(key: key);

  @override
  State<MenuPage> createState() => _MenuPageState();

}

class _MenuPageState extends State<MenuPage> {
  final _addKeyComplaint = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
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
                    ) ,
                    child: Image.asset("image/Hands Phone.png", fit: BoxFit.fill,),
                  ),
                  SizedBox(width: 6,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Benedit", style: TextStyle(fontWeight: FontWeight.bold,
                          fontSize: 12,  color: Color.fromARGB(255, 27, 29, 40)) ,),
                      SizedBox(height: 2,),
                      Text("Benedit", style: TextStyle(

                          color: Color.fromARGB(255, 137, 140, 134)) ,),

                    ],),
                  SizedBox(width: 160,),
                ],
              ),





            ],
          ) ,
        )
    );
  }
}
