import 'package:flutter/material.dart';
import 'package:maptest/lib/control/sellerprofil.dart';
import 'package:maptest/lib/control/skills.dart';
import 'package:maptest/lib/screens/buyer/scill.dart';
import 'package:maptest/lib/screens/firstentry.dart';
import 'frontpage.dart';



class buyerenter extends StatefulWidget {
  @override
  _buyerenterState createState() => _buyerenterState();
}

class _buyerenterState extends State<buyerenter> {
  final _pages = [
frontbuyer(),
    userskills(),
    profilepage()
  ];
  var _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: Text(
          "",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 5,
        selectedItemColor:Colors.orange ,
        backgroundColor: Colors.white,
        unselectedItemColor: Colors.black,
        currentIndex: _currentIndex,
        selectedLabelStyle:
        TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        items: [     BottomNavigationBarItem(
            icon: Icon(Icons.house), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_search_outlined), label: "Skills"),
          BottomNavigationBarItem(
              icon: Icon(Icons.home_repair_service), label: "New"),



        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
            print(_currentIndex);
          });
        },
      ),
      body: _pages[_currentIndex],
    );
  }
}
