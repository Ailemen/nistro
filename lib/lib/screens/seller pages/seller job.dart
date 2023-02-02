import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:maptest/lib/screens/buyer/detail.dart';
import 'package:maptest/lib/screens/mappage.dart';

import '../buyer/frontpage.dart';


class jobpage extends StatefulWidget {
  const jobpage({Key? key}) : super(key: key);

  @override
  State<jobpage> createState() => _jobpageState();
}
 String userme ="";
final CollectionReference data = FirebaseFirestore.instance.collection
  (currentUser!.email.toString());
class _jobpageState extends State<jobpage> {
  List<dynamic> as =[];


  @override

void initState() {
    // TODO: implement initState
    myjobs();
  }
  void myjobs() async {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    var currentUser = _auth.currentUser;

 setState(() {
   userme= _auth.currentUser!.email!;
 });
  }
  @override

  Widget build(BuildContext context) {

    return
      Scaffold(backgroundColor: Colors.grey.shade800,
        appBar: AppBar( title:Text(  'Jobs',softWrap: true,style:
        TextStyle(color: Colors.  deepOrange,fontSize:
        16,fontWeight: FontWeight.bold,),
        ) ,centerTitle:  true,backgroundColor: Colors.transparent,
            ),
        body: StreamBuilder(
            stream:  data.snapshots(),
            builder: (context,
                AsyncSnapshot<QuerySnapshot?>StreamSnapshot)
            {    if(StreamSnapshot.hasData){

              return

                ListView.builder(
                    itemCount: StreamSnapshot.data!.docs.length,
                    itemBuilder: (context, index) {
                      String ant ='N';
                      final DocumentSnapshot documentSnapshot
                      = StreamSnapshot.data!.docs[index];
                      Color  love = Colors.red;
                      Color  lover = Colors.white;
                      Color  lov = lover;

                      return   Column(
                        children: [SizedBox(height: 11,),
                          MaterialButton(
                            color: Colors.white,
                            onPressed: (){

                          },
                            child: Column(
                              children: [
                                Card(child: ListTile(title: Row(
                                  children: [Column(
                                    children: [

                                    ],
                                  ),
                                    SizedBox(width: 29,),
                                    Row(
                                      children: [
                                        Container(
                                          height: 17,width: 17,child:   Icon(Icons.menu,color:
                                        CupertinoColors.white,),
                                          decoration: BoxDecoration( color: Colors.orange,borderRadius: BorderRadius.circular(17)
                                       ,border: Border.all(width: 1,color: Colors.orange.shade900) ),),
                                        SizedBox(width: 66,),
                                        Column(
                                          children: [
                                            Text(  documentSnapshot['buyernumber']??"",softWrap: true,style:
                                            TextStyle(color: Colors.blue,fontSize:
                                            16,fontWeight: FontWeight.bold,),
                                            ),
                                            Text(documentSnapshot['buyername']??"",softWrap: true ),

                                            MaterialButton(onPressed: (){
                                setState(() {


                                showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                backgroundColor: Colors.white,
                                title: Container(padding: EdgeInsets.all(4),

                                  child: Center(
                                    child: Text(
                                    documentSnapshot['des']??"",style:
                                      TextStyle(color: Colors.deepOrange,fontSize:
                                    11,fontWeight: FontWeight.bold,),),
                                  ),
                                ),
                                actions: [



                                ])); });
                                },
                                              child: Container(padding: EdgeInsets.all(4),
                                                child: Center(
                                                  child: Text('Description:',style:
                                                  TextStyle(color: Colors.deepOrange,fontSize:
                                                  11,fontWeight: FontWeight.bold,),
                                                  ),
                                                ),
                                              ),
                                            ),

                                          ],
                                        ),

                                        SizedBox(height: 44,),


                                      ],
                                    ),
                                  ],
                                )),),
                                Row(
                                  children: [    SizedBox(width: 44,),
                                    MaterialButton(
                                      onPressed:(){
                              
                                       lat =documentSnapshot['lat']??"";
                                       long =documentSnapshot['long']??"";
                             adress =documentSnapshot['track']??"";

                                      //  print(documentSnapshot['lat']);

                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>mappager()));

                                    },
                                      child: Container(
                                        decoration: BoxDecoration(borderRadius:
                                        BorderRadius.circular(11), border: Border.all(width: 1,color: Colors.orange.shade800)),
                                        child: Icon(Icons.location_on_outlined,color:
                                        Colors.orange.shade800,size: 29),),
                                    ),

                                    SizedBox(width: 99,),
                                    MaterialButton(onPressed:(){setState(() {
                                          data.doc(documentSnapshot.id).delete();
                                    });},
                                      child: Container(
                                        decoration: BoxDecoration(borderRadius:
                                        BorderRadius.circular(11), border: Border.all(width: 1,color: Colors.orange.shade800)),
                                        child: Icon(Icons.delete_outlined,color:
                                        Colors.orange.shade800,size: 29,),),
                                    ),
                                  ],
                                ),

                              ],
                            ),
                          ),
                        ],
                      );
                    });} else{  return Container();}

            }),
      ) ;


    ;
  }
}
