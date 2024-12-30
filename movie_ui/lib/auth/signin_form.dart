import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:movie_ui/auth/login_form.dart';
import 'package:movie_ui/splash_screen/animate_splash.dart';
import 'package:movie_ui/ui/movie_ui.dart';

class SigninForm extends StatefulWidget {
  SigninForm({super.key});

  @override
  State<SigninForm> createState() => _SigninFormState();
}

class _SigninFormState extends State<SigninForm> {
  TextEditingController _nameController = TextEditingController();

  TextEditingController _emailController = TextEditingController();

  TextEditingController _passwordController = TextEditingController();

  final  _globalKey = GlobalKey<FormState>();

  String name = "", email = "", pass = "";
  bool _obscureText = true;

  registration() async {
    if (pass != null &&
        _nameController.text != "" &&
        _emailController.text != "") {
      try {
        
        FirebaseAuth.instance.authStateChanges().listen((User? user){
            if(user == null){
              print("User is currently signout");
            }else{
              print("User is signed in");
            }
        });

        UserCredential userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: pass);
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: (Text("Register successfully"))));
        Navigator.push(
            context, MaterialPageRoute(builder: (_) =>  MovieScreen()));
      } on FirebaseAuthException catch (e) {
        if (e.code == "weak password") {
          ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(content: (Text("Your password is weak"))));
        } else if (e.code == "already exits") {
          ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(content: (Text("email already exist"))));
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      body: Form(
        key: _globalKey,
        child: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("images/cinemalogo.jpg"),
                const SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30, right: 30),
                  child: Container(
                    child: Column(
                      children: [
                        TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Enter Name";
                            }
                            return null;
                          },
                          controller: _nameController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20)
                            ),
                            labelText: "Name",
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Enter email";
                            }
                            return null;
                          },
                          controller: _emailController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20)
                            ),
                            labelText: "Email",
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        TextFormField(
                          obscureText: _obscureText,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Enter Password";
                            }
                            return null;
                          },
                          
                          controller: _passwordController,
                          decoration: InputDecoration(
                            suffixIcon: passwordInput(),
                              border: OutlineInputBorder(
                                
                                borderRadius: BorderRadius.circular(20)
                              ), labelText: "Password"),
                        ),
                        const SizedBox(
                          height: 15,
                        )
                      ],
                    ),
                  ),
                ),
                FilledButton(
                  onPressed: () {
                    if(_globalKey.currentState!.validate()){
                      setState(() {
                        name = _nameController.text;
                      email = _emailController.text;
                      pass = _passwordController.text;
                      });
                    }
                    registration();
                  },
                  child: const Text("SignUp"),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Have already an account?",
                      style: TextStyle(color: Colors.grey),
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.of(context)
                              .push(MaterialPageRoute(builder: (_) => LoginForm()));
                        },
                        child: const Text("LogIn"))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  passwordInput(){
    IconButton(onPressed: (){
      setState(() {
        _obscureText = !_obscureText;
      });
    }, icon: _obscureText ? const  Icon(Icons.visibility) : const Icon(Icons.visibility_off),);
  }
}
