import 'dart:convert';
import 'dart:io';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:eccomplaint2/commons/custombutton.dart';
import 'package:eccomplaint2/commons/customtextfil.dart';
import 'package:eccomplaint2/features/home/menupage.dart';
import 'package:eccomplaint2/features/provider/provider.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../constraint/utils.dart';
import 'homeservice/home_service.dart';
import 'package:http/http.dart' as http;


class HomePage2 extends StatefulWidget {
  static const String routeName = '/homepage2';
  const HomePage2({Key? key}) : super(key: key);

  @override
  State<HomePage2> createState() => _HomePage2State();





}

class _HomePage2State extends State<HomePage2> {
  final _addKeyComplaint = GlobalKey<FormState>();

  final TextEditingController submitcomplain = TextEditingController();
  final TextEditingController detailcomplain = TextEditingController();
  final TextEditingController proritycomplain = TextEditingController();
  final TextEditingController receivercomplain = TextEditingController();
  final TextEditingController amonitycomplain =  TextEditingController();



  final HomeService homeservice = HomeService();




  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    submitcomplain.dispose();
    detailcomplain.dispose();
    receivercomplain.dispose();
    amonitycomplain.dispose();
    proritycomplain.dispose();

  }

  /*void sendFile() {
    homeservice.sendComplaint(
        context: context, subject: submitcomplain.text,
        details: detailcomplain.text,       receiver: receivercomplain.text,
      anonymity: amonitycomplain.text, image: _image, priority: proritycomplain.text ,  );
  } */

  Future<void> uploadfiles() async {
    setState(() {
      stowSpinner = true;
    });


    SharedPreferences prefs = await SharedPreferences.getInstance();
    final token = await prefs.getString("x-auth-token");

    //history of complaint

    final jsondata =  {
      "subject": submitcomplain.text,
      "details": detailcomplain.text,
      //"university": "bells",
      /* "images": [],
        "sender": "641ae33312d5d1d53dd950c7",
        "receiver": "dan@gmail.com",
        "priority": "medium",
        "anonymity": false, */
      "address_to_superadmin": true.toString()
    };

    String jsonMap = jsonEncode(jsondata);
    var request = http.MultipartRequest('POST',
      Uri.parse("https://voiceout.onrender.com/api/complaint"),);




// Add form fields to the request
    request.fields['data'] = jsonMap;

   // request.files.add(
     //   await http.MultipartFile.fromPath('image', image.path ));
    /* request.fields['details'] = 'Just stop it sir';
      request.fields['address_to_superadmin'] = 'true'; */
    request.headers.addAll({
      'Authorization': 'Bearer $token',
      'Content-Type': 'multipart/form-data',
    });


    var stream = new http.ByteStream(image!.openRead());
    stream.cast();

    var length = await image!.length();

    var muitlport = new http.MultipartFile("images",
        stream, length);

    request.files.add(muitlport);




    //"coverimage". coverimage.path!
    print(token);

    final streamedResponse = await request.send();

    final response = await http.Response.fromStream((streamedResponse));
    if (response.statusCode == 200) {
      showSnackBar(context,  response.body);
      print('Request sent successfully ${response.body}');
    } else {
      showSnackBar(context, response.body);
      print('Request failed with status: ${response.statusCode}');
      print('Request failed with status: ${response.body}');
    }




    print(request.fields);


  }


  File? image;
  final _picker = ImagePicker();
  bool stowSpinner = false;


  Future getImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery,imageQuality: 80 );

    if(pickedFile!= null) {
      image = File(pickedFile.path);
      setState(() {

      });
    }else{
           print('no image selected');
    }
  }





 // final ischeckeds = value;
  bool isChecked = false;

   bool isLoading = false;


  @override
  Widget build(BuildContext context) {
    final User = Provider.of<UserProvider>(context).user;
    return Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: _addKeyComplaint,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(

                  ),
                  SizedBox(height: 40,),

                  Text("We listen, we ", style: TextStyle(fontSize: 25,
                  color: Color.fromARGB(
                      255, 21, 43, 75) ),),
                    SizedBox(height: 3,),
                  Text("Care", style: TextStyle(fontSize: 25,
                      color: Color.fromARGB(
                          255, 21, 43, 75) ),),
                  SizedBox(height: 3,),
                    Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Row(
                        children: [
                          Text("We would respond to ypur complaint",
                            style: TextStyle(color: Color.fromARGB(
                                255, 21, 43, 75) ),),
                          Checkbox(
                              value: isChecked , onChanged: (value){
                              setState(() {
                                isChecked == value;
                              });
                          }),



                          
                        ],
                      ),
                    ),




          Container(
       height: 200,
       width: double.infinity,
       child: Column(
         children: [
           SizedBox(height: 5,),
           CustomTextfiel(controller: submitcomplain, hintext: "Subject for complain"),
           SizedBox(height: 6,),
       /*    CustomTextfiel(controller: receivercomplain, hintext: "receiver for complain"),
           SizedBox(height: 6,),
           CustomTextfiel(controller: amonitycomplain, hintext: "amoninty complain"),
           SizedBox(height: 6,),
           CustomTextfiel(controller: proritycomplain, hintext: "prority low, high, medium for complain"),
           SizedBox(height: 6,), */
           Text("Details complaint", style: TextStyle(fontSize: 12),),
           SizedBox(height: 2,),
              ForComplaint(controller: detailcomplain, hintext: "Details of complaint"),
        /*   SizedBox(height: 2,),
           Text("Prority", style: TextStyle(fontSize: 6),),
           SizedBox(height: 2,), */
         ],
       ),
     ),

                          // Radio(value: proritycomplain, groupValue: homeservice, onChanged: (Object? value) {
                          //   setState(() {
                          //     proritycomplain;
                          //   });
                          // },),
                       /*   CheckboxListTile(
                            title: Text("Low"),
                            value: true,
                            onChanged: (newValue) {
                              setState(() {
                                // checkedValue = newValue;
                              });
                            },
                            controlAffinity: ListTileControlAffinity.leading, // <-- leading Checkbox
                          ), */
                         /* CheckboxListTile(
                            title: Text("Medium"),
                            value: true,
                            onChanged: (newValue) {
                              setState(() {
                                // checkedValue = newValue;
                              });
                            },
                            controlAffinity: ListTileControlAffinity.leading, // <-- leading Checkbox
                          ),
                          CheckboxListTile(
                            title: Text("High"),
                            value: true,
                            onChanged: (newValue) {
                              setState(() {
                                // checkedValue = newValue;
                              });
                            },
                            controlAffinity: ListTileControlAffinity.leading, // <-- leading Checkbox
                          ), */
                        SizedBox(height: 30,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: getImage,
                            child: Container(
                                child: image == null ? Center(child:
                                Text('pick image'),) : Container(
                                  child: Center(
                                    child: Image.file(
                                      File(image!.path).absolute,
                                      height: 50,
                                      width: 20,
                                      fit: BoxFit.cover,),

                                  ),
                                )
                            ),
                          ),

                          SizedBox(width: 200,),
             Container(
    height: 45,
    width: 50,
        decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(12)),
    color: Colors.green,
    ),
                          child: ElevatedButton(
                            style:ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(12.0))),
                                minimumSize: Size(
                                    double.infinity, 50),
                                primary: Colors.green),
                            onPressed: () async {
                              setState(() {
                                isLoading = true;
                              });
                              if(_addKeyComplaint.currentState!.validate()){
                             //   sendFile();
                                uploadfiles();
                              }
                              await Future.delayed(const Duration(seconds: 50));
                              setState(() {
                                isLoading = false;
                              });
                            },
                            child: (isLoading)
                                ? const SizedBox(
                                width: 16,
                                height: 16,
                                child: CircularProgressIndicator(
                                  color: Colors.white,
                                  strokeWidth: 1.5,
                                ))
                                : const Text('Send'),
                          ) ,
             ),





                        ],
                      ),
                /*  _image.isNotEmpty
                      ? CarouselSlider(
                      items: _image.map((i) {
                        return Builder(
                          builder: (BuildContext context) =>
                              Image.file(i, fit: BoxFit.cover, height: 130),
                        );
                      }).toList(),
                      options:
                      CarouselOptions(viewportFraction: 1, height: 120)
                  ): GestureDetector(
                      onTap: selectImages,
                      child: DottedBorder(
                        borderType: BorderType.RRect,
                        radius: const Radius.circular(10),
                        dashPattern: const [10, 4],
                        strokeCap: StrokeCap.round,
                        child: Container(
                          width: 50,
                          height: 60,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.folder_open,
                                size: 30,
                              ),
                              SizedBox(
                                height: 3,
                              ),
                              Text(
                                'select Product Images',
                                style: TextStyle(color: Colors.green, fontSize: 6),
                              )
                            ],
                          ),
                        ),
                      )
                  ), */







                        ],
                      ),
            ),
          ),
        ),



    );
  }
}




