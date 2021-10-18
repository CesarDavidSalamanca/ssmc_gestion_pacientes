import 'package:ssmc_gestion_pacientes/src/launcher_page/launcher_page.dart';
import 'package:ssmc_gestion_pacientes/src/patient/ui/pages/add_patient_page.dart';
import 'package:ssmc_gestion_pacientes/src/patient/ui/pages/locate_patient_page.dart';
import 'package:ssmc_gestion_pacientes/src/login/ui/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:ssmc_gestion_pacientes/src/patient/ui/pages/search_patient_page.dart';
import 'package:ssmc_gestion_pacientes/src/patient/ui/pages/update_patient_page.dart';

final routes = <String, WidgetBuilder>{
  LoginPage.pageRoute: (BuildContext context) => LoginPage(),
  LauncherPage.pageRoute: (BuildContext context) => LauncherPage(),
};

final pageRoutes = <_Route>[
  _Route(Icons.pin_drop_outlined, "Ubicar paciente", LocatePatientPage()),
  _Route(Icons.search, "Consultar paciente", SearchPatientPage()),
  _Route(Icons.update, "Actualizar paciente", UpdatePatientPage()),
  _Route(Icons.add, "Registrar paciente", AddPatientPage()),
];

class _Route {
  final IconData icon;
  final String titulo;
  final Widget page;

  _Route(this.icon, this.titulo, this.page);
}
