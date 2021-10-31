import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:provider/provider.dart';
import 'package:ssmc_gestion_pacientes/src/patient/bloc/search_patient_bloc.dart';
import 'package:ssmc_gestion_pacientes/src/patient/model/carer.dart';
import 'package:ssmc_gestion_pacientes/src/patient/model/patient.dart';
import 'package:ssmc_gestion_pacientes/src/theme/theme.dart';
import 'package:ssmc_gestion_pacientes/src/widgets/buttons.dart';
import 'package:ssmc_gestion_pacientes/src/widgets/textfields.dart';

class SearchPatientCards extends StatelessWidget {
  const SearchPatientCards({
    Key key,
    @required this.width,
  }) : super(key: key);

  final double width;

  @override
  Widget build(BuildContext context) {
    double cardWidth = width;
    bool twoColumns = false;
    if (width > 600) {
      if (width > 900) {
        cardWidth = ((width - 251) / 2) * 0.9;
        twoColumns = true;
      } else
        cardWidth = (width - 250) * 0.8;
    } else {
      cardWidth = width * 0.8;
    }
    return twoColumns
        ? Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  SearchCard(cardWidth: cardWidth),
                  SizedBox(height: cardWidth * 0.025),
                  PatientDataCard(cardWidth: cardWidth),
                ],
              ),
              Column(
                children: [
                  CarerIdentifiedCard(cardWidth: cardWidth),
                  SizedBox(height: cardWidth * 0.025),
                  CarerInfoCard(cardWidth: cardWidth),
                ],
              )
            ],
          )
        : Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                width: double.infinity,
              ),
              SearchCard(cardWidth: cardWidth),
              SizedBox(height: cardWidth * 0.025),
              PatientDataCard(cardWidth: cardWidth),
            ],
          );
  }
}

class SearchCard extends StatelessWidget {
  const SearchCard({
    Key key,
    @required this.cardWidth,
  }) : super(key: key);

  final double cardWidth;

  @override
  Widget build(BuildContext context) {
    final locatePatientBloc = BlocProvider.of<SearchPatientBloc>(context);
    final currentTheme = Provider.of<ThemeChanger>(context).currentTheme;
    return Container(
      width: cardWidth,
      height: cardWidth * 0.55,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: currentTheme.primaryColorLight,
          boxShadow: [BoxShadow(color: Colors.grey, offset: Offset(0.5, 0.5))]),
      child: Column(
        children: [
          Container(
              width: cardWidth,
              padding: EdgeInsets.only(top: cardWidth * 0.025),
              child: Text(
                "Buscar paciente",
                textAlign: TextAlign.center,
              )),
          Container(
            width: cardWidth * 0.8,
            child: StreamDropDown(
                textStream: locatePatientBloc.typeDocumentStream,
                changeStream: locatePatientBloc.changeTypeDocument,
                initialValue: locatePatientBloc.typeDocument,
                labelText: "Tipo de documento",
                dropDownElements: [
                  DropDownElement(
                      label: "Cédula de ciudadania",
                      text: "Cédula de ciudadania"),
                  DropDownElement(
                      label: "Tarjeta de identidad",
                      text: "Tarjeta de identidad"),
                  DropDownElement(
                      label: "Cédula de extranjería",
                      text: "Cédula de extranjería"),
                ]),
          ),
          SizedBox(
            height: cardWidth * 0.02,
          ),
          Container(
            width: cardWidth * 0.8,
            child: StreamTextField(
              textStream: locatePatientBloc.documentStream,
              changeStream: locatePatientBloc.changeDocument,
              initialValue: locatePatientBloc.document,
              labelText: "Documento",
            ),
          ),
          SizedBox(
            height: cardWidth * 0.04,
          ),
          Container(
            width: cardWidth * 0.8,
            height: cardWidth * 0.08,
            child: ButtonRounded(
                text: "Buscar", onTap: () {}, fontSize: cardWidth * 0.04),
          ),
          SizedBox(
            height: cardWidth * 0.04,
          ),
        ],
      ),
    );
  }
}

class PatientDataCard extends StatelessWidget {
  const PatientDataCard({
    Key key,
    @required this.cardWidth,
  }) : super(key: key);

  final double cardWidth;

  @override
  Widget build(BuildContext context) {
    final currentTheme = Provider.of<ThemeChanger>(context).currentTheme;
    final locatePatientBloc = BlocProvider.of<SearchPatientBloc>(context);
    return Container(
      width: cardWidth,
      height: cardWidth * 0.55,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: currentTheme.primaryColorLight,
          boxShadow: [BoxShadow(color: Colors.grey, offset: Offset(0.5, 0.5))]),
      child: Column(
        children: [
          SizedBox(height: cardWidth * 0.04),
          Container(
            width: cardWidth * 0.8,
            child: Text(
              "Nombres",
              style: TextStyle(
                  color: currentTheme.dividerColor, fontSize: cardWidth * 0.04),
            ),
          ),
          StreamBuilder<String>(
              stream: locatePatientBloc.nameStream,
              initialData: "",
              builder: (context, snapshot) {
                return Container(
                  width: cardWidth * 0.8,
                  height: cardWidth * 0.08,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: currentTheme.secondaryHeaderColor),
                  child: Center(child: Text(snapshot.data)),
                );
              }),
          SizedBox(height: cardWidth * 0.04),
          Container(
            width: cardWidth * 0.8,
            child: Text(
              "Enfermedad registrada",
              style: TextStyle(
                  color: currentTheme.dividerColor, fontSize: cardWidth * 0.04),
            ),
          ),
          StreamBuilder<String>(
              stream: locatePatientBloc.ilnessStream,
              initialData: "",
              builder: (context, snapshot) {
                return Container(
                  width: cardWidth * 0.8,
                  height: cardWidth * 0.08,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: currentTheme.secondaryHeaderColor),
                  child: Center(child: Text(snapshot.data)),
                );
              }),
          SizedBox(height: cardWidth * 0.04),
          Container(
            width: cardWidth * 0.8,
            child: Text(
              "Zona",
              style: TextStyle(
                  color: currentTheme.dividerColor, fontSize: cardWidth * 0.04),
            ),
          ),
          StreamBuilder<String>(
              stream: locatePatientBloc.zoneStream,
              initialData: "",
              builder: (context, snapshot) {
                return Container(
                  width: cardWidth * 0.8,
                  height: cardWidth * 0.08,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: currentTheme.secondaryHeaderColor),
                  child: Center(child: Text(snapshot.data)),
                );
              }),
          SizedBox(height: cardWidth * 0.04),
        ],
      ),
    );
  }
}

