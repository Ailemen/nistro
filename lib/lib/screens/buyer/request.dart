import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:maptest/lib/screens/buyer/detail.dart';
import 'package:maptest/lib/widgets/customized_textfield.dart';

import 'frontpage.dart';





class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override

  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  Widget build(BuildContext context) {

    final CollectionReference jobber = FirebaseFirestore.
    instance.collection(sellname);
    void myjobs() async {
      final FirebaseAuth _auth = FirebaseAuth.instance;
      var currentUser = _auth.currentUser;
      try {
        await firestore.collection(sellname).add({
          'buyername': _passwordController.text.trim(),
          'buyernumber': _emailController.text.trim(),
        }).whenComplete((){ sendings ='Send Succesfully';

          ScaffoldMessenger.of(context).showSnackBar
          (SnackBar(content: Text('Request Sent')));
        });
      } catch (e) {
        print(e);
      }
    }

    return

Scaffold(
        body:  Container(
          child: ListView(
            children: [SizedBox(height: 46,),
              Text('Add details',style: TextStyle(color: Colors.blue.shade700,fontSize: 24),),
              SizedBox(height: 22,),
              CustomizedTextfield(myController: _emailController,
                hintText: 'your name ',isPassword: false,),
              CustomizedTextfield(myController: _passwordController,
                hintText: 'Your phone .no ',isPassword: false,),

             MaterialButton( minWidth: 77,height: 44,
                 shape: StadiumBorder(side: BorderSide(color: Colors.orange.shade800,width: 1))
                 ,onPressed: (){
                setState(() {
                  myjobs();

                  showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
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
                });

              }, child: Text('Send Requst'))
            ],
          ),
        )

    );
  }
}