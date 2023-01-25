import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


import '../services/firebase_auth_service.dart';
import '../widgets/customized_button.dart';
import '../widgets/customized_textfield.dart';
import 'buyer/buymain.dart';
import 'forgot_passwor.dart';
import 'signup_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}
final TextEditingController _emailController = TextEditingController();
final TextEditingController _passwordController = TextEditingController();
class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController myController = TextEditingController();
   String? hintText;
   bool isPassword=true;
  bool   autocorrect =true ;
   bool  obscuretext = true;
  GlobalKey  keyyy =GlobalKey<_LoginScreenState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold( backgroundColor: Colors.black,
          body: SizedBox(
            height: MediaQuery.of(context).size.height,
            width: double.infinity,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(11, 1, 11, 1),
                    child: Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black, width: 1),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: IconButton(
                          icon: const Icon(Icons.arrow_back_ios_sharp),
                          onPressed: () {
                            Navigator.pop(context);
                          }),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.fromLTRB(11, 1, 11, 1),
                    child: Text("Welcome Back! Glad \nto see you again",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        )),
                  ),SizedBox(height: 1,),
            Padding(
              padding: const EdgeInsets.all(19.0),
              child: Form(
                key: keyyy,
                child: TextFormField(
                  validator: ( value){
                    if(value == null || value.isEmpty ){
                      return 'Please add Email';
                    }
                  },

                  enableSuggestions: isPassword! ? false : true,
                  autocorrect: isPassword! ? false : true,

                  controller: _emailController,
                  decoration: InputDecoration(

                    enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Color(0xffE8ECF4), width: 1),
                        borderRadius: BorderRadius.circular(10)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Color(0xffE8ECF4), width: 1),
                        borderRadius: BorderRadius.circular(10)),
                    fillColor: const Color(0xffE8ECF4),
                    filled: true,
                    hintText: 'Email',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),

            )
                 , SizedBox(height: 5,),
            Padding(
              padding: const EdgeInsets.all(19.0),
              child: TextField(
                keyboardType: isPassword!
                    ? TextInputType.visiblePassword
                    : TextInputType.emailAddress,
                enableSuggestions: isPassword! ? false : true,
                autocorrect: autocorrect ,
                obscureText: obscuretext?? true,
                controller: _passwordController,
                decoration: InputDecoration(
                  suffixIcon:  obscuretext == true
                    ? IconButton(
                    onPressed: () {
              setState(() {
              obscuretext = false;
              });
              },
                  icon: Icon(
                    Icons.remove_red_eye,
                    size: 20,
                  ))
                    : IconButton(
                onPressed: () {
          setState(() {
          obscuretext = true;
          });
          },
              icon: Icon(
                Icons.visibility_off,
                size: 20
              )
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Color(0xffE8ECF4), width: 1),
                      borderRadius: BorderRadius.circular(10)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Color(0xffE8ECF4), width: 1),
                      borderRadius: BorderRadius.circular(10)),
                  fillColor: const Color(0xffE8ECF4),
                  filled: true,
                  hintText: 'Password',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
             )
                ,
                  Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const ForgotPassword()));
                        },
                        child: const Text("Forgot Password?",
                            style: TextStyle(
                              color:Colors.white,
                              fontSize: 15,
                            )),
                      ),
                    ),
                  ),
                  Center(
                    child: CustomizedButton(
                      buttonText: "Login",
                      buttonColor: Colors.orange,
                      textColor: Colors.white,
                      onPressed: () async {
                        if(_emailController.text.isNotEmpty) {
                          //  The else part is not working in the video because we have
                          //  enclosed it in the try catch block. Once we have error in
                          // login the firebase exception is thrown and the codeblock after that
                          // error is skiped and code of catch block is executed.
                          // if we want our else part to be executed we need to get rid from
                          // this try catch or add that code in catch block.

                          try {
                            await FirebaseAuthService().login(
                                _emailController.text.trim(),
                                _passwordController.text.trim());
                            if (FirebaseAuth.instance.currentUser != null) {
                              ScaffoldMessenger.of(context).showSnackBar
                                (SnackBar(content: Text('Signed in')));
                              if (!mounted) return;
                              Navigator.pop(context);
                              await Future.delayed(Duration(seconds: 1));
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => buyerenter()));
                            }

                            //  This code is gone inside the catch block
                            // which is executed only when we have firebaseexception
                            //  else {
                            //   showDialog(
                            //       context: context,
                            //       builder: (context) => AlertDialog(
                            //               title: Text(
                            //                   " Invalid Username or password. Please register again or make sure that username and password is correct"),
                            //               actions: [
                            //                 ElevatedButton(
                            //                   child: Text("Register Now"),
                            //                   onPressed: () {
                            //                     Navigator.push(
                            //                         context,
                            //                         MaterialPageRoute(
                            //                             builder: (context) =>
                            //                                 SignUpScreen()));
                            //                   },
                            //                 )
                            //               ]));

                            // }
                          } on FirebaseException catch (e) {
                            debugPrint("error is ${e.message}");

                            showDialog(
                                context: context,
                                builder: (context) =>
                                    AlertDialog(
                                        backgroundColor: Colors.transparent,
                                        title: const Text(
                                          " Invalid email or\n password",
                                          softWrap: true,),
                                        actions: [
                                          ElevatedButton(
                                            child: const Text("Register Now"),
                                            onPressed: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                      const SignUpScreen()));
                                            },
                                          )
                                        ]));
                          }

                          // Navigator.push(context,
                          //     MaterialPageRoute(builder: (_) => const LoginScreen()));
                        } },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      children: [ SizedBox(width: 22,),
                        Container(
                          height: 1,
                          width: MediaQuery.of(context).size.height * 0.15,
                          color: Colors.grey,
                        ),
                        const Text("Or Login with",style:
                        TextStyle(color: CupertinoColors.white),),
                        Container(
                          height: 1,
                          width: MediaQuery.of(context).size.height * 0.18,
                          color: Colors.grey,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [

                        Container(
                          height: 50,
                          width: 200,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.blue, width: 1),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: IconButton(
                            icon: const Icon(
                              FontAwesomeIcons.google,
                              color: Colors.blue,
                            ),
                            onPressed: () async {
                              showDialog(
                                  context: context,
                                  builder: (context) => AlertDialog(backgroundColor: Colors.transparent,
                                      title:
                                          Center(child: CircularProgressIndicator(color: Colors.orange,)),

                                      actions: [
                                        ]));
                              await FirebaseAuthService().logininwithgoogle();

                              if (FirebaseAuth.instance.currentUser != null) {
                                if (!mounted) return;
                                Navigator.pop(context);
                                await Future.delayed(Duration(seconds: 1));
                              ScaffoldMessenger.of(context).showSnackBar
                              (SnackBar(content: Text('Signed in')));

                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => buyerenter()));
                              } else {   setState(() {
                                Fluttertoast.showToast(
                                    msg: "Connection Error",
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.SNACKBAR,
                                    timeInSecForIosWeb: 1,
                                    backgroundColor: Colors.red,
                                    textColor: Colors.white,
                                    fontSize: 16.0
                                );
                                showDialog(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                      backgroundColor: Colors.transparent,
                                      title:  Text(
                                          "Check network "),


                                      actions: [

                                      ]));});
                                throw Exception(    (     showDialog(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                      backgroundColor: Colors.transparent,
                                      title:  Text(
                                          "Check network "),


                                      actions: [

                                      ]))));
                              }

                            },
                          ),
                        ),

                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(48, 8, 8, 8.0),
                    child: Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children:  [
                        Text("Don't have an account?",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                            )),
                        MaterialButton(
                          child: Text("  Register Now",
                              style: TextStyle(
                                color: Color(0xff35C2C1),
                                fontSize: 12,
                              )),onPressed: (){  Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                               SignUpScreen()));},
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          )),
    );
  }
}
