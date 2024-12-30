import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:movie_ui/auth/database.dart';
import 'package:movie_ui/ui/movie_ui.dart';

class GoogleLogin {

  final FirebaseAuth auth = FirebaseAuth.instance;

  getCurrentUser() async{
  return await auth.currentUser;
  }

  signInWithGoogle(BuildContext context)async{
      final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
      final GoogleSignIn googleSignIn = GoogleSignIn();
      
      final GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();

      final GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount!.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        idToken: googleSignInAuthentication.idToken,
        accessToken: googleSignInAuthentication.accessToken,
      );
      UserCredential result = await firebaseAuth.signInWithCredential(credential);
      User? userDetail =  result.user;

      if(result!= null){
        Map<String,dynamic> userInfoMap = {
          "email": userDetail!.email,
          "name": userDetail.displayName,
          "imgUrl": userDetail.photoURL,
          "uid": userDetail.uid,
        };
        await Database().addUser(userDetail.uid, userInfoMap).then((onValue){
            Navigator.push(context,MaterialPageRoute(builder: (context)=> MovieScreen()));
        });
      }

      

        

  }


  signInGoogle(BuildContext context)async{
    GoogleSignInAccount? googleSignInAccount = await GoogleSignIn().signIn();
    
    GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount!.authentication;



    AuthCredential credential = GoogleAuthProvider.credential(
      idToken: googleSignInAuthentication.idToken ,
      accessToken: googleSignInAuthentication.accessToken ,
    );

    UserCredential result = await FirebaseAuth.instance.signInWithCredential(credential);
    if(result.user != null){
      Navigator.push(context, MaterialPageRoute(builder: (context)=> MovieScreen()));
    }
  }

  
}