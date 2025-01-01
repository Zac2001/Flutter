import 'package:contact_app/database/contact.dart';
import 'package:floor/floor.dart';

@dao
abstract class ContactDao {

  @Query("select * from contact_tbl")
  Stream<List<Contact>> getAllContact();

  @Update()
  Future<void> updateContact(Contact contact);

  @delete
  Future<void> deleteContact(Contact contact);

  @insert
  Future<void> addContact(Contact contact);
}