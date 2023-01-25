import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:maptest/lib/screens/buyer/detail.dart';




class sellditails extends StatefulWidget {
  const sellditails({Key? key}) : super(key: key);

  @override
  State<sellditails> createState() => _sellditailsState();
}
CollectionReference data = FirebaseFirestore.instance.collection('info');

Future addTorequest() async {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  var currentUser = _auth.currentUser;
  CollectionReference _collectionRef =
  FirebaseFirestore.instance.collection("users-cart-items");
  var widget;
  return _collectionRef
      .doc(currentUser!.uid).collection('userfave').
  add( {"name":sellname ,"location":selllocation,"url":sellurll,"phone":sellphone});}

class _sellditailsState extends State<sellditails> {
  @override
  Widget build(BuildContext context) {
    String sellurl;
    return Card(child: ListTile(title: Column(
      children: [ Container(height: 222,width: 299,
        color: Colors.grey,
        child: Image(fit: BoxFit.cover
            , image: NetworkImage('hhh')),),

        Text(selllocation ),
        Text(selllocation ),
        ElevatedButton(onPressed: (){
           setState(() {
            // addTorequest();
           //  data.doc(snapshotj.id).collection('jobs').add( {"":""});
           });
        }, child:Text('Request'))

      ],
    )),) ;
  }
}
