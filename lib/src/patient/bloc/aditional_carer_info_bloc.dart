import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:rxdart/rxdart.dart';

class AditionalCarerInfoBloc extends Bloc {
  AditionalCarerInfoBloc() {
    changebirthdate(DateTime.now().millisecondsSinceEpoch);
  }
  //Stream birthdate
  final _birthdateController = BehaviorSubject<int>();
  Stream<int> get birthdateStream => _birthdateController.stream;
  Function(int) get changebirthdate => _birthdateController.sink.add;
  int get birthdate => _birthdateController.valueOrNull;
  //Stream eps
  final _epsController = BehaviorSubject<String>();
  Stream<String> get epsStream => _epsController.stream;
  Function(String) get changeeps => _epsController.sink.add;
  String get eps => _epsController.valueOrNull;

  //Stream afiliationType
  final _afiliationTypeController = BehaviorSubject<String>();
  Stream<String> get afiliationTypeStream => _afiliationTypeController.stream;
  Function(String) get changeafiliationType =>
      _afiliationTypeController.sink.add;
  String get afiliationType => _afiliationTypeController.valueOrNull;
  //Stream relationship
  final _civilStateController = BehaviorSubject<String>();
  Stream<String> get civilStateStream => _civilStateController.stream;
  Function(String) get changecivilState => _civilStateController.sink.add;
  String get civilState => _civilStateController.valueOrNull;

  @override
  void dispose() {
    _birthdateController?.close();
    _epsController?.close();
    _afiliationTypeController?.close();
    _civilStateController?.close();
  }
}
