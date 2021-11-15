import 'dart:async';
import 'package:ssmc_gestion_pacientes/src/auth/firebase_auth.dart';
// import 'package:firebase_database/firebase_database.dart';
import 'package:rxdart/rxdart.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';

import 'package:ssmc_gestion_pacientes/src/provider/validators.dart';

class LoginBloc with Validators implements Bloc {
  //Streams
  final _emailController = BehaviorSubject<String>();
  final _passwordController = BehaviorSubject<String>();

  //Recuperar datos de los Streams
  Stream<String> get emailStream =>
      _emailController.stream.transform(validarEmail);
  Stream<String> get passwordStream =>
      _passwordController.stream.transform(validarPassword);

  //Insertar valores a los Streams
  Function(String) get changeEmail => _emailController.sink.add;
  Function(String) get changePassword => _passwordController.sink.add;

  //Obtener Ultimo valor de los Streams
  String get email => _emailController.valueOrNull;
  String get password => _passwordController.valueOrNull;

  @override
  void dispose() {
    _emailController?.close();
    _passwordController?.close();
  }

  Future<bool> loginAccess(Function(String message) onFailure) async {
    if (this._emailController.hasValue && this._passwordController.hasValue) {
      try {
        bool _login = false;
        String response = await signIn(
            email: this._emailController.value,
            password: this._passwordController.value);

        if (response == "Credenciales correctas") {
          _login = true;
        } else {
          onFailure("Correo electrónico o contraseña incorrectos ");
        }
        return _login;
      } on Exception catch (e) {
        if ('$e'.contains("Unauthorized")) {
          onFailure("Correo electrónico o contraseña incorrectos");
        } else {
          onFailure("Ha ocurrido un error inesperado");
        }
        return false;
      }
    } else {
      //Debe llenar todos los campos
      onFailure("Debe llenar todos los campos");
      return false;
    }
  }
}
