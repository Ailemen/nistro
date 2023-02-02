import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:like_button/like_button.dart';
import 'package:maptest/lib/screens/buyer/detail.dart';
import 'package:maptest/lib/screens/buyer/request.dart';
import 'package:maptest/lib/screens/home_screen.dart';
import 'package:maptest/main.dart';
import 'package:google_sign_in/google_sign_in.dart';




//import '../seller pages/sellerprofil.dart';

class frontbuyer extends StatefulWidget {
  const frontbuyer({Key? key}) : super(key: key);

  @override

  State<frontbuyer> createState() => _frontbuyerState();
}


String? _currentAddress;
Position? _currentPosition;
// anonimouse sign in part
final FirebaseAuth _auth = FirebaseAuth.instance;
final FirebaseFirestore firestoree = FirebaseFirestore.instance;
void _createe() async {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  var currentUser = _auth.currentUser;
  try {
    await firestore.collection("${currentUser!.email.toString()}s").doc(
        currentUser!.email.toString()
    ).set({'name':'',
      'phone': ' ',
    },SetOptions(merge: false));
  } catch (e) {
    print(e);
  }
}

String thename = '';

Future<bool > onLikeButtonTapped(bool isLiked) async{
  /// send your request here
   final bool success= await sendRequest( );

  Fluttertoast.showToast(
      msg: "Favourite Added",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.SNACKBAR,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 16.0
  );
  /// if failed, you can do nothing
   return success? !isLiked:isLiked;

  return !isLiked;
}

sendRequest() {


}
// for  user favourite
final FirebaseFirestore firestore = FirebaseFirestore.instance;

var currentUser = _auth.currentUser;
final CollectionReference favee = FirebaseFirestore.instance.
collection("${currentUser!.email.toString()}s");

final TextEditingController _emailController = TextEditingController();
final TextEditingController _passwordController = TextEditingController();


class _frontbuyerState extends State<frontbuyer> {


  void _create() async {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    var currentUser = _auth.currentUser;
    try {
      await firestore.collection(skills).doc(currentUser!.email.toString()
      ).set({

         'rate': 1,
          'ratee': 1,


      },SetOptions(merge: true)).whenComplete(() {
        setState(() {
         // /Navigator.pop(context);
         // ScaffoldMessenger.of(context).showSnackBar
         //   (SnackBar(content: Text('Uploaded')));
        });
      });
    } catch (e) {
      print(e);
    }
  }
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
      setState(() => positionnn  = position);
      _getAddressFromLatLng(positionnn!);
    }).catchError((e) {
      debugPrint(e);
    });
  }

  Future<void> _getAddressFromLatLng(Position position) async {
    await placemarkFromCoordinates(
       positionnn!.latitude,positionnn!.longitude)
        .then((List<Placemark> placemarks) {
      Placemark place = placemarks[0];
      setState(() {
       placee =
        '${place.street}, ${place.subLocality},\n${place.name},'
            ' ${place.subAdministrativeArea}, \n'
            '  ${place.subThoroughfare}';
      });
    }).catchError((e) {
      debugPrint(e);
    });
  }


  Future<void> addressm() async {
    await  _getCurrentPosition();
        _getAddressFromLatLng(positionnn!);
  }

  @override

//inistate for favourites and  annonimouse sgn in
  void initState() {
    addressm();
    // TODO: implement initState
    super.initState();
  //  _create();
    _createe();
    print(_currentAddress  );

    _getCurrentPosition().whenComplete((){setState(() {

      _getAddressFromLatLng(_currentPosition!).whenComplete(() {
        print(placee );
      setState(() {

       // Future.delayed(Duration(seconds:4 )).whenComplete(() =>print(placee) );
      });
      print(_currentAddress  );});

      print('yessss');
      print(placee);
      print(positionnn!.longitude);
      print(positionnn!.latitude);
      Future.delayed(Duration(seconds:4 ));
      print(_currentPosition!.longitude);
    });});
  }

  @override


 final GoogleSignIn gog = GoogleSignIn();

