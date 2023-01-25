import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}
final CollectionReference data = FirebaseFirestore.instance.collection('info');
class _HomeScreenState extends State<HomeScreen> {
  final String? userName = FirebaseAuth.instance.currentUser?.displayName;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.orange,
        title: const Text(" Nistro"),centerTitle: true,
      ),
      body:Scaffold(body:
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

                    return   Card(child: ListTile(title: Row(
                      children: [ Container(height: 222,width: 299,
                        color: Colors.grey,
                        child: Image(fit: BoxFit.cover
                            , image: NetworkImage(documentSnapshot['urll'])),),

                        Text(documentSnapshot['name']??"" ),
                        Text(documentSnapshot['name']??"" ),
                        Text(documentSnapshot['name']??"" ),
                      ],
                    )),);
                  });} else{  return Container();}

           })));

  }
}
