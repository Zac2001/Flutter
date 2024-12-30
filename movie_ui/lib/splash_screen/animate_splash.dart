import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:movie_ui/auth/login_form.dart';
import 'package:movie_ui/ui/movie_ui.dart';

class AnimatedSplash extends StatefulWidget {
  const AnimatedSplash({super.key});

  @override
  State<AnimatedSplash> createState() => _AnimatedSplashState();
}

class _AnimatedSplashState extends State<AnimatedSplash> {
  

  bool _isLogin = false;
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
    splash: Center(
      child: LottieBuilder.asset("images/Main Scene.json"),
    ), 
    splashIconSize: 300,
    animationDuration: const  Duration(seconds: 2),

    nextScreen:_isLogin ? MovieScreen() :  LoginForm());
  }

  chedkLogin() async{
    FirebaseAuth auth = FirebaseAuth.instance;
    auth.authStateChanges().listen((User? user){
      if(user != null && mounted){
        setState(() {
          _isLogin = true;
        });
      }
    });
  }

  @override
  void initState() {  
    super.initState();
    chedkLogin();
  }
}