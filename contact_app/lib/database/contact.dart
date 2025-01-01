import 'package:floor/floor.dart';

@Entity(tableName: "contact_tbl")
class Contact {
  @PrimaryKey(autoGenerate: true)
  final int? id;
  final String name;
  final String phoneNumber;
  
  final String email;

  Contact({required this.name,required this.phoneNumber,required this.email,this.id});
}