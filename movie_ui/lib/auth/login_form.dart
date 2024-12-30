import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:movie_ui/auth/forget_pass.dart';
import 'package:movie_ui/auth/google_login.dart';
import 'package:movie_ui/auth/signin_form.dart';
import 'package:movie_ui/ui/movie_ui.dart';
class LoginForm extends StatefulWidget {
  LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  TextEditingController _emailController = TextEditingController();

  TextEditingController _passwordController = TextEditingController();

  final _globalKey = GlobalKey<FormState>();

  String email = "", password = "";

  signIn() async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Login successfully")));
      Navigator.push(context, MaterialPageRoute(builder: (_) => MovieScreen()));
    } on FirebaseAuthException catch (e) {
      if(e.code == "user not found"){
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("User not found please signup")));
      }
    }
  }

  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 100,),
              Image.asset("images/cinemalogo.jpg"),
              const SizedBox(
                height: 15,
              ),
              Form(
                key: _globalKey,
                child: Padding(
                  padding: const EdgeInsets.only(left: 30, right: 30),
                  child: Container(
                    
                    child: Column(
                      children: [
                        TextFormField(
                          validator: (value) {
                            if(value == null || value.isEmpty){
                              return "Enter your email";
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
                            if(value == null || value.isEmpty){
                              return "Enter your password";
                            }
                            return null;
                          },
                          controller: _passwordController,
                          decoration: InputDecoration(
                              suffixIcon: togglePasword(),
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
              ),
              FilledButton(
                onPressed: () {
                  if(_globalKey.currentState!.validate()){
                    setState(() {
                      email = _emailController.text;
                      password = _passwordController.text;
                    });
                  }
                  signIn();
                },
                child: const Text("Login"),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (_) =>  ForgetPass()));
                },
                child: const Text(
                  "forget password?",
                  style: TextStyle(color: Colors.grey),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have account?",
                    style: TextStyle(color: Colors.grey),
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (_) => SigninForm()));
                      },
                      child: const Text("SignUp"))
                ],
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    GoogleLogin().signInGoogle(context);
                  });
                },
                child: Container(
                  width: 50,
                  child: Image.asset("images/google.png"
                  
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  togglePasword(){
  return IconButton(onPressed: (){
      setState(() {
        _obscureText = !_obscureText;
      });
  }, icon: _obscureText ? Icon(Icons.visibility) : Icon(Icons.visibility_off));
}
}


