import 'package:flutter/material.dart';
import 'package:login_ui/view/sign_up.dart';

class SignInForm extends StatelessWidget {
  const SignInForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        fit: StackFit.loose,
        children: [
          Positioned(
              right: -20,
              top: -70,
              child: CircleAvatar(
                backgroundColor: Colors.indigo.shade100,
                radius: 75,
              )),
          const Positioned(
              right: -35,
              top: -90,
              child: CircleAvatar(
                backgroundColor: Colors.indigo,
                radius: 75,
              )),
          Positioned(
              left: 0,
              bottom: -85,
              child: CircleAvatar(
                backgroundColor: Colors.indigo.shade100,
                radius: 75,
              )),
          const Positioned(
              left: -8,
              bottom: -100,
              child: CircleAvatar(
                backgroundColor: Colors.indigo,
                radius: 75,
              )),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(3)),
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 10,
                        color: Colors.black26,
                        offset: Offset(1, 1),
                        blurStyle: BlurStyle.outer)
                  ],
                ),
                height: 450,
                width: MediaQuery.sizeOf(context).width,
                margin: const EdgeInsets.only(
                  right: 40,
                ),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(left: 20, top: 15),
                        child: const Text(
                          "SIGN IN",
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.all(20),
                        child: const DecoratedBox(
                          decoration: BoxDecoration(boxShadow: [
                            BoxShadow(
                                blurRadius: 10,
                                color: Colors.black26,
                                offset: Offset(1, 0),
                                spreadRadius: -0.9,
                                blurStyle: BlurStyle.outer)
                          ]),
                          child:  TextField(
                            autofocus: false,
                            decoration: InputDecoration(
                              prefixIcon: Icon(Icons.person),
                              // label: Text("Leo Murphy"),
                              hintText: "Name",
                              isDense: false,
                              
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                  style: BorderStyle.solid
                                )
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.all(20),
                        child: const DecoratedBox(
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 10,
                                color: Colors.black26,
                                
                                offset: Offset(1, 1),
                                blurStyle: BlurStyle.outer,
                                spreadRadius: -0.9
      
                              )
                            ]
                          ),
                          child:  TextField(
                            decoration: InputDecoration(
                              prefixIcon: Icon(Icons.lock),
                              // label: Text("Leo Murphy"),
                              hintText: "Password",
                              isDense: false,
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                      ),
                      Container(
                         margin: const EdgeInsets.all(20),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.indigo,
                            foregroundColor: Colors.white,
                            shape: const RoundedRectangleBorder(),
                          ),
                          onPressed: (){
                        
                        }, child: const Text("Sign in")),
                      ),
                       const Text("Forget Password?",
                       textAlign: TextAlign.center,
                       style: TextStyle(color: Colors.grey),
                       ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("don't have account?"),
                          TextButton(onPressed: (){
                              Navigator.of(context).push(MaterialPageRoute(builder: (_)=> SignUpForm()));
                          },
                           child: const Text("SIGN UP"))
                        ],
                       )
                    ]),
              )
            ],
          )
        ],
      ),
      
    );
  }
}
