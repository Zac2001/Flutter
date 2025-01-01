import 'package:contact_app/database/contact.dart';
import 'package:contact_app/database/contact_dao.dart';
import 'package:contact_app/view/add_contact.dart';
import 'package:contact_app/view/update_contact.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
   Home({super.key});

  ContactDao contactDao = Get.find();
  List<Contact> contact = [];

  @override
  Widget build(BuildContext context) {

    
    
    return Scaffold(
      appBar: AppBar(
        title: const Center(child:  Text("Contact")),
      ),
      body: contactBody(),
      floatingActionButton: FloatingActionButton(onPressed: (){
        
         Get.to(AddContact());
      },child: const Icon(Icons.add),),
      
    );
  }


Widget contactBody(){
  return StreamBuilder<List<Contact>>
  (stream: contactDao.getAllContact(),
   builder: (context,snapshot){
    if(snapshot.hasData){
        contact = snapshot.data!;
        return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              return Card(
                shadowColor: Colors.black,
                child: ListTile(
                  title: Text(snapshot.data![index].name),
                  subtitle: Text(snapshot.data![index].phoneNumber),
                  leading: CircleAvatar(
                    foregroundColor: Colors.black,
                    backgroundColor: Colors.cyan,
                    child: Icon(Icons.person),
                  ),
                  trailing: TextButton(onPressed: (){
                        Get.to(()=>UpdateContact(),arguments: snapshot.data![index]);
                  }, child: const Icon(Icons.arrow_forward_ios)),
                ),
              );
            },
        );
    }else if(snapshot.hasError){
      return Text(snapshot.error.toString());
    }else{
      return const Text("No Data");
    }
   });
}
}