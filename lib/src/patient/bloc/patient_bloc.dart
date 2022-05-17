import 'package:flutter/animation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';
import 'package:ssmc_gestion_pacientes/src/patient/bloc/patient_state.dart';
import 'package:ssmc_gestion_pacientes/src/patient/model/patient_user.dart';
import 'package:ssmc_gestion_pacientes/src/patient/repository/patient_repository.dart';

class PatientBloc extends Cubit<PatientState> {
  PatientBloc() : super(PatientState());

  final patientRepository = PatientRepository();

  void registerPatient(PatientUser patient) async {
    try {
      final bool result = await patientRepository.create(patient);
      if (result) {
        emit(PatientState(success: 1));
      } else {
        emit(
          PatientState(
            error: "Ha ocurrido un error al registrar el paciente",
          ),
        );
      }
    } catch (e) {
      print(e);
      emit(
        PatientState(
          error: "Ha ocurrido un error inesperado",
        ),
      );
    }
  }

  void updatePatient(PatientUser patient) async {
    try {
      final bool result = await patientRepository.update(patient);
      if (result) {
        emit(PatientState(success: 2));
      } else {
        emit(
          PatientState(
            error: "Ha ocurrido un error al actualizar el paciente",
          ),
        );
      }
    } catch (e) {
      print(e);
      emit(
        PatientState(
          error: "Ha ocurrido un error inesperado",
        ),
      );
    }
  }

  void deletePatient(String document) async {
    try {
      final bool result = await patientRepository.delete(document);
      if (result) {
        emit(PatientState(success: 3));
      } else {
        emit(
          PatientState(
            error: "Ha ocurrido un error al eliminar el paciente",
          ),
        );
      }
    } catch (e) {
      print(e);
      emit(
        PatientState(
          error: "Ha ocurrido un error inesperado",
        ),
      );
    }
  }
}
