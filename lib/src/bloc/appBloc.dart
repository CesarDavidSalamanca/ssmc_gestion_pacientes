import 'dart:async';
import 'package:rxdart/rxdart.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';

class AppBloc implements Bloc {
  //Patron Singelton
  static final AppBloc _userBloc = AppBloc._internal();
  factory AppBloc() {
    return _userBloc;
  }
  AppBloc._internal() {
    // _businessController.add(null);
  }
  //End Patron Singelton
  //Streams
  // final _businessController = BehaviorSubject<Business>();

  // //Recuperar datos de los Streams
  // Stream<Business> get businessStream => _businessController.stream;

  // //Insertar valores a los Streams
  // // Function(Business) get changeBusiness => _businessController.sink.add;

  // //Obtener Ultimo valor de los Streams
  // Business get business => _businessController.value;

  @override
  void dispose() {
    // _businessController?.close();
  }

  // Future<bool> getBusiness(Function onUnauthorized, Function onFailure) async {
  //   try {
  //     // TODO implementar
  //     // final auth = await loginRepository.login(email, password);
  //     // if (auth != null) {
  //     //   appBloc.userAuth = auth;
  //     if (business == null)
  //       _businessController.add(Business());
  //     else
  //       _businessController.add(null);

  //     return true;
  //     // } else {
  //     //   return false;
  //     // }
  //   } on Exception catch (e) {
  //     if ('$e'.contains("Unauthorized")) {
  //       onUnauthorized();
  //     } else {
  //       onFailure();
  //     }
  //     return false;
  //   }
  // }
}
