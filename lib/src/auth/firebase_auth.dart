import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:ssmc_gestion_pacientes/src/patient/model/patient.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

Future<String> registerPatientWithFirebase({@required Patient patient}) async {
  try {
    // String isvalid = await validPatient(email, typeDocument, documentation);
    String isvalid = "Ok";
    if (isvalid == "Ok") {
      final DatabaseReference _usersRef =
          FirebaseDatabase.instance.reference().child('patient');
      _usersRef.push().set({
        "type_document": patient.typeDoc,
        "documentation": patient.doc,
        "name": patient.name,
        "illness": patient.illness,
        "zone": patient.zone,
        "birthdate": patient.birthdate,
        "eps": patient.eps,
        "type_afiliation": patient.typeAfiliation,
        "civil_state": patient.civilState,
        "address": patient.address,
        "adress_lat": patient.addressLat(),
        "adress_lng": patient.addressLng(),
        if (patient.zone == "rural") "road_lat": patient.roadLat(),
        if (patient.zone == "rural") "road_lng": patient.roadLng(),
        if (patient.zone == "rural") "time": patient.timeFromRoadToCarer,
      });
      return "Paciente creado";
    }
    return "Paciente existente";
  } on Exception catch (errorInRegister) {
    return errorInRegister.toString();
  }
}
// Future<String> validPatient( String docType, String doc) async {
//   final DatabaseReference _usersRef =
//       FirebaseDatabase.instance.reference().child('patient');
//   final users = await _usersRef.get();
//   String response = "Ok";
//   users.value.forEach((userCode, userData) {
//     if (_auth.currentUser == null ||
//         userData["email"] != _auth.currentUser.email) {
//       if (userData["email"] == email) {
//         //setear user data in sharedPreferences
//         // print("user coincide");
//         response = "Correo existente";
//       }
//       if (userData["type_document"] == docType &&
//           userData["documentation"] == doc) {
//         response = "Documento existente";
//       }
//     }
//   });
//   return response;
// }

Future<String> signIn(
    {@required String email, @required String password}) async {
  try {
    String _login = "";
    UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email, password: password);
    if (userCredential.user.email != null && userCredential.user.uid != null) {
      //save info on phone
      if (email.contains("observatoriosmcajamarca"))
        userCredential.user
            .updateDisplayName("Observatorio Municipal de Cajamarca");
      else {
        userCredential.user.updateDisplayName("Hospital Santa Lucia");
      }
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

String getUserEmail() {
  return _auth.currentUser == null ? "null email" : _auth.currentUser.email;
}

String getUserName() {
  return _auth.currentUser == null
      ? "null displayName"
      : _auth.currentUser.displayName;
}

Future<void> signOut() async {
  _auth.signOut();
  return null;
}
