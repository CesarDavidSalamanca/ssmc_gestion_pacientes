import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:rxdart/rxdart.dart';

class AddressPatientInfoBloc extends Bloc {
  //Stream afiliationType
  final _addressController = BehaviorSubject<String>();
  Stream<String> get addressStream => _addressController.stream;
  Function(String) get changeaddress => _addressController.sink.add;
  String get address => _addressController.valueOrNull;
  //Stream civilState
  final _timeController = BehaviorSubject<String>();
  Stream<String> get timeStream => _timeController.stream;
  Function(String) get changetime => _timeController.sink.add;
  String get time => _timeController.valueOrNull;

  @override
  void dispose() {
    _addressController?.close();
    _timeController?.close();
  }
}
