import 'package:contact_app/database/contact_db.dart';
import 'package:contact_app/view/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home:FutureBuilder<ContactDb>
      (future: $FloorContactDb.databaseBuilder("contact.db").build(),
       builder: (context, snapshot) {
         if(snapshot.hasData){
          Get.put(snapshot.data!.contactDao);
          return Home();
         }else if(snapshot.hasError){
          return Text(snapshot.error.toString());
         }else{
          return const Text("No Data");
         }
       },),

      
    );
  }
}