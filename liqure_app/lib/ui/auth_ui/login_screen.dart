import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:liqure_app/ui/auth_ui/forgetpw_screen.dart';
import 'package:liqure_app/ui/auth_ui/signup_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Container(
            child: Image.asset("images/liqureoriginal.jpg"),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.email,
                    size: 30,
                  ),
                  hintText: "Email",
                  // hintStyle: TextStyle(color: Color.fromARGB(255, 228, 214, 160)),
                  hintStyle: TextStyle(color: Colors.black, fontSize: 25),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(20)),
              child: TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.lock,
                    size: 30,
                  ),
                  hintText: "Password",
                  hintStyle: TextStyle(color: Colors.black, fontSize: 25),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            height: 50,
            width: 130,
            child: ElevatedButton(
                onPressed: () {},
                child: const Text(
                  "Login",
                  style: TextStyle(fontSize: 25, color: Colors.black),
                )),
          ),
          const SizedBox(
            height: 20,
          ),
          GestureDetector(
              onTap: () {
                Get.to(const ForgetpwScreen());
              },
              child: const Text(
                "forget password?",
                style: TextStyle(fontSize: 19, color: Colors.grey),
              )),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Don't have an account?",
                style: TextStyle(fontSize: 19, color: Colors.grey),
              ),
              SizedBox(
                width: 10,
              ),
              GestureDetector(
                onTap: () {
                 Get.to(const SignupScreen());
                },
                child: Text(
                  "Sign Up",
                  style: TextStyle(
                      fontSize: 19,
                      color: Colors.grey,
                      fontWeight: FontWeight.bold),
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  height: MediaQuery.of(context).size.height * 0.15,
                  width: MediaQuery.of(context).size.width * 0.15,
                  child: Image.asset("images/googlelogo.png")),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.05,
              ),
              Container(
                  height: MediaQuery.of(context).size.height * 0.15,
                  width: MediaQuery.of(context).size.width * 0.15,
                  child: Image.asset(
                    "images/facebook.png",
                  )),
            ],
          )
        ],
      ),
    );
  }
}
