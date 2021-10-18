import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:rxdart/rxdart.dart';

class SearchPatientBloc implements Bloc {
  SearchPatientBloc() {
    changeIsCharging(false);
    changeTypeDocument("Cédula de ciudadania");
  }
  //IsCharging
  final _isChargingController = BehaviorSubject<bool>();
  Stream<bool> get isChargingStream => _isChargingController.stream;
  Function(bool) get changeIsCharging => _isChargingController.sink.add;
  bool get isCharging => _isChargingController.valueOrNull;

  //Stream
  final _typeDocumentController = BehaviorSubject<String>();
  final _documentController = BehaviorSubject<String>();
  final _nameController = BehaviorSubject<String>();
  final _ilnessController = BehaviorSubject<String>();
  final _zoneController = BehaviorSubject<String>();

  //Recuperar datos de los Streams
  Stream<String> get typeDocumentStream => _typeDocumentController.stream;
  Stream<String> get documentStream => _documentController.stream;
  Stream<String> get nameStream => _nameController.stream;
  Stream<String> get ilnessStream => _ilnessController.stream;
  Stream<String> get zoneStream => _zoneController.stream;

  //Insertar valores a los Streams
  Function(String) get changeTypeDocument => _typeDocumentController.sink.add;
  Function(String) get changeDocument => _documentController.sink.add;
  Function(String) get changeName => _nameController.sink.add;
  Function(String) get changeIlness => _ilnessController.sink.add;
  Function(String) get changeZone => _zoneController.sink.add;

  //Obtener Ultimo valor de los Streams
  String get typeDocument => _typeDocumentController.valueOrNull;
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
}
