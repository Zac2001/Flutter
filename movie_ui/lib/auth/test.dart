import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:movie_ui/auth/google_login.dart';
import 'package:movie_ui/auth/login_form.dart';
import 'package:movie_ui/ui/movie_ui.dart';

class TestLogin extends StatefulWidget {
  const TestLogin({super.key});

  @override
  State<TestLogin> createState() => _TestLoginState();
}

class _TestLoginState extends State<TestLogin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream:  FirebaseAuth.instance.authStateChanges(),
        builder:(context, snapshot){

          if(snapshot.hasError){
            return Text(snapshot.error.toString());
          }else if(snapshot.connectionState == ConnectionState.active){
            if(snapshot.data == null){
              return LoginForm();
            }else{
              return MovieScreen();
            }
          }

        return Column(
          children: [
            GestureDetector(
              onTap: () async {
               await GoogleLogin().signInGoogle(context);
              },
              child: Text("Test Login")),
            SizedBox(height: 20,),
            GestureDetector(
              onTap: () async{
               await GoogleSignIn().signOut();
               FirebaseAuth.instance.signOut();
              },
              child: Text("Test Log out"))
          ],
         );
        }
      ),
    );
  }
}