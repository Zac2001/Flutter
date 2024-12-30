import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:movie_ui/auth/signin_form.dart';

class ForgetPass extends StatefulWidget {
   ForgetPass({super.key});

  @override
  State<ForgetPass> createState() => _ForgetPassState();
}

  TextEditingController _mailcontroller = TextEditingController();

  final _globalKey = GlobalKey<FormState>();

  String email = "";

  

class _ForgetPassState extends State<ForgetPass> {

  forgetPassword()async{
    try{
     await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
     ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Reset password send successfully")));
    }on FirebaseAuthException catch(e){
      if(e.code == "email not found"){
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("User not found")));
      }
    }
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
     backgroundColor: Colors.grey.shade200,
      body: Padding(
        padding: const EdgeInsets.only(top: 50,left: 16,right: 16),
        child: Form(
          key: _globalKey,
          child: Column(
            children: [
              TextFormField(
                validator: (value) {
                  if(value == null && value!.isEmpty){
                    return "Please enter email";
                  }
                  return null;
                },
                controller: _mailcontroller,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.person),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(23)
                  ),
                  labelText: "Enter your email"
                ),
              ),
              const SizedBox(height: 12,),
              Container(
                width: 350,
                child: ElevatedButton(onPressed: (){
                    if(_globalKey.currentState!.validate()){
                      setState(() {
                        email = _mailcontroller.text;
                      });
                    }
                    forgetPassword();
                }, child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Send",style: TextStyle(fontSize: 17),),
                    SizedBox(width: 8,),
                    Icon(Icons.send)
                  ],
                )),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don't have an account?",style: TextStyle(color: Colors.grey),),
                  TextButton(
                    onPressed: (){
                        Navigator.of(context).push(MaterialPageRoute(builder: (_)=>  SigninForm()));
              }, child: Text("Create",style: TextStyle(fontWeight: FontWeight.bold),)),
          
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}