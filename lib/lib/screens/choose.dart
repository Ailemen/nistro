
import 'package:flutter/material.dart';
import 'package:maptest/lib/screens/buyer/buymain.dart';
import 'package:maptest/lib/screens/login_screen.dart';



class pick extends StatefulWidget {
   pick({Key? key}) : super(key: key);

  @override
  State<pick> createState() => _pickState();
}

class _pickState extends State<pick> {
  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
     decoration: BoxDecoration(image:
     DecorationImage(image: AssetImage('assets/c.jpg'), fit: BoxFit.cover)),
        child: Column(
          children: [
      SizedBox(height: 211,),

            MaterialButton( minWidth: 255,elevation: 22,
              height: 55,shape: StadiumBorder(side:
              BorderSide(color: Colors.black,width: 0.5) ),
              child: Text('Buy',style:
              TextStyle(fontSize:22 ,color: Colors.grey.shade300,fontWeight:
              FontWeight.bold,letterSpacing: 2),),
             color: Colors.orange,
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => buyerenter()));
              },
            ),
           Row(children: [  SizedBox(width: 77,), SizedBox(height: 44,),Container(
             height: 1,
             width: MediaQuery.of(context).size.height * 0.15,
             color: Colors.grey,
           ),Text('OR') , Container(
      height: 1,
      width: MediaQuery.of(context).size.height * 0.15,
      color: Colors.grey,
    ),],),
           Container( decoration: BoxDecoration(
           borderRadius: BorderRadius.circular(22),border:
           Border.all(width: 1,color: Colors.black)),
             child: MaterialButton(
               minWidth: 255,
               height: 55,shape: StadiumBorder(),
               child: Text('Sell',style: TextStyle(fontSize:19
                   ,color: Colors.black,fontWeight:
                   FontWeight.bold,letterSpacing: 4),),
                color: Colors.grey.shade300,
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => const LoginScreen()));
                },
              ),
           ),
            const SizedBox(height: 20),
            const Padding(
              padding:  EdgeInsets.all(10.0),
              child: Text(
                "",
                style: TextStyle(color: Color(0xff35C2C1), fontSize: 25),
              ),
            )
          ],
        ),
      ),
    );
      ;
  }
}
