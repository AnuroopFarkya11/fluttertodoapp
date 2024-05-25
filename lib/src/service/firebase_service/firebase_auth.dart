import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertodoapp/src/provider/app_providers.dart';
import 'package:fluttertodoapp/src/service/firebase_service/firestore.dart';
import 'package:fluttertodoapp/src/utils/app_utils.dart';



class Authentication {
  Authentication(){}

  FirebaseAuth _auth = FirebaseAuth.instance;
  Future<void> signIn({
    required String email,
    required String password,
  }) async {

    try {
      await _auth.signInWithEmailAndPassword(
          email: email.trim(), password: password.trim());
    } on FirebaseException catch (e) {
      throw Exception(e.message);
    }
  }

  Future<void> signUp({
    required String email,
    required String password,
    required String passwordConfirme,
    required String username,
    required String bio,
    required File profile,
  }) async {
    String URL;
    try {
      if (email.isNotEmpty &&
          password.isNotEmpty &&
          username.isNotEmpty) {
        if (password == passwordConfirme) {
          // create user with email and password
          await _auth.createUserWithEmailAndPassword(
            email: email.trim(),
            password: password.trim(),
          );
          // upload profile image on storage

          if (profile != File('')) {

          } else {
            URL = '';
          }

          // get information with firestor

          await FireStoreManager().createUser(
            email: email,
            username: username,
            bio: "",
            profile:""
          );
        } else {
          throw Exception('password and confirm password should be same');
        }
      } else {
        throw Exception('enter all the fields');
      }
    } on FirebaseException catch (e) {
      throw Exception(e.message.toString());
    }
  }


  Future<void> logout()
 async {
    try {
      await _auth.signOut();
    } on FirebaseException catch (e) {
      throw Exception(e.message.toString());
    }
  }

}
