import 'package:flutter/material.dart';
import 'package:login_ui/jdc_login_ui/signin_ui.dart';

class JDCLoginUi extends StatelessWidget {
  const JDCLoginUi({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        margin: const EdgeInsets.only(top: 15),
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
              height: 40,
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.only(left: 3,right: 3),
                padding: const EdgeInsets.only(top: 40,left: 25,right: 25),
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius:const BorderRadius.only(topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                  )
                ),
                child: Column(
                  
                  children: [
                    const SizedBox(height: 10,),
                    TextField(
                      
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12)),
                        hintText: "Email of Username",
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        hintText: "password",
                      ),
                    ),
                    const SizedBox(height: 10,),
                    ElevatedButton.icon(onPressed: (){
                      
                    }, label: const Text("Login",style: TextStyle(color: Colors.grey),)),
                      
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                       const Text("you don't have account?"),
                        TextButton(onPressed: (){
                          Navigator.of(context).push(MaterialPageRoute(builder: (_)=> const SigninUi()));
                        }, child: const Text("SingUp"))
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
