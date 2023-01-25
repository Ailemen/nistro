import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:maptest/lib/screens/login_screen.dart';

import 'lib/screens/buyer/detail.dart';
import 'lib/screens/buyer/fave.dart';
import 'lib/widgets/customized_textfield.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';


Future<void> main() async {

  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await SystemChrome.setPreferredOrientations([
  DeviceOrientation.portraitUp,
  DeviceOrientation.portraitDown,
  ]);

  runApp(MyApp());}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  void initState() {
    // TODO: implement initState
    Future.delayed(Duration(seconds: 2)).whenComplete(() {
      setState(() {
        FlutterNativeSplash.remove();
      });
    });}
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.orange,
      ),
      home: LoginScreen(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}


class _MyHomePageState extends State<MyHomePage> {

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController adress = TextEditingController();

  String? _currentAddress;
  Position? _currentPosition;

  Future<bool> _handleLocationPermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
              'Location services are disabled. Please enable the services')));
      return false;
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Location permissions are denied')));
        return false;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
              'Location permissions are permanently denied, we cannot request permissions.')));
      return false;
    }
    return true;
  }

  Future<void> _getCurrentPosition() async {
    final hasPermission = await _handleLocationPermission();

    if (!hasPermission) return;
    await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.best)
        .then((Position position) {
      setState(() => _currentPosition = position);
      _getAddressFromLatLng(_currentPosition!);
    }).catchError((e) {
      debugPrint(e);
    });
  }

  Future<void> _getAddressFromLatLng(Position position) async {
    await placemarkFromCoordinates(
        _currentPosition!.latitude, _currentPosition!.longitude)
        .then((List<Placemark> placemarks) {
      Placemark place = placemarks[0];
      setState(() {
        _currentAddress =
        '${place.street}, ${place.subLocality}, ${place.subAdministrativeArea}, ${place.postalCode}';
      });
    }).catchError((e) {
      debugPrint(e);
    });
  }



  @override
  Widget build(BuildContext context) {
    String sending = 'Sending ....';
    final CollectionReference jobber = FirebaseFirestore.
    instance.collection(selllocation);
    void myjobs() async {
      final FirebaseAuth _auth = FirebaseAuth.instance;
      var currentUser = _auth.currentUser;
      try {
        await firestore.collection('$sellname').add({
          'buyername': _passwordController.text.trim(),
          'buyernumber': _emailController.text.trim(),
          'lat': positionnn!.latitude,
          'long':positionnn!.longitude,
          'street':adress.text.trim(),
        }).whenComplete((){ sending ='Send Succesfully';
        Navigator.pop(context);

        ScaffoldMessenger.of(context).showSnackBar
          (SnackBar(content: Text('Request Sent')));});
      } catch (e) {
        print(e);
      }
    }

    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
        body:  Container( color: Colors.grey.shade500,padding: EdgeInsets.all(14),
          child: ListView(
            children: [SizedBox(height: 46,),
              Text('               Add details',style: TextStyle(color:
              Colors.black,fontSize: 21),),
              SizedBox(height: 22,),
              CustomizedTextfield(myController: _emailController,
                hintText: 'your name ',isPassword: false,),
              CustomizedTextfield(myController: _passwordController,
                hintText: 'Your phone .no ',isPassword: false,),
              CustomizedTextfield(myController: adress,
                hintText: 'Job Description',isPassword: false,),

              MaterialButton( minWidth: 77,height: 44,
                  shape: StadiumBorder(side: BorderSide(color: Colors.orange.shade800,width: 1))
                  ,onPressed: (){setState(() {
                    showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                            backgroundColor: Colors.transparent,
                            title: Column(
                              children: [
                                CircularProgressIndicator(color: Colors.orange,),
                                SizedBox(height: 9,),
                                Text(
                                    sending),
                              ],
                            ),
                            actions: [



                            ]));
                  });
                    myjobs();
                    print(_currentPosition!.longitude);
                    print(_currentPosition!.longitude);
                    _getCurrentPosition().whenComplete(()   {
                      print(_currentPosition!.longitude);
                      showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                              title: Column(
                                children: [
                                  CircularProgressIndicator(color: Colors.orange,),
                                  SizedBox(height: 9,),
                                  Text(
                                      sending),
                                ],
                              ),
                              actions: [



                              ]));
                    });
                    print(_currentPosition!.longitude);


                  }, child: Text('Send Requst'))
            ],
          ),
        )

    );
  }
}
