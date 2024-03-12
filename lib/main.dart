import 'package:cityadmin/Firebase_Firestore/Manage_Bookers/Add_Bookers_Screen.dart';
import 'package:cityadmin/Firebase_Firestore/Manage_Bookers/Manage_Booker_Screen.dart';
import 'package:flutter/material.dart';
import 'Firebase_Firestore/Customers/Customer_Upload_Screen.dart';
import 'Firebase_Firestore/Customers/Customer_View_Screen.dart';
import 'Firebase_Firestore/Products/Add_Products.dart';
import 'Firebase_Firestore/Products/Upload_Product.dart';
import 'Insert_data.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CustomerUpload(),
    );
  }
}
