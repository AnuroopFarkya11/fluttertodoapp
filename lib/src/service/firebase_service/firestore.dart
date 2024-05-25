import 'dart:ffi';


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertodoapp/src/models/todo_model.dart';
import 'package:fluttertodoapp/src/models/user_model.dart';
import 'package:uuid/uuid.dart';


class FireStoreManager {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<bool> createUser({
    required String email,
    required String username,
    required String bio,
    required String profile,
  }) async {
    await _firebaseFirestore
        .collection('users')
        .doc(_auth.currentUser!.uid)
        .set({
      'email': email,
      'username': username,
    });
    return true;
  }

  Future<UserModel> getUser({String? UID}) async {
    try {
      final user = await _firebaseFirestore
          .collection('users')
          .doc(UID != null ? UID : _auth.currentUser!.uid)
          .get();


      final snapUser = user.data()!;
      return UserModel.fromJson(snapUser);
    } on FirebaseException catch (e) {
      throw Exception(e.message.toString());
    }
  }

  Future<bool> createTodo({
 required Todo todo
  }) async {
    var uid = Uuid().v4();
    DateTime data = new DateTime.now();
    UserModel user = await getUser();
    await _firebaseFirestore.collection('todo').doc(uid).set(todo.toJson());
    return true;
  }


  Future<String> like({
    required List like,
    required String type,
    required String uid,
    required String postId,
  }) async {
    String res = 'some error';
    try {
      if (like.contains(uid)) {
        _firebaseFirestore.collection(type).doc(postId).update({
          'like': FieldValue.arrayRemove([uid])
        });
      } else {
        _firebaseFirestore.collection(type).doc(postId).update({
          'like': FieldValue.arrayUnion([uid])
        });
      }
      res = 'seccess';
    } on Exception catch (e) {
      res = e.toString();
    }
    return res;
  }


}
