import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/global/button.dart';
import 'package:flutter_application_1/global/textfield.dart';
import 'package:flutter_application_1/home.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  
  Future <bool> auth( context) async{
    try{
      final userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(email: _email.text.trim(), password: _password.text.trim());
       ScaffoldMessenger.of(context).showSnackBar(
       SnackBar(content: Text('Welcome back ${userCredential.user?.displayName}')),
      
    );
    return true;
    } on FirebaseAuthException catch(e){
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.message??"something went wrong..")));
        return false;
    }
    
  }
 final TextEditingController _email = TextEditingController();
    final TextEditingController _password = TextEditingController();
  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text("Sign-In",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
      ),
      body: Column(children: [
        SizedBox(height: 10,),
        CustomTextField(label: 'email', icons: Icons.email, controller: _email,),
        CustomTextField(label: 'password', icons: Icons.password, controller: _password,),
        SizedBox(height: 10,),
        CustomButton(
          label: 'Sign-In', onPressed: () async { 
          if(_email.text.isNotEmpty && _password.text.isNotEmpty){
                bool isCreated = await auth(context);

                if(isCreated){
                      Navigator.push(context, MaterialPageRoute(builder:(context) => HomeScreen()));
                }
                
          }
         else{
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('enter password and email..')));
                }
                
         
         },),
        SizedBox(height: 10,),
        Text("Don't have an Account??",style: TextStyle(fontSize: 16),),
       // SizedBox(height: 10,),
        TextButton(onPressed: (){
          Navigator.pushNamed(context, "/sign-up");
        }, child: Text("Sign-Up",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),))
        
      ],),
    );
  }
}

