import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class SigninUi extends StatelessWidget {
  const SigninUi({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        margin: const EdgeInsets.only(top: 10),
        child: Column(
          
          children: [
            Center(
              child: Container(
                padding: const EdgeInsets.only(top: 16),
                child: Image.asset(
                  "images/jdclogo.png",
                ),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Container(
              
              margin: const EdgeInsets.all(15),
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(12)
              ),
              child: Column(
                
                children: [
                  
                  TextField(
                    
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12)),
                      hintText: "Enter your Email",
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  TextField(
                    decoration: InputDecoration(

                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      hintText: "Enter your Password",
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      hintText: "Confirm your Password",
                    ),
                  ),
                  const SizedBox(height: 10,),
                  ElevatedButton.icon(onPressed: (){
        
                  }, label: const Text("SignUp",style: TextStyle(color: Colors.grey),)),
        
                 Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextButton.icon(onPressed: (){

                    }, label: const Icon(Icons.facebook)),
                    TextButton.icon(onPressed: (){

                    },label:const  Icon(Icons.email),),
                    TextButton.icon(onPressed: (){

                    },label: const Icon(Icons.telegram),),
                    
                  ],
                 )
                ],
              ),
              
            )
          ],
        ),
      ),
    );
  }
}