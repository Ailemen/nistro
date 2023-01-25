
import 'dart:io';
import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_core/firebase_core.dart'as fire_core;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:maptest/lib/screens/buyer/detail.dart';
import 'package:maptest/lib/screens/skills.dart';
import 'package:maptest/lib/widgets/customized_button.dart';
import 'package:maptest/lib/widgets/customized_textfield.dart';


import '../buyer/fave.dart';

class profilepage extends StatefulWidget {
  const profilepage({Key? key}) : super(key: key);

  @override
  State<profilepage> createState() => _profilepageState();
}

 // seller in a perticular skill has been set, dont forget to add text controllers
// so seller can add content

String myurl = '';

String myurll = '';

String myurlll = '';

final TextEditingController _namee = TextEditingController();
final TextEditingController _emailController = TextEditingController();
final TextEditingController _passwordController = TextEditingController();






// seller jobs cataloge , where buyers can add to it


//String sending = 'Sending ....';

//  firebase storage  for pics code

int nee =1;
int nuu =1;
XFile? picturee;
File imgfilee = File(picturee!.path);


int ne =1;
int nu =1;
XFile? picture;
File imgfile = File(picturee!.path);


int neee =1;
int nuuu =1;
XFile? pictureee;
File imgfileee = File(picturee!.path);



void _createe() async {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  var currentUser = _auth.currentUser;
  try {
    await firestore.collection(currentUser!.email.toString()).doc(
        'kk').update(
        {     'url': myurlll,
      }

    );
  } catch (e) {
    print(e);
  }
}





final CollectionReference data = FirebaseFirestore.instance.collection(skills);

class _profilepageState extends State<profilepage> {

  @override
  void initState() {
    // TODO: implement initState

    _createe();
  }
  String sending = 'Sending ....';
  FirebaseStorage storageee = FirebaseStorage.instance;
  Future <void> uploaddd () async{
    try{
      await  storageee.ref('pic/$picturee').child(imgfilee.path).putFile( imgfileee);
      var dowurl = await storageee.ref().child( imgfilee.path).getDownloadURL().toString();
      setState(() {
        dowurl = myurlll;
      });

    } on fire_core.
    FirebaseException catch
    (e) {print(e);}
  }


  final TextEditingController detail = TextEditingController();


 final storagee = FirebaseStorage.instance.ref('pic/$picturee');
  Future <void> uploadd () async{
    try{
      await  storagee.putFile( imgfilee);
      await storagee.getDownloadURL().then(
              (value) {
        setState(() {
          print(value);
          myurll   = value ;
        });}).whenComplete((){ setState(() {
          print(myurll);
          myurlll  =  myurll;
        });}) ;
       await  Future.delayed(Duration(seconds: 5));
      print(myurlll);

    } on fire_core.
    FirebaseException catch
    (e) {print(e);}
  }


