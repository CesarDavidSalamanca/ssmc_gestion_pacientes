import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:rxdart/rxdart.dart';
import 'package:ssmc_gestion_pacientes/src/auth/firebase_auth.dart';
import 'package:ssmc_gestion_pacientes/src/patient/bloc/address_carer_info_bloc.dart';
import 'package:ssmc_gestion_pacientes/src/patient/bloc/address_patient_info_bloc.dart';
import 'package:ssmc_gestion_pacientes/src/patient/bloc/aditional_carer_info_bloc.dart';
import 'package:ssmc_gestion_pacientes/src/patient/bloc/aditional_patient_info_bloc.dart';
import 'package:ssmc_gestion_pacientes/src/patient/bloc/carer_info_bloc.dart';
import 'package:ssmc_gestion_pacientes/src/patient/model/patient.dart';
import 'package:ssmc_gestion_pacientes/src/patient/repository/patient_repository.dart';
import 'package:ssmc_gestion_pacientes/src/patient/ui/widgets/patient_info_detail_cards.dart';

class SearchPatientBloc implements Bloc {
  SearchPatientBloc(this.dataModel) {
    changeIsCharging(false);
    changeTypeDocument("Cédula de ciudadania");
    aditionalPatientInfoBloc = AditionalPatientInfoBloc();
    addressPatientInfoBloc = AddressPatientInfoBloc();
    carerInfoBloc = CarerInfoBloc();
    aditionalCarerInfoBloc = AditionalCarerInfoBloc();
    addressCarerInfoBloc = AddressCarerInfoBloc();
  }
  DataModel dataModel;

  AditionalPatientInfoBloc aditionalPatientInfoBloc;
  AddressPatientInfoBloc addressPatientInfoBloc;
  CarerInfoBloc carerInfoBloc;
  AditionalCarerInfoBloc aditionalCarerInfoBloc;
  AddressCarerInfoBloc addressCarerInfoBloc;
  //IsCharging
  final _isChargingController = BehaviorSubject<bool>();
  Stream<bool> get isChargingStream => _isChargingController.stream;
  Function(bool) get changeIsCharging => _isChargingController.sink.add;
  bool get isCharging => _isChargingController.valueOrNull;

  //Stream typeDoc
  final _typeDocumentController = BehaviorSubject<String>();
  Stream<String> get typeDocumentStream => _typeDocumentController.stream;
  Function(String) get changeTypeDocument => _typeDocumentController.sink.add;
  String get typeDocument => _typeDocumentController.valueOrNull;

  //Stream
  final _documentController = BehaviorSubject<String>();
  final _nameController = BehaviorSubject<String>();
  final _ilnessController = BehaviorSubject<String>();
  final _zoneController = BehaviorSubject<String>();

  //Recuperar datos de los Streams
  Stream<String> get documentStream => _documentController.stream;
  Stream<String> get nameStream => _nameController.stream;
  Stream<String> get ilnessStream => _ilnessController.stream;
  Stream<String> get zoneStream => _zoneController.stream;

  //Insertar valores a los Streams
  Function(String) get changeDocument => _documentController.sink.add;
  Function(String) get changeName => _nameController.sink.add;
  Function(String) get changeIlness => _ilnessController.sink.add;
  Function(String) get changeZone => _zoneController.sink.add;

  //Obtener Ultimo valor de los Streams
  String get document => _documentController.valueOrNull;
  String get name => _nameController.valueOrNull;
  String get ilness => _ilnessController.valueOrNull;
  String get zone => _zoneController.valueOrNull;

  @override
  void dispose() {
    _isChargingController?.close();
    _typeDocumentController?.close();
    _documentController?.close();
    _nameController?.close();
    _ilnessController?.close();
    _zoneController?.close();
  }

  void search() {
    print("searching");
  }

  // Future<void> insertPatient() async {
  //   final patient = Patient(
  //       typeDoc: typeDocument,
  //       doc: document,
  //       name: name,
  //       illness: ilness,
  //       zone: zone,
  //       birthdate: aditionalPatientInfoBloc.birthdate,
  //       eps: aditionalPatientInfoBloc.eps,
  //       typeAfiliation: aditionalPatientInfoBloc.afiliationType,
  //       civilState: aditionalPatientInfoBloc.civilState,
  //       address: addressPatientInfoBloc.address,
  //       carerOnMap: dataModel.currentPatient.carerOnMap,
  //       carerRoadOnMap: dataModel.currentPatient.carerRoadOnMap,
  //       timeFromRoadToCarer: addressPatientInfoBloc.time);
  //   final response = await registerPatientWithFirebase(patient: patient);
  //   print(response);
  //   return;
  // }

  // Future<Patient> searchPatient() async {
  //   final response =
  //       await getPatientWithFirebase(typeDoc: typeDocument, doc: document);
  //   return response;
  // }
}
