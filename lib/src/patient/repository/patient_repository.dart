import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ssmc_gestion_pacientes/src/patient/model/patient_user.dart';

class PatientRepository {
  final collection = 'patient';
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<bool> create(PatientUser patient) async {
    try {
      await firestore.collection(collection).doc(patient.document).set(
            patient.toMap(),
          );
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> update(PatientUser patient) async {
    try {
      await firestore.collection(collection).doc(patient.document).update(
            patient.toMap(),
          );
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> delete(String document) async {
    try {
      await firestore.collection(collection).doc(document).delete();
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }
}
