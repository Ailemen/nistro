import 'package:flutter/material.dart';
import 'package:maptest/lib/screens/seller.dart';




class firstentry extends StatefulWidget {
  const firstentry({Key? key}) : super(key: key);

  @override
  State<firstentry> createState() => _firstentryState();
}

class _firstentryState extends State<firstentry> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey.shade800,
        body: Container( color: Colors.white10,child: Center(child:
    Column(
      children: [ SizedBox(height:99,),

        Container(
            height: 99,width: 99
            ,child: Image(image: AssetImage( 'assets/a.png' ),fit: BoxFit.cover,)),
        SizedBox(height: 27,),
        Text(' Seller Mode',style: TextStyle(fontSize: 22,color: Colors.white),),
        SizedBox(height: 88,),
        MaterialButton( minWidth: 99,height: 44,
            shape:  Border.all(width: 1,color: Colors.orange),
            onPressed: (){

              Navigator.push(context, MaterialPageRoute(builder:
                  (context)=>BottomNavController()));

            }, child: Text('Continue',style: TextStyle(color: Colors.white),))
      ],
    ),)));
  }
}
