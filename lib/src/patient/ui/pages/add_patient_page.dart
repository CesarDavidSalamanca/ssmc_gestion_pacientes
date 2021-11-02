import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:provider/provider.dart';
import 'package:ssmc_gestion_pacientes/src/patient/bloc/search_patient_bloc.dart';
import 'package:ssmc_gestion_pacientes/src/patient/ui/widgets/patient_info_detail_cards.dart';

class AddPatientPage extends StatefulWidget {
  @override
  _AddPatientPageState createState() => _AddPatientPageState();
}

class _AddPatientPageState extends State<AddPatientPage> {
  bool firstBuild;
  SearchPatientBloc locatePatientBloc;
  DataModel dataModel;
  @override
  void initState() {
    super.initState();
    firstBuild = true;
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    if (firstBuild) {
      firstBuild = false;
      locatePatientBloc = SearchPatientBloc();
      dataModel = DataModel();
    }
    return BlocProvider(
      bloc: locatePatientBloc,
      child: ChangeNotifierProvider(
        create: (_) => dataModel,
        child: Scaffold(
            body: Column(
          children: [
            Expanded(
                child: SearchPatientCards(
              width: width,
              isToAdd: true,
            )),
          ],
        )),
      ),
    );
  }
}
