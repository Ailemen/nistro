import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:maptest/lib/screens/buyer/frontpage.dart';


import '../screens/buyer/detail.dart';



class userskills extends StatefulWidget {
  const userskills({Key? key}) : super(key: key);

  @override
  State<userskills> createState() => _userskillsState();
}

class _userskillsState extends State<userskills> {
  @override
  final CollectionReference data = FirebaseFirestore.instance.collection('nistroskills');
  Widget build(BuildContext context) {
    return   Scaffold(body:
    StreamBuilder(
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

                  return   MaterialButton(onPressed: (){ setState(() {
                    skills=documentSnapshot['skill']??"";
        ScaffoldMessenger.of(context).showSnackBar
        (SnackBar(content: Text(skills)));},
                  ); },
                    child: Card(child: ListTile(title: Row(
                      children: [ Text(documentSnapshot['skill']??"" ),



                      ],
                    )),),
                  );
                });} else{  return Container();}

        }));
    ;
    ;
  }
}
