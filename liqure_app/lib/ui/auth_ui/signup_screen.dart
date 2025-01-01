import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:liqure_app/ui/auth_ui/login_screen.dart';
import 'package:liqure_app/ui/home_ui/home_screen.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {

  TextEditingController _nameController = TextEditingController();
  TextEditingController _mailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  String email = "",name = "", password = "";
  
  registeration()async{
    
   
    if(password != null && _mailController.text != "" && _nameController.text != "" ){
        try{

             UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
             ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Signup Successfully")));
             Get.to(const HomeScreen());

        }on FirebaseAuthException catch(e){
          if(e.code == "already user"){
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("User already exits")));
          }
        }
    }

  }

  

  @override
  void dispose() {
    _nameController.dispose();
    _mailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.black,
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            Container(
              child: Image.asset("images/liqureoriginal.jpg"),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8.0,bottom: 7),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: TextFormField(
                  validator: (value) {
                    if(value == null || value.isEmpty){
                      return "please Enter Name";
                    }
                    return null;
                  },
                  controller: _nameController,
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.person,
                      size: 30,
                    ),
                    hintText: "Name",
                    // hintStyle: TextStyle(color: Color.fromARGB(255, 228, 214, 160)),
                    hintStyle: TextStyle(color: Colors.black, fontSize: 25),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: TextFormField(
                  validator: (value) {
                    if(value == null || value.isEmpty){
                      return "please Enter Email";
                    }
                  },
                  controller: _mailController,
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
          
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white, borderRadius: BorderRadius.circular(20)),
                child: TextFormField(
                  validator: (value) {
                    if(value == null || value.isEmpty){
                      return "please Enter Password";
                    }
                    return null;
                  },
                  controller: _passwordController,
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
                  onPressed: () {
                      if(_formKey.currentState!.validate()){
                        setState(() {
                          email = _mailController.text;
                          name = _nameController.text;
                          password = _passwordController.text;
                        });
                        
                      }
                      registeration();
                  },
                  child: const Text(
                    "Signup",
                    style: TextStyle(fontSize: 25, color: Colors.black),
                  )),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Have already an account?",
                  style: TextStyle(fontSize: 19, color: Colors.grey),
                ),
                SizedBox(
                  width: 10,
                ),
                GestureDetector(
                  onTap: () {
                   Get.to(const LoginScreen());
                  },
                  child: Text(
                    "Login",
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
      ),
    );
  }
}