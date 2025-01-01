import 'package:flutter/material.dart';

class ForgetpwScreen extends StatefulWidget {
  const ForgetpwScreen({super.key});

  @override
  State<ForgetpwScreen> createState() => _ForgetpwScreenState();
}

class _ForgetpwScreenState extends State<ForgetpwScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12,
      body: Padding(
        padding: const EdgeInsets.only(top: 100),
        child: Column(
          
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                ),
                child: TextField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.email,size: 30,),
                    hintText: "Email",
                    hintStyle: TextStyle(color: Colors.black, fontSize: 25),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)
                    )
                  ),
                ),
              ),
            ),
            const SizedBox(height: 15,),
            Container(
              width: MediaQuery.of(context).size.width/3,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                    GestureDetector(
                      onTap: () {
                        
                      },
                      child: const Text("Send",style: TextStyle(fontSize: 30),),
                    ),
                    const SizedBox(width: 5,),
                  Icon(Icons.send,size: 35,)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}