import 'package:bmi_project/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

 class MyApp extends StatelessWidget {
   const MyApp({Key? key}) : super(key: key);

   @override
   Widget build(BuildContext context) {
     return MaterialApp(
       debugShowCheckedModeBanner: false,
       theme: ThemeData(
         primarySwatch: Colors.teal,
         canvasColor: Colors.black,
         iconTheme: const IconThemeData(color: Colors.white),
         textTheme: const TextTheme(
           headline1: TextStyle(
             fontSize: 45,
             fontWeight: FontWeight.w800,
             color: Colors.white,
           ),
             headline2: TextStyle(
               fontSize: 25,
               fontWeight: FontWeight.bold,
               color: Colors.black,
             ),
           bodyText1: TextStyle(
             fontSize: 20,
             fontWeight: FontWeight.bold,
             color: Colors.black,
           )
         )
       ),
       home: const HomeScreen(),
     );
   }
 }
