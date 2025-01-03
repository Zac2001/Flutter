import 'package:json_annotation/json_annotation.dart';
part 'student_model.g.dart';
@JsonSerializable()
class Student{
  @JsonKey(includeToJson: false)
   int? id;
  final String name;
  final int age;
  final String address;

  Student(this.name, this.age, this.address, [this.id]);
  factory Student.fromJson(Map<String,dynamic> json)=> _$StudentFromJson(json);
  Map<String,dynamic> toJson()=> _$StudentToJson(this);
}