import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:ssmc_gestion_pacientes/src/patient/model/patient.dart';

Future<String> registerPatientWithFirebase({
  @required Patient patient,
}) async {
  try {
    // final FirebaseApp app = FirebaseApp(name: '[DEFAULT]');
    final String databaseUrl =
        "https://ssmc-gestion-pacientes-bf8eb-default-rtdb.firebaseio.com";
    final DatabaseReference _usersRef =
        FirebaseDatabase(databaseURL: databaseUrl).reference().child('patient');

    _usersRef.push().set({
      "docType": patient.typeDoc,
      "doc": patient.doc,
      "name": patient.name,
      "illness": patient.illness,
      "zone": patient.zone,
      "birthdate": patient.birthdate,
      "eps": patient.eps,
      "afiliationType": patient.typeAfiliation,
      "civilState": patient.civilState,
      "address": patient.address,
    });
    return "paciente creado";
  } on Exception catch (errorInRegister) {
    return errorInRegister.toString();
  }
}

Future<String> updatePatientWithFirebase({
  @required Patient patient,
}) async {
  try {
    final DatabaseReference _usersRef = FirebaseDatabase.instance
        .reference()
        .child('patient')
        .child(patient.patientId);
    _usersRef.set({
      "docType": patient.typeDoc,
      "doc": patient.doc,
      "name": patient.name,
      "illness": patient.illness,
      "zone": patient.zone,
      "birthdate": patient.birthdate,
      "eps": patient.eps,
      "afiliationType": patient.typeAfiliation,
      "civilState": patient.civilState,
      "address": patient.address,
    });
    return "negocio actualizado";
  } on Exception catch (errorInRegister) {
    return errorInRegister.toString();
  }
}

Future<Patient> getPatientWithFirebase({
  @required String typeDoc,
  @required String doc,
}) async {
  Patient patient = Patient();
  try {
    final DatabaseReference _usersRef =
        FirebaseDatabase.instance.reference().child('patient');
    final patients = await _usersRef.get();
    patients.value.forEach((userCode, userData) {
      if (userData["docType"] == typeDoc && userData["doc"] == doc) {
        patient = Patient.fromJson(userData);
        patient.patientId = userCode;
      }
    });

    return patient;
  } on Exception catch (errorInRegister) {
    return patient;
  }
}
