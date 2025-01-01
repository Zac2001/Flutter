import 'package:flutter/material.dart';

class AccountUi extends StatefulWidget {
  const AccountUi({super.key});

  @override
  State<AccountUi> createState() => _AccountUiState();
}

class _AccountUiState extends State<AccountUi> {

   final Color _backgroundColor = const Color(0xff4a4e69);
   final double _height = 10;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _backgroundColor,
      body: Column(
        children: [
          const Padding(
           padding: EdgeInsets.only(top: 80,left: 20),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 80,
                  child: Icon(Icons.person,size: 120,),
                ),
                SizedBox(height: 10,),
                 Text("Mg Mg",style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30
                  ),)
              ],
            ),
          ),
          
          Padding(
            padding: const EdgeInsets.only(top: 12),
            child:  Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     const Padding(
                       padding: EdgeInsets.only(left: 18,bottom: 11),
                       child: Text("ACCOUNT",style: TextStyle(fontWeight: FontWeight.bold,
                       fontSize: 25
                       ),),
                     ),
                     const ListTile(
                       leading: Icon(Icons.phone_in_talk,size: 30,color: Colors.black,),
                       title: Text("CONTACT LIST",style: TextStyle(
                         fontSize: 25
                       ),),
                     ),
                      SizedBox(height: _height,),
                      const ListTile(
                       leading: Icon(Icons.settings,size: 30,color: Colors.black,),
                       title: Text("SETTINGS",style: TextStyle(
                         fontSize: 25
                       ),),
                     ),
                     SizedBox(height: _height,),
                      const ListTile(
                       leading: Icon(Icons.mark_email_unread_sharp,size: 30,color: Colors.black,),
                       title: Text("INVIATION",style: TextStyle(
                         fontSize: 25
                       ),),
                     ),
                     SizedBox(height: _height,),
                      const ListTile(
                       leading: Icon(Icons.payment,size: 30,color: Colors.black,),
                       title: Text("PAY HISTORY",style: TextStyle(
                         fontSize: 25
                       ),),
                     ),
                     const Divider(),
                     const Padding(
                       padding: EdgeInsets.only(left: 18,bottom: 11),
                       child: Text("PRAVICY & SECURITY",style: TextStyle(
                         fontWeight: FontWeight.bold,
                         fontSize: 25
                       ),),
                     ),
                      const ListTile(
                       leading: Icon(Icons.lock,size: 30,color: Colors.black,),
                       title: Text("PRAVICY",style: TextStyle(
                         fontSize: 25
                       ),),
                     ),
                     SizedBox(height: _height,),
                      const ListTile(
                       leading: Icon(Icons.notifications,size: 30,color: Colors.black,),
                       title: Text("NOTIFICATION",style: TextStyle(
                         fontSize: 25
                       ),),
                     ),
                     SizedBox(height: _height,),
                      const ListTile(
                       leading: Icon(Icons.logout,size: 30,color: Colors.black,),
                       title: Text("LOG OUT",style: TextStyle(
                         fontSize: 25
                       ),),
                     ),
                    
            
            
                   ],
                 ),
          ),
          
           
        ],
      ),
    );
  }
}