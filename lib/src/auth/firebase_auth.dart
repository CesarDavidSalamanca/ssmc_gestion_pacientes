import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

Future<String> registerUserWithFirebase(
    {@required String email,
    @required String phoneNumber,
    @required String password,
    @required String documentation,
    @required String typeDocument,
    @required String displayName}) async {
  try {
    UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: email, password: password);
    await userCredential.user.updateDisplayName(displayName);
    final DatabaseReference _usersRef =
        FirebaseDatabase.instance.reference().child('users');
    _usersRef.push().set({
      "name": displayName,
      "phone": phoneNumber,
      "type_document": typeDocument,
      "password": password,
      "email": email,
      "documentation": documentation,
    });
    return "Usuario creado";
  } on FirebaseAuthException catch (errorInRegister) {
    if (errorInRegister.code == "weak-password") {
      return "Introducir una contraseña más fuerte";
    } else if (errorInRegister.code == "email-already-in-use") {
      return "Correo existente";
    } else {
      return errorInRegister.code;
    }
  }
}

Future<String> signIn(
    {@required String email, @required String password}) async {
  try {
    String _login = "";
    UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email, password: password);
    if (userCredential.user.email != null && userCredential.user.uid != null) {
      //save info on phone
      _login = "Credenciales correctas";
    }
    return _login;
  } on FirebaseAuthException catch (errorInAuth) {
    if (errorInAuth.code == "user-not-found") {
      return "Usuario no registrado";
    } else if (errorInAuth.code == "wrong-password") {
      return "Contraseña incorrecta";
    } else {
      return errorInAuth.code;
    }
  }
}

Future<void> signOut() async {
  _auth.signOut();
  return null;
}
