import 'package:contact_app/database/contact.dart';
import 'package:contact_app/database/contact_dao.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class AddContact extends StatelessWidget {
   AddContact({super.key});

  ContactDao contactDao = Get.find();
  TextEditingController name = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController email = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Center(child:  Text("Add contact")),
      ),
      body: Stack(
        
        children: [
          
          Container(
            margin: const EdgeInsets.only(top: 45),
            decoration:const BoxDecoration(
              
            color: Color(0xffced4da),
            borderRadius: BorderRadius.only(topLeft: Radius.circular(12),topRight: Radius.circular(12))
            ),
            
          ),
          const Positioned(
            left: 138,
            child: CircleAvatar (
                child: Icon(Icons.person,size: 100,),
              radius: 50,
              
            ),
          ),
          Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 150,left: 15,right: 15),
                child:  TextField(
                    controller: name,
                    autofocus: true,
                    decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Name",
                  ),
                ),
              ),
              SizedBox(height: 17,),
              Container(
                margin: EdgeInsets.only(left: 15,right: 15),
                child:  TextField(
                  controller: phoneNumber,
                    autofocus: true,
                    decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Mobile",
                  ),
                ),
              ),
              SizedBox(height: 17,),
              Container(
                margin: EdgeInsets.only(left: 15,right: 15),
                child:  TextField(
                    controller: email ,
                    autofocus: true,
                    decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Email",
                  ),
                  
                ),
              ),
              SizedBox(height: 17,),
              ElevatedButton(
                
                onPressed: (){
                   contactDao.addContact(Contact(name: name.text, phoneNumber: phoneNumber.text,email: email.text));
                    Get.back();
              }, child: const Text("Add"))

            ],
          )
          
        ],
      ),
    );
  }
}