final CollectionReference data = FirebaseFirestore.instance.collection(skills);
final CollectionReference job = FirebaseFirestore.instance.collection(sellphone.toString());
final FirebaseAuth _auth = FirebaseAuth.instance;

  Widget build(BuildContext context) {
    return Scaffold(  appBar: AppBar(
      title: Row(
        children: [ Container( height: 88,width: 88,child:
        Image(image: AssetImage( 'assets/a.png' ),
          fit: BoxFit.cover,)),
          Column(
            children: [
              Text('Nistro',style: TextStyle(color: Colors.black,fontSize:
              22,fontWeight: FontWeight.bold),),
              Text("${skills}s",style: TextStyle(color: Colors.orange,fontSize:14,fontWeight: FontWeight.bold),),
            ],
          ),
        ],
      )
      ,backgroundColor: Colors.white,actions:
    [MaterialButton(  onPressed: (){
    gog.disconnect().whenComplete(() =>  Navigator.pop(context));

      _auth.signOut();
    },child: Text('LogOut'))],),backgroundColor: Colors.white,
        body:
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
                     final num rateno =documentSnapshot['ratee'] /
                         documentSnapshot['rate']??"";
                  final num rate =documentSnapshot['rate'];
                  final num ratee =documentSnapshot['ratee'];

                  return   Column(
                    children: [
                      SizedBox(height: 17,),
                      Card( color: Colors.white,child: ListTile(title: Column(
                        children: [ Container(height: 211,width: 444,
                          decoration: BoxDecoration(image:DecorationImage(image:NetworkImage(
                              documentSnapshot['url']??''
                          ),fit: BoxFit.cover),borderRadius:
                          BorderRadius.circular(11), border: Border.all(width: 1,color: Colors.white)),),
                          SizedBox(height: 6,),
                          Container(  padding: EdgeInsets.all(7),   decoration: BoxDecoration(borderRadius:
                          BorderRadius.circular(11), border: Border.all(width: 1,color: Colors.grey)),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                Container(child: Text(   'Name:' ,style: TextStyle(color: Colors.black),)), SizedBox(width: 11,),
                                    Text(documentSnapshot['name']??"",style:
                                    TextStyle(color: Colors.grey,),softWrap: true,),
                                    Text('  , ',style: TextStyle(color: Colors.black,),)

                                  ],
                                ),
                                Row(
                                  children: [
                                    Container(
                                      child: Text('Phone: ',style: TextStyle(color: Colors.black,
                                      ),),
                                    ), SizedBox(width: 11,),
                                    Text(documentSnapshot['phone']??"",
                                      style: TextStyle(color:
                                      Colors.grey),),
                                  ],
                                ),

                                Row(
                                  children: [
                                    Container(child: Text('Location:',style: TextStyle(color: Colors.black,),)), SizedBox(width: 11,),
                                    Text(documentSnapshot['location']??"",style:
                                    TextStyle(color: Colors.grey),softWrap: true,),
                                  ],
                                ),


                                Row(
                                  children: [
                                    Container(child: Text('Price/hour :₦',style: TextStyle(color: Colors.black,),)), SizedBox(width: 1,),
                                    Text(documentSnapshot['price']??"",style:
                                    TextStyle(color: Colors.black),softWrap: true,),
                                  ],
                                ),

                              ],
                            ),
                          ),
  Row(
                          children: [


                           MaterialButton( height: 9,minWidth: 11,shape: StadiumBorder(side: BorderSide(width:
                           1,color: Colors.blue.shade800,)),

                               onPressed: ( ){

                                 Navigator.push(
                                     context,
                                     MaterialPageRoute(
                                         builder: (context) => MyHomePage(title: '')));
                                 setState(() {

                                 sellname  =documentSnapshot['id']??"";
                                 print(documentSnapshot['id']);
                                   Navigator.push(
                                       context,
                                       MaterialPageRoute(
                                           builder: (context) => MyHomePage(title: '')));
                                 });
                      }, child: Text('Request',style: TextStyle(color: Colors.blue.shade700),)),
                            SizedBox(width: 55,),MaterialButton(
                                height: 9,minWidth: 11,shape: StadiumBorder(side: BorderSide(width:
                            1,color: Colors.blue.shade800)),

                                onPressed: ( ){
                                 setState((){


                                   showDialog(
                                       context: context,
                                       builder: (context) => AlertDialog(
                                           title :Text(documentSnapshot['ditail']??""
                                         ,style: TextStyle(color: Colors.blue,fontSize: 11),softWrap: true,
                                           ),
                                           actions: [


                                           ]));
                                 });
                                }, child: Text('About',style: TextStyle(color: Colors.blue.shade700),)),

                          ],
                        ),
                        Container( height: 14,width: 444,
                          child: RatingBar.builder(
                            itemSize: 17,
                            initialRating: rateno.toDouble(),
                            minRating: 1,
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            itemCount: 5,
                            itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                            itemBuilder: (context, _) => Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                            onRatingUpdate: (rating) {
                              print(rating);
                            },
                          ),
                        ),


                          Row(
                            children: [
                              MaterialButton(
                                  height: 9,minWidth: 11,shape: StadiumBorder(side: BorderSide(width:
                              1,color: Colors.orange.shade800)),

                                  onPressed: ( ){

                                    showDialog(
                                        context: context,
                                        builder: (context) => AlertDialog(
                                            title: const Text(
                                                "Tap stars to rate"),
                                            actions: [

                                              RatingBar.builder(
                                                itemSize: 44,
                                                initialRating: 3,
                                                minRating: 1,
                                                direction: Axis.horizontal,
                                                allowHalfRating: true,
                                                itemCount: 5,
                                                itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                                                itemBuilder: (context, _) => Icon(
                                                  Icons.star,
                                                  color: Colors.amber,
                                                ),
                                                onRatingUpdate: (rating) {
                                                  print(rating);
                                                  setState(() {
                                                  data.doc(documentSnapshot.id).update(
                                                    {  'ratee':rating+ratee,
                                                      'rate':rate +1,}
                                                  );
                                                  });
                                                },
                                              ),


                                            ]));
                                  }, child: Text('Rate',style: TextStyle(color: Colors.amber.shade700),)),
  //  Container( decoration: BoxDecoration( image: DecorationImage(image: AssetImage(''))),)
                                      SizedBox(width: 72,),
                              MaterialButton(onPressed: (){
                                favee.add({"name":documentSnapshot['name'],"phone":documentSnapshot['phone']},);
                                Fluttertoast.showToast(
                                    msg: "Fav added ❤️❤",
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.SNACKBAR,
                                    timeInSecForIosWeb: 1,

                                    textColor: Colors.white,
                                    fontSize: 11.0
                                );
                              },
                                child: Icon(Icons.favorite_outline,color:
                                Colors.red,size: 29,)
                              ),

                            ],
                          ),
                        ],
                      )),),
                    ],
                  );
                });} else{  return Container();}

        }));;
  }
}
