import 'package:contact_app/database/contact.dart';
import 'package:contact_app/database/contact_dao.dart';
import 'package:contact_app/view/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class UpdateContact extends StatelessWidget {
   UpdateContact({super.key});
  
  ContactDao contactDao = Get.find();
  Contact contact = Get.arguments;
  TextEditingController  name = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController email = TextEditingController();
  
  

  @override
  Widget build(BuildContext context) {
    name.text = contact.name;
    phoneNumber.text =contact.phoneNumber;
    email.text = contact.email;

    return Scaffold(
      appBar: AppBar(
        title:const Center(child:  Text("Update Contact")),
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
                  controller: email,
                    autofocus: true,
                    decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Email",
                  ),
                  
                ),
              ),
              SizedBox(height: 17,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    
                    onPressed: (){
                      contactDao.updateContact(Contact(name: name.text, phoneNumber: phoneNumber.text, email: email.text,id: contact.id));
                        Get.back();
                  }, child: const Text("Save")),
                  SizedBox(width: 10,),
                  ElevatedButton(onPressed: (){
                        contactDao.deleteContact(Contact(name: name.text, phoneNumber: phoneNumber.text, email: email.text,id: contact.id));
                        Get.back();
                  }, child: const Text("Delete"))
                ],
              )

            ],
          )
          
        ],
      ),
    );
  }
}