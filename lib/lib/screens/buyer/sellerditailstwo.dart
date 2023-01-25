import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:maptest/lib/screens/buyer/detail.dart';



class sdt extends StatefulWidget {

   sdt({required this.one,required this.two});

  @override
  String one = '';
   String two = '';
  State<sdt> createState() => _sdtState();
}

class _sdtState extends State<sdt> {
  @override
  CollectionReference data = FirebaseFirestore.instance.collection(selllocation.toString());
   Future <void>created([
     DocumentSnapshot? documentSnapshot
  ]) async {
     data.add({"job": " emmy" });
   }



  Future addTorequest() async {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    var currentUser = _auth.currentUser;
    CollectionReference _collectionRef =
    FirebaseFirestore.instance.collection(sellname);
    var widget;
    return _collectionRef
        .doc(currentUser!.uid).collection('userfave').
    add( {"name":sellname ,"location":selllocation,"url":sellurll,"phone":sellphone});}
  Widget build(BuildContext context) {
    return
      Scaffold(
          body:
          ListView(children: [
            Container(height: 222,width: 299,
              decoration: BoxDecoration(borderRadius:
              BorderRadius.circular(11), border: Border.all(width: 2,color: Colors.orange.shade800)),

              child: Image(fit: BoxFit.cover
                  , image: NetworkImage(sdt(one: '', two: '').one)),),
 SizedBox(height: 22,),
            Container(height: 222,width: 299,
              decoration: BoxDecoration(borderRadius:
              BorderRadius.circular(11), border: Border.all(width: 2,color: Colors.orange.shade800)),

              child: Image(fit: BoxFit.cover
                  , image: NetworkImage(sdt(one: '', two: '').two))),
          ],)
      );
  }
}