  FirebaseStorage storage = FirebaseStorage.instance;
  Future <void> upload () async{
    try{
      await  storage.ref('pic/$picture').putFile( imgfile);
      var dowurl = await storage.ref().getDownloadURL().toString();
      setState(() {
        dowurl = myurl;
      });
    } on fire_core.
    FirebaseException catch
    (e) {print(e);}
  }
  final TextEditingController detaile = TextEditingController();
  final TextEditingController _namee = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  void _create() async {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    var currentUser = _auth.currentUser;
    try {
      await firestore.collection(skills).doc(currentUser!.email.toString()
      ).set({
        'phone': detaile.text,
        'name': _passwordController.text,
        'url': myurlll,
        'ditail': _emailController.text,
        'id':currentUser!.email.toString(),
        'location': _namee.text,

        'rate': 1,
        'ratee': 1,

        //


      },SetOptions(merge: true)).whenComplete(() {
        setState(() {
        Navigator.pop(context);
          ScaffoldMessenger.of(context).showSnackBar
          (SnackBar(content: Text('Uploaded')));
        });
      });
    } catch (e) {
      print(e);
    }
  }




  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(width: 444,height: 667,padding: EdgeInsets.all(22),
        color: Colors.grey.shade800,
        child: ListView(children: [
          SizedBox(height: 44,),
          Row(
            children: [ SizedBox(width: 44,),
              Text('          Complete Form ',style: TextStyle(color:
              Colors.grey.shade200

                  ,fontSize: 18),),
            ],
          ),
          SizedBox(height: 44,),
           Row(
             children: [
               SizedBox(width: 52,),
               Container(padding: EdgeInsets.all(22),
                   decoration: BoxDecoration(borderRadius:
                   BorderRadius.circular(11), border: Border.all(width: 9,color: Colors.white)),
                    height: 222,width: 222,child:MaterialButton(onPressed: () async{
                  ImagePicker picker= ImagePicker();
                  final imgee= await picker.pickImage(

                      source: ImageSource.gallery);
                  setState(()  {
                    picturee = imgee;
                    nu = 2;});
                  setState(() {
                  });

                }, child: nu == 1?
                  Image(image: AssetImage( 'assets/R.png' ),fit: BoxFit.cover,):
                Image(image: FileImage(File(imgfilee.path)) ,fit: BoxFit.cover
                  , )
                  ,
                )
                ), IconButton(onPressed: (){
                  setState(() {
                upload().whenComplete(() {
                  setState(() {
                    _createe();
                  });
                });
                  });
               }, icon: Icon(Icons.upload))
             ],
           ),


          SizedBox(height: 55,),

            SizedBox(width: 11,),
            CustomizedTextfield(
              myController: _passwordController,
              hintText: "Enter your Name",
              isPassword: false,
            ),
          SizedBox(height: 11,),
 Row(
   children: [
     MaterialButton(
                 onPressed: (){
               Navigator.push(context,
                  MaterialPageRoute(builder: (_) => userskills()));
             }, child: Text('[Choose Skills]',style: TextStyle(color:
     Colors.blue,fontSize: 18),)),     SizedBox(width: 11,),
     Text(skills,style: TextStyle(color:
     Colors.grey,fontSize: 18),)

   ],
 )




         , SizedBox(height: 11,),
          CustomizedTextfield(
            myController: _emailController,
            hintText: "Something  about you ?",
            isPassword: false,
          ),

          SizedBox(height: 11,),
          CustomizedTextfield(
          myController: _namee,
          hintText: "Enter your Location",
          isPassword: false,
          ),
          SizedBox(height: 11,),
          Container(height: 55,width: 22,padding: EdgeInsets.only(left: 44,right: 44),
            decoration: BoxDecoration(color: Colors.white,
                border: Border.all(width: 1,color: Colors.blue),borderRadius:
            BorderRadius.circular(11)),
            child: TextFormField(
              controller: detaile
              ,decoration: InputDecoration(hintText:'           Phone no',
                  fillColor: Colors.grey)
              ,keyboardType: TextInputType.phone,),
          ),


          SizedBox(height: 44,),

          MaterialButton(
              minWidth: 77,height: 44,
              child:  Text('Upload Profile',style: TextStyle(color: Colors.black),),
             color: Colors.orange,
              textColor: Colors.black,
              onPressed: () async{

            if(picturee!.path.isNotEmpty){
              showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                      backgroundColor: Colors.transparent,
                      title: Column(
                        children: [
                          CircularProgressIndicator(color: Colors.orange,),
                          SizedBox(height: 9,),
                          Text(
                              sendings),
                        ],
                      ),
                      actions: [



                      ]));
             uploadd().whenComplete((){ setState(() {
               _create();
              print(myurll);

             });});
          //  _create();

         ;}else{ setState(() {


              showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                      backgroundColor: Colors.transparent,
                      title: Text(
                         "Please complete form"),
                      actions: [



                      ])); });
            }
          })
        ],),
      ),
    );
  }
}
