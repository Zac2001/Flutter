import 'package:contact_app/database/contact.dart';
import 'package:contact_app/database/contact_dao.dart';
import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;
import 'dart:async';
part 'contact_db.g.dart';
@Database(version: 1, entities: [Contact])
abstract class ContactDb extends FloorDatabase {

  ContactDao get contactDao;

}