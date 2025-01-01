
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:liqure_app/ui/auth_ui/login_screen.dart';
import 'package:liqure_app/ui/auth_ui/signup_screen.dart';


void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp( MyApp());
}

class MyApp extends StatefulWidget {
   MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  SignupScreen signupScreen = Get.put(const SignupScreen());

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
      // SplashScreen(),
    );
  }
}