class CarerIdentifiedCard extends StatelessWidget {
  const CarerIdentifiedCard({
    Key key,
    @required this.cardWidth,
  }) : super(key: key);

  final double cardWidth;

  @override
  Widget build(BuildContext context) {
    final dataModel = Provider.of<DataModel>(context);
    final currentTheme = Provider.of<ThemeChanger>(context).currentTheme;
    return Container(
      width: cardWidth,
      height: cardWidth * 0.55,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: currentTheme.primaryColorLight,
          boxShadow: [BoxShadow(color: Colors.grey, offset: Offset(0.5, 0.5))]),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
              width: cardWidth,
              padding: EdgeInsets.only(top: cardWidth * 0.025),
              child: Text(
                "Datos del cuidador",
                textAlign: TextAlign.center,
              )),
          Container(
              width: cardWidth * 0.8,
              child: FalseTextField(
                labelText: "Tipo de documento",
                initialValue: dataModel._currentCarer.typeDoc,
              )),
          SizedBox(
            height: cardWidth * 0.02,
          ),
          Container(
            width: cardWidth * 0.8,
            child: FalseTextField(
              initialValue: dataModel.currentPatient.doc,
              labelText: "Documento",
            ),
          ),
          SizedBox(
            height: cardWidth * 0.04,
          ),
          SizedBox(
            height: cardWidth * 0.04,
          ),
        ],
      ),
    );
  }
}

class CarerInfoCard extends StatelessWidget {
  const CarerInfoCard({
    Key key,
    @required this.cardWidth,
  }) : super(key: key);

  final double cardWidth;

  @override
  Widget build(BuildContext context) {
    final dataModel = Provider.of<DataModel>(context);
    final currentTheme = Provider.of<ThemeChanger>(context).currentTheme;
    return Container(
      width: cardWidth,
      height: cardWidth * 0.55,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: currentTheme.primaryColorLight,
          boxShadow: [BoxShadow(color: Colors.grey, offset: Offset(0.5, 0.5))]),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
            height: cardWidth * 0.02,
          ),
          Container(
              width: cardWidth * 0.8,
              child: FalseTextField(
                labelText: "Nombres",
                initialValue: dataModel._currentCarer.name,
              )),
          SizedBox(
            height: cardWidth * 0.02,
          ),
          Container(
            width: cardWidth * 0.8,
            child: FalseTextField(
              initialValue: dataModel.currentCarer.relationship,
              labelText: "Parentesco",
            ),
          ),
          SizedBox(
            height: cardWidth * 0.02,
          ),
          Container(
            width: cardWidth * 0.8,
            child: FalseTextField(
              initialValue: dataModel.currentCarer.zone,
              labelText: "Zona",
            ),
          ),
          SizedBox(
            height: cardWidth * 0.04,
          ),
        ],
      ),
    );
  }
}

class CarerOtherInfoCard extends StatelessWidget {
  const CarerOtherInfoCard({
    Key key,
    @required this.cardWidth,
  }) : super(key: key);

  final double cardWidth;

  @override
  Widget build(BuildContext context) {
    final dataModel = Provider.of<DataModel>(context);
    final currentTheme = Provider.of<ThemeChanger>(context).currentTheme;
    return Container(
      width: cardWidth,
      height: cardWidth * 0.75,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: currentTheme.primaryColorLight,
          boxShadow: [BoxShadow(color: Colors.grey, offset: Offset(0.5, 0.5))]),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
            height: cardWidth * 0.02,
          ),
          Container(
              width: cardWidth * 0.8,
              child: FalseTextField(
                labelText: "Nombres",
                initialValue: dataModel._currentCarer.name,
              )),
          SizedBox(
            height: cardWidth * 0.02,
          ),
          Container(
            width: cardWidth * 0.8,
            child: FalseTextField(
              initialValue: dataModel.currentCarer.relationship,
              labelText: "Parentesco",
            ),
          ),
          SizedBox(
            height: cardWidth * 0.02,
          ),
          Container(
            width: cardWidth * 0.8,
            child: FalseTextField(
              initialValue: dataModel.currentCarer.zone,
              labelText: "Zona",
            ),
          ),
          SizedBox(
            height: cardWidth * 0.04,
          ),
        ],
      ),
    );
  }
}

class DataModel with ChangeNotifier {
  Carer _currentCarer = Carer();

  set currentCarer(Carer carer) {
    this._currentCarer = carer;
    notifyListeners();
  }

  Carer get currentCarer => this._currentCarer;

  Patient _currentPatient = Patient();

  set currentPatient(Patient patient) {
    this._currentPatient = patient;
    notifyListeners();
  }

  Patient get currentPatient => this._currentPatient;
}