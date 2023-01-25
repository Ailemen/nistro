
import 'package:flutter/material.dart';

import 'choose.dart';

class entry extends StatefulWidget {
  const entry({Key? key}) : super(key: key);

  @override
  State<entry> createState() => _entryState();
}

class _entryState extends State<entry> {
  @override
  
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(seconds: 2)).whenComplete((){
      setState(() {
        Navigator.of(context).pushReplacement(MaterialPageRoute
          (builder: (context)=>pick()));
      });
    });
  }
  Widget build(BuildContext context) {
    return  Container( child: Column(
      children: [ SizedBox(height: 355,),
        Center(child: CircularProgressIndicator(color: Colors.white,)),
      ],
    ),
        height: MediaQuery.of(context).size.height,
    width: double.infinity,
    decoration: BoxDecoration(image:
    DecorationImage(image: AssetImage('assets/a.png'), fit: BoxFit.cover)),
    ) ;
  }
}
