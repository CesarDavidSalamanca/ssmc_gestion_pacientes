import 'dart:async';

class Validators {
  final validarEmail =
      StreamTransformer<String, String>.fromHandlers(handleData: (email, sink) {
    RegExp regExp = RegExp(
        r"^[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?$");
    if (regExp.hasMatch(email)) {
      sink.add(email);
    } else {
      sink.addError("Ingrese un email valido");
    }
  });

  final validarPassword = StreamTransformer<String, String>.fromHandlers(
      handleData: (password, sink) {
    if (password.length >= 4) {
      sink.add(password);
    } else {
      sink.addError('Más de 4 caracteres');
    }
  });

  final validarPasswordUpdate = StreamTransformer<String, String>.fromHandlers(
      handleData: (password, sink) {
    if (password.length == 0 || password == "0" || password == "") {
      sink.add("0");
    } else {
      if (password.length >= 4) {
        sink.add(password);
      } else {
        sink.addError('Más de 4 caracteres');
      }
    }
  });

  final validarLongitud3 = StreamTransformer<String, String>.fromHandlers(
      handleData: (password, sink) {
    if (password.length >= 3) {
      sink.add(password);
    } else {
      sink.addError('Más de 3 caracteres');
    }
  });

  final validarLongitud3a12 = StreamTransformer<String, String>.fromHandlers(
      handleData: (password, sink) {
    if (password.length >= 3) {
      if (password.length <= 12) {
        sink.add(password);
      } else
        sink.addError('12 o menos caracteres');
    } else {
      sink.addError('Más de 3 caracteres');
    }
  });

  final validarLongitudMax12 = StreamTransformer<String, String>.fromHandlers(
      handleData: (password, sink) {
    if (password.length <= 12) {
      sink.add(password);
    } else
      sink.addError('12 o menos caracteres');
  });

  final validarLongitud12 = StreamTransformer<String, String>.fromHandlers(
      handleData: (password, sink) {
    if (password.length >= 3) {
      if (password.length <= 22) {
        sink.add(password);
      } else
        sink.addError('22 o menos caracteres');
    } else {
      sink.addError('Más de 3 caracteres');
    }
  });
}
