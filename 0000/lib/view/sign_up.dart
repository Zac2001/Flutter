import 'package:flutter/material.dart';
import 'package:login_ui/view/sign_in.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            left: 157,
            top: -130,
            child: CircleAvatar(
              radius: 90,
              backgroundColor: Colors.indigo.shade100,
            ),
          ),
          const Positioned(
            left: 130,
            top: -130,
            child: CircleAvatar(
              radius: 90,
              backgroundColor: Colors.indigo,
            ),
          ),
         Column(
          children: [
            Container(
              
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(1)),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 10,
                    color: Colors.black26,
                    offset: Offset(1, 1),blurStyle: BlurStyle.outer
                  )
                ]
              ),
              margin: EdgeInsets.only(top: 90,right: 50,bottom: 20),
              
              width: MediaQuery.sizeOf(context).width,
              height: 500,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 20,top: 30),
                    child: const Text("SIGN UP",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),
                  ),
                  const SizedBox(height: 20,),
                  Container(
                    margin:const  EdgeInsets.only(left: 17,right: 17),
                    child: const TextField(
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.person),
                        hintText: "UserName",
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20,),
                   Container(
                    margin:const  EdgeInsets.only(left: 17,right: 17),
                    child: const TextField(
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.mail),
                        hintText: "Email",
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20,),
                   Container(
                    margin:const  EdgeInsets.only(left: 17,right: 17),
                    child: const TextField(
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.phone),
                        hintText: "Mobile Number",
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20,),
                   Container(
                    margin:const  EdgeInsets.only(left: 17,right: 17),
                    child: const TextField(
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.lock),
                        hintText: "Password",
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30,),
                  Container(
                    margin:const  EdgeInsets.only(left: 17,right: 17),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.indigo,
                        shape: RoundedRectangleBorder()
                      ),
                      onPressed: (){
                    
                    }, child: const Text("SIGN UP")),
                  ),
                   Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                       const Text("already have account?",
                       style: TextStyle(color: Colors.grey),
                       ),
                       TextButton(onPressed: (){
                          Navigator.of(context).push(MaterialPageRoute(builder: (_)=> const SignInForm()));
                       }, child: const Text("SIGN IN"))
                    ],
                  )
                ],
              ),
            )
          ],
         )
        ],
        
      ),
    );
  }
}
