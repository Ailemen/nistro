import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

Future addToCart() async {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  var currentUser = _auth.currentUser;
  CollectionReference _collectionRef =
  FirebaseFirestore.instance.collection("users-cart-items");
  var widget;
  return _collectionRef
      .doc(currentUser!.email)
      .collection("items")
      .doc()
      .set({
    "name": widget._product["product-name"],
    "price": widget._product["product-price"],
    "images": widget._product["product-img"],
  }).then((value) => print("Added to cart"));
}