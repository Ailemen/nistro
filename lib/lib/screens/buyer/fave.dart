import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:maptest/lib/screens/buyer/detail.dart';


class favourite extends StatefulWidget {
  const favourite({Key? key}) : super(key: key);

  @override
  State<favourite> createState() => _favouriteState();
}

final FirebaseFirestore firestore = FirebaseFirestore.instance;

final FirebaseAuth _auth = FirebaseAuth.instance;
var currentUser = _auth.currentUser;
final CollectionReference dataa = FirebaseFirestore.
instance.collection("${currentUser!.email.toString()}s" );
class _favouriteState extends State<favourite> {
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(dataa.toString());

  }
  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      
      backgroundColor: Colors.grey.shade300,
      body: StreamBuilder(
          stream:  dataa.snapshots(),
          builder: (context,
              AsyncSnapshot<QuerySnapshot?>StreamSnapshot)
          {    if(StreamSnapshot.hasData){

            return

              ListView.builder(padding: EdgeInsets.all(14),
                  itemCount: StreamSnapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    String ant ='N';
                    final DocumentSnapshot documentSnapshot
                    = StreamSnapshot.data!.docs[index];
                    Color  love = Colors.red;
                    Color  lover = Colors.white;
                    Color  lov = lover;

                    return   Column(
                      children: [
                        Card(child: ListTile(
                          title:  Text(documentSnapshot['name']??""
                            ,style: TextStyle(color: Colors.blue,fontSize: 14),),
                          subtitle: Row(children: [ Text(documentSnapshot['phone']??""
                   )
                            ,SizedBox(width: 99,),
                          ],),
                        ) ),
                        Row(
                          children: [ SizedBox(width: 22,),
                            MaterialButton(onPressed:(){setState(() {
                              dataa.doc(documentSnapshot.id).delete();
                            });},
                              child: Container(
                                decoration: BoxDecoration(borderRadius:
                                BorderRadius.circular(11), border: Border.all(width: 1,color: Colors.orange.shade800)),
                                child: Icon(Icons.delete_outlined,color:
                                Colors.orange.shade800,size: 29,),),
                            ),
                          ],
                        ),  ],
                    );
                  });} else{  return Container(color: Colors.white);}

          }),
    ) ;
  }
}
