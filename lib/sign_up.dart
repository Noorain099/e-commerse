import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/global/button.dart';
import 'package:flutter_application_1/global/textfield.dart';

class SignUpScreen extends StatefulWidget {
 const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
 final TextEditingController _name = TextEditingController();

    final TextEditingController _email = TextEditingController();

    final TextEditingController _password = TextEditingController();

    final TextEditingController _phone = TextEditingController();

  Future<bool> auth(context) async{
    try{
        final userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _email.text.trim(), 
          password: _password.text.trim()
          );
          await  userCredential.user?.updateDisplayName(_name.text.trim());
          
            await FirebaseFirestore.instance.collection('users').doc(userCredential.user?.uid).set(
              {
                'name' : _name.text.trim(),
                'email' : _email.text.trim(),
                'phone-no' : _phone.text.trim(),
                'createdAt' :  Timestamp.now()
              }
            );
           ScaffoldMessenger.of(context).showSnackBar(
       SnackBar(content: Text('Sign-up successful!')),);
        return true;
        
    } on FirebaseAuthException catch(e){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.message??"something went wrong..")));
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       resizeToAvoidBottomInset: false,
      appBar: AppBar(title: Text("Sign-Up",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),),
      body: Column(
        
        children: [
        SizedBox(height: 10,),
        CustomTextField(label: 'Name', icons: Icons.person, controller: _name,),
        CustomTextField(label: 'Email', icons: Icons.email, controller: _email,),
        CustomTextField(label: 'Password', icons: Icons.password, controller: _password,),
        CustomTextField(label: 'Phone No', icons: Icons.phone, controller: _phone,),
        SizedBox(height: 10,),
        CustomButton(label: 'Sign-Up', onPressed: () async{ 

          if(_email.text.isNotEmpty && _password.text.isNotEmpty && _phone.text.isNotEmpty && _name.text.isNotEmpty){
            bool isCreated = await auth(context);

            if(isCreated){
              //Navigator.pushNamed(context, "/home");
                await Future.delayed(Duration(milliseconds: 300)); // Delay before navigation
                Navigator.pushReplacementNamed(context, "/home");
                // print("User created, navigating to home...");
                // await Future.delayed(Duration(milliseconds: 300));
                // Navigator.pushReplacementNamed(context, "/home");
                // print("Navigation called");

              
            }
            
          }
          else{
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Enter al details...')));
          }
          
          
         },),
        SizedBox(height: 10,),
        Text("Already have an Account??",style: TextStyle(fontSize: 16),),
       // SizedBox(height: 10,),
        TextButton(onPressed: (){
          Navigator.pushNamed(context, "/sign-in");
        }, child: Text("Sign-In",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),))
        
      ],),
    );
  }
}