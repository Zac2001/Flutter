import 'package:floor/floor.dart';

@Entity(tableName: "note")
class Note{
  @PrimaryKey(autoGenerate: true)
  final int? id;

  final String title;
  final String description;

  Note(this.title, this.description,{this.id});

}