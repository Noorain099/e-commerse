import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/firebase_options.dart';
import 'package:flutter_application_1/home.dart';
import 'package:flutter_application_1/sign_in.dart';
import 'package:flutter_application_1/product-details.dart';
import 'package:flutter_application_1/product_list.dart';
import 'package:flutter_application_1/sign_up.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        
      ),
      home: LoginScreen(),
      routes: {
        "/home" : (context) => HomeScreen(),
        "/sign-in" : (context) => LoginScreen(),
        "/sign-up" : (context) => SignUpScreen(),
      },
    );
  }
}

