import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


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
  Widget build(BuildContext context) {
    return   StreamBuilder(
        stream:  dataa.snapshots(),
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

                  return   Card(child: ListTile(title:  Text(documentSnapshot['name']??"" ),));
                });} else{  return Container(color: Colors.white);}

        }) ;
  }
}
