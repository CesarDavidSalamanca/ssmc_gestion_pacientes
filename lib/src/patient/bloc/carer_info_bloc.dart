import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:rxdart/rxdart.dart';

class CarerInfoBloc extends Bloc {
  //Stream typeDoc
  final _typeDocumentController = BehaviorSubject<String>();
  Stream<String> get typeDocumentStream => _typeDocumentController.stream;
  Function(String) get changeTypeDocument => _typeDocumentController.sink.add;
  String get typeDocument => _typeDocumentController.valueOrNull;

  //Stream
  final _documentController = BehaviorSubject<String>();
  final _nameController = BehaviorSubject<String>();
  final _relationshipController = BehaviorSubject<String>();
  final _zoneController = BehaviorSubject<String>();

  //Recuperar datos de los Streams
  Stream<String> get documentStream => _documentController.stream;
  Stream<String> get nameStream => _nameController.stream;
  Stream<String> get relationshipStream => _relationshipController.stream;
  Stream<String> get zoneStream => _zoneController.stream;

  //Insertar valores a los Streams
  Function(String) get changeDocument => _documentController.sink.add;
  Function(String) get changeName => _nameController.sink.add;
  Function(String) get changerelationship => _relationshipController.sink.add;
  Function(String) get changeZone => _zoneController.sink.add;

  //Obtener Ultimo valor de los Streams
  String get document => _documentController.valueOrNull;
  String get name => _nameController.valueOrNull;
  String get relationship => _relationshipController.valueOrNull;
  String get zone => _zoneController.valueOrNull;

  @override
  void dispose() {
    _typeDocumentController?.close();
    _documentController?.close();
    _nameController?.close();
    _relationshipController?.close();
    _zoneController?.close();
  }
}
