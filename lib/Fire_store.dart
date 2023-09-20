import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase2/classmodel.dart';

class UserRepository {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<void> createData(
      String email, String password, String name, String contact) async {
    firestore.collection("Students").add({
      "email": email,
      "password": password,
      "name": name,
      "contact": contact
    });
  }

  Future<void> createData1(
    String email,
    String password,
  ) async {
    firestore.collection("Students1").add({
      "email": email,
      "password": password,
    });
  }

  Future<void> deleteData(DocumentId) async {
    await firestore.collection("Students").doc(DocumentId).delete();
  }

  Future<void> deleteData1(DocumentId) async {
    await firestore.collection("Students1").doc(DocumentId).delete();
  }

  //
  // Future<QuerySnapshot> getData() async {
  //  QuerySnapshot values= firestore
  //       .collection("Students").get();
  //
  //  return values;

//

  Future getData() async {
    try {
      QuerySnapshot querySnapshot =
          await firestore.collection('Students').get();

      return querySnapshot.docs;
    } catch (e) {
      print('Error: $e');
      return []; // Return an empty list in case of an error.
    }
  }

  // print(snapshot.)
  // return snapshot;

  Future<void> updateData(
      {required String documentId,
      required String newcontact,
      required String newemail,
      required String newname,
      required String newpassword}) async {
    print("object");
    try {
      print(documentId);
      print(newname);
      print(newemail);
      print(newpassword);
      print(newcontact);
      
      await firestore.collection("Students").doc(documentId).update({
        'name': newname,
        'email': newemail,
        'password': newpassword,
        'contact': newcontact
      });
      print('Document updated successfully');
    } catch (e) {
      print('Error updating document: $e');
    }
  }
}
