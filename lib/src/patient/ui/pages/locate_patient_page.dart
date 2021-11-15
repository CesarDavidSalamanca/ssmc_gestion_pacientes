import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:ssmc_gestion_pacientes/src/patient/bloc/search_patient_bloc.dart';
import 'package:ssmc_gestion_pacientes/src/patient/ui/widgets/patient_info_cards.dart';
import 'package:ssmc_gestion_pacientes/src/widgets/google_maps.dart';

class LocatePatientPage extends StatefulWidget {
  @override
  _LocatePatientPageState createState() => _LocatePatientPageState();
}

class _LocatePatientPageState extends State<LocatePatientPage> {
  bool firstBuild;
  SearchPatientBloc locatePatientBloc;
  @override
  void initState() {
    super.initState();
    firstBuild = true;
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    if (firstBuild) {
      firstBuild = false;
      locatePatientBloc = SearchPatientBloc();
    }
    return BlocProvider(
      bloc: locatePatientBloc,
      child: Scaffold(
          body: SingleChildScrollView(
              child: Column(
        children: [
          SizedBox(
            height: height * 0.05,
          ),
          SearchCards(width: width),
          SizedBox(
            height: height * 0.05,
          ),
          GoogleMaps(
            width: width * 0.6,
            height: width * 0.4,
          )
        ],
      ))),
    );
  }
}
