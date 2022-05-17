import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ssmc_gestion_pacientes/src/patient/bloc/patient_bloc.dart';
import 'package:ssmc_gestion_pacientes/src/patient/bloc/patient_state.dart';
import 'package:ssmc_gestion_pacientes/src/patient/ui/widgets/patient_info_detail_cards.dart';

class AddPatientPage extends StatefulWidget {
  @override
  _AddPatientPageState createState() => _AddPatientPageState();
}

class _AddPatientPageState extends State<AddPatientPage> {
  bool firstBuild;
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
      dataModel = DataModel();
    }
    return BlocProvider(
      create: (_) => PatientBloc(),
      child:
          BlocConsumer<PatientBloc, PatientState>(listener: (context, state) {
        if (state.success == 0 && state.error != '') {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              content: Text(state.error),
            ),
          );
        }
      }, builder: (context, snapshot) {
        var cubit = BlocProvider.of<PatientBloc>(context);
        return Scaffold(
          body: Column(
            children: [
              Expanded(
                child: SearchPatientCards(
                  cubit: cubit,
                  width: width,
                  isToAdd: true,
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
