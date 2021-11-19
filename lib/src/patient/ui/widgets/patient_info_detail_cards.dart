import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:provider/provider.dart';
import 'package:ssmc_gestion_pacientes/src/patient/bloc/carer_info_bloc.dart';
import 'package:ssmc_gestion_pacientes/src/patient/bloc/search_patient_bloc.dart';
import 'package:ssmc_gestion_pacientes/src/patient/model/carer.dart';
import 'package:ssmc_gestion_pacientes/src/patient/model/patient.dart';
import 'package:ssmc_gestion_pacientes/src/theme/theme.dart';
import 'package:ssmc_gestion_pacientes/src/widgets/buttons.dart';
import 'package:ssmc_gestion_pacientes/src/widgets/google_maps.dart';
import 'package:ssmc_gestion_pacientes/src/widgets/textfields.dart';

class SearchPatientCards extends StatefulWidget {
  const SearchPatientCards({
    Key key,
    @required this.width,
    this.isUpdate = false,
    this.isToAdd = false,
  }) : super(key: key);

  final double width;
  final bool isUpdate;
  final bool isToAdd;

  @override
  _SearchPatientCardsState createState() => _SearchPatientCardsState();
}

class _SearchPatientCardsState extends State<SearchPatientCards>
    with TickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    double cardWidth = widget.width;
    bool twoColumns = false;
    final currentTheme = Provider.of<ThemeChanger>(context).currentTheme;
    if (widget.width > 600) {
      if (widget.width > 900) {
        cardWidth = ((widget.width - 251) / 2) * 0.9;
        twoColumns = true;
      } else
        cardWidth = (widget.width - 250) * 0.8;
    } else {
      cardWidth = widget.width * 0.8;
    }
    return twoColumns
        ? SingleChildScrollView(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    SizedBox(height: cardWidth * 0.05),
                    SearchCard(
                        cardWidth: cardWidth,
                        isToAdd: widget.isToAdd,
                        isToUpdate: widget.isUpdate),
                    SizedBox(height: cardWidth * 0.025),
                    PatientDataCard(
                        cardWidth: cardWidth,
                        isToAdd: widget.isToAdd,
                        isToUpdate: widget.isUpdate),
                    SizedBox(height: cardWidth * 0.025),
                    PatientInfoCard(
                        cardWidth: cardWidth,
                        isToAdd: widget.isToAdd,
                        isToUpdate: widget.isUpdate),
                    SizedBox(height: cardWidth * 0.025),
                    PatientAddressCard(
                        cardWidth: cardWidth,
                        isToAdd: widget.isToAdd,
                        isToUpdate: widget.isUpdate),
                    SizedBox(height: cardWidth * 0.025),
                    if (widget.isUpdate)
                      Container(
                        width: cardWidth * 0.8,
                        height: cardWidth * 0.1,
                        child: ButtonRounded(
                            text: "Actualizar Paciente",
                            onTap: () {},
                            fontSize: cardWidth * 0.05),
                      ),
                    if (widget.isToAdd)
                      Container(
                        width: cardWidth * 0.8,
                        height: cardWidth * 0.1,
                        child: ButtonRounded(
                            text: "Añadir Paciente",
                            onTap: () {},
                            fontSize: cardWidth * 0.05),
                      ),
                    if (widget.isUpdate || widget.isToAdd)
                      SizedBox(height: cardWidth * 0.025),
                  ],
                ),
                Column(
                  children: [
                    SizedBox(height: cardWidth * 0.05),
                    CarerIdentifiedCard(
                        cardWidth: cardWidth,
                        isToAdd: widget.isToAdd,
                        isToUpdate: widget.isUpdate),
                    SizedBox(height: cardWidth * 0.025),
                    CarerNameCard(
                        cardWidth: cardWidth,
                        isToAdd: widget.isToAdd,
                        isToUpdate: widget.isUpdate),
                    SizedBox(height: cardWidth * 0.025),
                    CarerInfoCard(
                        cardWidth: cardWidth,
                        isToAdd: widget.isToAdd,
                        isToUpdate: widget.isUpdate),
                    SizedBox(height: cardWidth * 0.025),
                    CarerAddressCard(
                        cardWidth: cardWidth,
                        isToAdd: widget.isToAdd,
                        isToUpdate: widget.isUpdate),
                    SizedBox(height: cardWidth * 0.025),
                    if (widget.isUpdate)
                      Container(
                        width: cardWidth * 0.8,
                        height: cardWidth * 0.1,
                        child: ButtonRounded(
                            text: "Actualizar Cuidador",
                            onTap: () {},
                            fontSize: cardWidth * 0.05),
                      ),
                    if (widget.isToAdd)
                      Container(
                        width: cardWidth * 0.8,
                        height: cardWidth * 0.1,
                        child: ButtonRounded(
                            text: "Añadir Cuidador",
                            onTap: () {},
                            fontSize: cardWidth * 0.05),
                      ),
                    if (widget.isUpdate || widget.isToAdd)
                      SizedBox(height: cardWidth * 0.025),
                  ],
                )
              ],
            ),
          )
        : Column(
            children: [
              TabBar(
                labelColor: currentTheme.accentColor,
                unselectedLabelColor: currentTheme.primaryColorDark,
                controller: _tabController,
                tabs: [
                  Tab(
                    text: 'Paciente',
                  ),
                  Tab(
                    text: 'Cuidador',
                  )
                ],
              ),
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(height: cardWidth * 0.025),
                          SearchCard(
                              cardWidth: cardWidth,
                              isToAdd: widget.isToAdd,
                              isToUpdate: widget.isUpdate),
                          SizedBox(height: cardWidth * 0.025),
                          PatientDataCard(
                              cardWidth: cardWidth,
                              isToAdd: widget.isToAdd,
                              isToUpdate: widget.isUpdate),
                          SizedBox(height: cardWidth * 0.025),
                          PatientInfoCard(
                              cardWidth: cardWidth,
                              isToAdd: widget.isToAdd,
                              isToUpdate: widget.isUpdate),
                          SizedBox(height: cardWidth * 0.025),
                          PatientAddressCard(
                              cardWidth: cardWidth,
                              isToAdd: widget.isToAdd,
                              isToUpdate: widget.isUpdate),
                          SizedBox(height: cardWidth * 0.025),
                          if (widget.isUpdate)
                            Container(
                              width: cardWidth * 0.8,
                              height: cardWidth * 0.1,
                              child: ButtonRounded(
                                  text: "Actualizar Paciente",
                                  onTap: () {},
                                  fontSize: cardWidth * 0.05),
                            ),
                          if (widget.isToAdd)
                            Container(
                              width: cardWidth * 0.8,
                              height: cardWidth * 0.1,
                              child: ButtonRounded(
                                  text: "Añadir Paciente",
                                  onTap: () {},
                                  fontSize: cardWidth * 0.05),
                            ),
                          if (widget.isUpdate || widget.isToAdd)
                            SizedBox(height: cardWidth * 0.025),
                        ],
                      ),
                    ),
                    SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(height: cardWidth * 0.025),
                          CarerIdentifiedCard(
                              cardWidth: cardWidth,
                              isToAdd: widget.isToAdd,
                              isToUpdate: widget.isUpdate),
                          SizedBox(height: cardWidth * 0.025),
                          CarerNameCard(
                              cardWidth: cardWidth,
                              isToAdd: widget.isToAdd,
                              isToUpdate: widget.isUpdate),
                          SizedBox(height: cardWidth * 0.025),
                          CarerInfoCard(
                              cardWidth: cardWidth,
                              isToAdd: widget.isToAdd,
                              isToUpdate: widget.isUpdate),
                          SizedBox(height: cardWidth * 0.025),
                          CarerAddressCard(
                              cardWidth: cardWidth,
                              isToAdd: widget.isToAdd,
                              isToUpdate: widget.isUpdate),
                          SizedBox(height: cardWidth * 0.025),
                          if (widget.isUpdate)
                            Container(
                              width: cardWidth * 0.8,
                              height: cardWidth * 0.1,
                              child: ButtonRounded(
                                  text: "Actualizar Cuidador",
                                  onTap: () {},
                                  fontSize: cardWidth * 0.05),
                            ),
                          if (widget.isToAdd)
                            Container(
                              width: cardWidth * 0.8,
                              height: cardWidth * 0.1,
                              child: ButtonRounded(
                                  text: "Añadir Cuidador",
                                  onTap: () {},
                                  fontSize: cardWidth * 0.05),
                            ),
                          if (widget.isUpdate || widget.isToAdd)
                            SizedBox(height: cardWidth * 0.025),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          );
  }
}

class SearchCard extends StatelessWidget {
  const SearchCard({
    Key key,
    @required this.cardWidth,
    this.isToAdd = false,
    this.isToUpdate = false,
  }) : super(key: key);

  final double cardWidth;
  final bool isToAdd;
  final bool isToUpdate;

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
                text: "Buscar",
                onTap: () async {
                  DataModel dataModel =
                      Provider.of<DataModel>(context, listen: false);
                  dataModel.currentPatient = Patient(
                      name: "Luis Espitia",
                      address: "Cra 3 # 21-18",
                      birthdate: DateTime.now().millisecondsSinceEpoch,
                      carerOnMap: "1",
                      carerRoadOnMap: "2",
                      civilState: "Casado",
                      doc: "1234",
                      eps: "Sanitas",
                      illness: "Depresión",
                      timeFromRoadToCarer: "10 min",
                      typeAfiliation: "Contributivo",
                      typeDoc: "C.C",
                      zone: "Rural");
                  dataModel.currentCarer = Carer(
                      name: "Carlos Espitia",
                      address: "Cra 3 # 21-18",
                      birthdate: DateTime.now().millisecondsSinceEpoch,
                      carerOnMap: "1",
                      carerRoadOnMap: "2",
                      civilState: "Casado",
                      doc: "1234",
                      eps: "Sanitas",
                      relationship: "Hermano",
                      timeFromRoadToCarer: "10 min",
                      typeAfiliation: "Contributivo",
                      typeDoc: "C.C",
                      zone: "Rural");
                  locatePatientBloc.changeZone(dataModel.currentPatient.zone);
                  locatePatientBloc.carerInfoBloc
                      .changeTypeDocument(dataModel.currentCarer.typeDoc);
                  locatePatientBloc.carerInfoBloc
                      .changeZone(dataModel.currentCarer.zone);
                  locatePatientBloc.aditionalPatientInfoBloc
                      .changeafiliationType(
                          dataModel.currentPatient.typeAfiliation);
                  locatePatientBloc.aditionalCarerInfoBloc.changeafiliationType(
                      dataModel.currentCarer.typeAfiliation);
                },
                fontSize: cardWidth * 0.04),
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
    this.isToAdd = false,
    this.isToUpdate = false,
  }) : super(key: key);

  final double cardWidth;
  final bool isToAdd;
  final bool isToUpdate;

  @override
  Widget build(BuildContext context) {
    final currentTheme = Provider.of<ThemeChanger>(context).currentTheme;
    final dataModel = Provider.of<DataModel>(context);
    final locatePatientBloc = BlocProvider.of<SearchPatientBloc>(context);
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
          SizedBox(height: cardWidth * 0.02),
          Container(
              width: cardWidth * 0.8,
              child: isToAdd || isToUpdate
                  ? StreamTextField(
                      textStream: locatePatientBloc.nameStream,
                      changeStream: locatePatientBloc.changeName,
                      labelText: "Nombres",
                      initialValue: dataModel.currentPatient.name)
                  : FalseTextField(
                      labelText: "Nombres",
                      initialValue: dataModel.currentPatient.name,
                    )),
          SizedBox(height: cardWidth * 0.02),
          Container(
            width: cardWidth * 0.8,
            child: isToAdd || isToUpdate
                ? StreamTextField(
                    textStream: locatePatientBloc.ilnessStream,
                    changeStream: locatePatientBloc.changeIlness,
                    labelText: "Enfermedad registrada",
                    initialValue: dataModel.currentPatient.illness)
                : FalseTextField(
                    initialValue: dataModel.currentPatient.illness,
                    labelText: "Enfermedad registrada",
                  ),
          ),
          SizedBox(height: cardWidth * 0.02),
          Container(
            width: cardWidth * 0.8,
            child: isToAdd || isToUpdate
                ? StreamDropDown(
                    textStream: locatePatientBloc.zoneStream,
                    changeStream: locatePatientBloc.changeZone,
                    labelText: "Zona",
                    initialValue: dataModel.currentPatient.zone,
                    dropDownElements: [
                      DropDownElement(label: "Urbana", text: "Urbana"),
                      DropDownElement(label: "Rural", text: "Rural"),
                    ],
                  )
                : FalseTextField(
                    initialValue: dataModel.currentPatient.zone,
                    labelText: "Zona",
                  ),
          ),
          SizedBox(height: cardWidth * 0.02),
        ],
      ),
    );
  }
}

class PatientInfoCard extends StatelessWidget {
  const PatientInfoCard({
    Key key,
    @required this.cardWidth,
    this.isToAdd = false,
    this.isToUpdate = false,
  }) : super(key: key);

  final double cardWidth;
  final bool isToAdd;
  final bool isToUpdate;

  @override
  Widget build(BuildContext context) {
    final dataModel = Provider.of<DataModel>(context);
    final currentTheme = Provider.of<ThemeChanger>(context).currentTheme;

    final patientBloc =
        BlocProvider.of<SearchPatientBloc>(context).aditionalPatientInfoBloc;
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
              child: isToAdd || isToUpdate
                  ? StreamTextFieldDate(
                      textStream: patientBloc.birthdateStream,
                      changeStream: patientBloc.changebirthdate,
                      labelText: "Fecha de nacimiento",
                      hintText: 'DD/MM/AA',
                    )
                  : FalseTextField(
                      labelText: "Fecha de nacimiento",
                      initialValue:
                          dataModel.currentPatient.birthdate.toString(),
                    )),
          SizedBox(
            height: cardWidth * 0.02,
          ),
          Container(
            width: cardWidth * 0.8,
            child: isToAdd || isToUpdate
                ? StreamTextField(
                    textStream: patientBloc.epsStream,
                    changeStream: patientBloc.changeeps,
                    labelText: "Eps",
                    initialValue: dataModel.currentPatient.eps)
                : FalseTextField(
                    initialValue: dataModel.currentPatient.eps,
                    labelText: "Eps",
                  ),
          ),
          SizedBox(
            height: cardWidth * 0.02,
          ),
          Container(
            width: cardWidth * 0.8,
            child: isToAdd || isToUpdate
                ? StreamDropDown(
                    textStream: patientBloc.afiliationTypeStream,
                    changeStream: patientBloc.changeafiliationType,
                    labelText: "Tipo de afiliación",
                    initialValue: dataModel.currentPatient.typeAfiliation,
                    dropDownElements: [
                      DropDownElement(
                          label: "Contributivo", text: "Contributivo"),
                      DropDownElement(label: "Subsidiado", text: "Subsidiado"),
                    ],
                  )
                : FalseTextField(
                    initialValue: dataModel.currentPatient.typeAfiliation,
                    labelText: "Tipo de afiliación",
                  ),
          ),
          SizedBox(
            height: cardWidth * 0.02,
          ),
          Container(
            width: cardWidth * 0.8,
            child: isToAdd || isToUpdate
                ? StreamTextField(
                    textStream: patientBloc.civilStateStream,
                    changeStream: patientBloc.changecivilState,
                    labelText: "Estado civil",
                    initialValue: dataModel.currentPatient.civilState)
                : FalseTextField(
                    initialValue: dataModel.currentPatient.civilState,
                    labelText: "Estado civil",
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

class PatientAddressCard extends StatelessWidget {
  const PatientAddressCard({
    Key key,
    @required this.cardWidth,
    this.isToAdd = false,
    this.isToUpdate = false,
  }) : super(key: key);

  final double cardWidth;
  final bool isToAdd;
  final bool isToUpdate;

  @override
  Widget build(BuildContext context) {
    final dataModel = Provider.of<DataModel>(context);
    final currentTheme = Provider.of<ThemeChanger>(context).currentTheme;

    final patientBloc =
        BlocProvider.of<SearchPatientBloc>(context).addressPatientInfoBloc;
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
              child: isToAdd || isToUpdate
                  ? StreamTextField(
                      textStream: patientBloc.addressStream,
                      changeStream: patientBloc.changeaddress,
                      labelText: "Dirección",
                      initialValue: dataModel.currentPatient.address)
                  : FalseTextField(
                      labelText: "Dirección",
                      initialValue: dataModel.currentPatient.address,
                    )),
          SizedBox(
            height: cardWidth * 0.02,
          ),
          Container(
            width: cardWidth * 0.8,
            child: GestureDetector(
              onTap: isToAdd || isToUpdate
                  ? () async {
                      final latLng = await selectLatLng(context);
                      dataModel.currentPatient.carerOnMap =
                          "${latLng.latitude}, ${latLng.longitude}";
                      dataModel.currentPatient = dataModel.currentPatient;
                    }
                  : null,
              child: FalseTextField(
                initialValue: dataModel.currentPatient.carerOnMap,
                labelText: "Ubicación del paciente",
              ),
            ),
          ),
          SizedBox(
            height: cardWidth * 0.02,
          ),
          Container(
            width: cardWidth * 0.8,
            child: GestureDetector(
              onTap: isToAdd || isToUpdate
                  ? () async {
                      final latLng = await selectLatLng(context);
                      dataModel.currentPatient.carerRoadOnMap =
                          "${latLng.latitude}, ${latLng.longitude}";
                      dataModel.currentPatient = dataModel.currentPatient;
                    }
                  : null,
              child: FalseTextField(
                initialValue: dataModel.currentPatient.carerRoadOnMap,
                labelText: "Ubicación de la entrada por carretera",
              ),
            ),
          ),
          SizedBox(
            height: cardWidth * 0.02,
          ),
          Container(
            width: cardWidth * 0.8,
            child: FalseTextField(
              initialValue: dataModel.currentPatient.timeFromRoadToCarer,
              labelText: "Tiempo desde carretera hasta el paciente",
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

class CarerIdentifiedCard extends StatelessWidget {
  const CarerIdentifiedCard({
    Key key,
    @required this.cardWidth,
    this.isToAdd = false,
    this.isToUpdate = false,
  }) : super(key: key);

  final double cardWidth;
  final bool isToAdd;
  final bool isToUpdate;

  @override
  Widget build(BuildContext context) {
    final dataModel = Provider.of<DataModel>(context);
    final currentTheme = Provider.of<ThemeChanger>(context).currentTheme;

    final carerBloc = BlocProvider.of<SearchPatientBloc>(context).carerInfoBloc;
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
              child: isToAdd || isToUpdate
                  ? StreamDropDown(
                      textStream: carerBloc.typeDocumentStream,
                      changeStream: carerBloc.changeTypeDocument,
                      initialValue: dataModel.currentCarer.typeDoc,
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
                        ])
                  : FalseTextField(
                      labelText: "Tipo de documento",
                      initialValue: dataModel._currentCarer.typeDoc,
                    )),
          SizedBox(
            height: cardWidth * 0.02,
          ),
          Container(
            width: cardWidth * 0.8,
            child: isToAdd || isToUpdate
                ? StreamTextField(
                    textStream: carerBloc.documentStream,
                    changeStream: carerBloc.changeDocument,
                    labelText: "Documento",
                    initialValue: dataModel.currentCarer.doc)
                : FalseTextField(
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

class CarerNameCard extends StatelessWidget {
  const CarerNameCard({
    Key key,
    @required this.cardWidth,
    this.isToAdd = false,
    this.isToUpdate = false,
  }) : super(key: key);

  final double cardWidth;
  final bool isToAdd;
  final bool isToUpdate;

  @override
  Widget build(BuildContext context) {
    final dataModel = Provider.of<DataModel>(context);
    final currentTheme = Provider.of<ThemeChanger>(context).currentTheme;

    final carerBloc = BlocProvider.of<SearchPatientBloc>(context).carerInfoBloc;
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
          SizedBox(height: cardWidth * 0.02),
          Container(
              width: cardWidth * 0.8,
              child: isToAdd || isToUpdate
                  ? StreamTextField(
                      textStream: carerBloc.nameStream,
                      changeStream: carerBloc.changeName,
                      labelText: "Nombres",
                      initialValue: dataModel.currentCarer.name)
                  : FalseTextField(
                      labelText: "Nombres",
                      initialValue: dataModel.currentCarer.name,
                    )),
          SizedBox(height: cardWidth * 0.02),
          Container(
            width: cardWidth * 0.8,
            child: isToAdd || isToUpdate
                ? StreamTextField(
                    textStream: carerBloc.relationshipStream,
                    changeStream: carerBloc.changerelationship,
                    labelText: "Parentesco",
                    initialValue: dataModel.currentCarer.relationship)
                : FalseTextField(
                    initialValue: dataModel.currentCarer.relationship,
                    labelText: "Parentesco",
                  ),
          ),
          SizedBox(height: cardWidth * 0.02),
          Container(
            width: cardWidth * 0.8,
            child: isToAdd || isToUpdate
                ? StreamDropDown(
                    textStream: carerBloc.zoneStream,
                    changeStream: carerBloc.changeZone,
                    labelText: "Zona",
                    initialValue: dataModel.currentCarer.zone,
                    dropDownElements: [
                      DropDownElement(label: "Urbana", text: "Urbana"),
                      DropDownElement(label: "Rural", text: "Rural"),
                    ],
                  )
                : FalseTextField(
                    initialValue: dataModel.currentCarer.zone,
                    labelText: "Zona",
                  ),
          ),
          SizedBox(height: cardWidth * 0.02),
        ],
      ),
    );
  }
}

class CarerInfoCard extends StatelessWidget {
  const CarerInfoCard({
    Key key,
    @required this.cardWidth,
    this.isToAdd = false,
    this.isToUpdate = false,
  }) : super(key: key);

  final double cardWidth;
  final bool isToAdd;
  final bool isToUpdate;

  @override
  Widget build(BuildContext context) {
    final dataModel = Provider.of<DataModel>(context);
    final currentTheme = Provider.of<ThemeChanger>(context).currentTheme;

    final carerBloc =
        BlocProvider.of<SearchPatientBloc>(context).aditionalCarerInfoBloc;
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
              child: isToAdd || isToUpdate
                  ? StreamTextFieldDate(
                      textStream: carerBloc.birthdateStream,
                      changeStream: carerBloc.changebirthdate,
                      labelText: "Fecha de nacimiento",
                      hintText: 'DD/MM/AA',
                    )
                  : FalseTextField(
                      labelText: "Fecha de nacimiento",
                      initialValue: dataModel.currentCarer.birthdate.toString(),
                    )),
          SizedBox(
            height: cardWidth * 0.02,
          ),
          Container(
            width: cardWidth * 0.8,
            child: isToAdd || isToUpdate
                ? StreamTextField(
                    textStream: carerBloc.epsStream,
                    changeStream: carerBloc.changeeps,
                    labelText: "Eps",
                    initialValue: dataModel.currentCarer.eps)
                : FalseTextField(
                    initialValue: dataModel.currentCarer.eps,
                    labelText: "Eps",
                  ),
          ),
          SizedBox(
            height: cardWidth * 0.02,
          ),
          Container(
            width: cardWidth * 0.8,
            child: isToAdd || isToUpdate
                ? StreamDropDown(
                    textStream: carerBloc.afiliationTypeStream,
                    changeStream: carerBloc.changeafiliationType,
                    labelText: "Tipo de afiliación",
                    initialValue: dataModel.currentCarer.typeAfiliation,
                    dropDownElements: [
                      DropDownElement(
                          label: "Contributivo", text: "Contributivo"),
                      DropDownElement(label: "Subsidiado", text: "Subsidiado"),
                    ],
                  )
                : FalseTextField(
                    initialValue: dataModel.currentCarer.typeAfiliation,
                    labelText: "Tipo de afiliación",
                  ),
          ),
          SizedBox(
            height: cardWidth * 0.02,
          ),
          Container(
            width: cardWidth * 0.8,
            child: isToAdd || isToUpdate
                ? StreamTextField(
                    textStream: carerBloc.civilStateStream,
                    changeStream: carerBloc.changecivilState,
                    labelText: "Estado civil",
                    initialValue: dataModel.currentPatient.civilState)
                : FalseTextField(
                    initialValue: dataModel.currentCarer.civilState,
                    labelText: "Estado civil",
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

class CarerAddressCard extends StatelessWidget {
  const CarerAddressCard({
    Key key,
    @required this.cardWidth,
    this.isToAdd = false,
    this.isToUpdate = false,
  }) : super(key: key);

  final double cardWidth;
  final bool isToAdd;
  final bool isToUpdate;

  @override
  Widget build(BuildContext context) {
    final dataModel = Provider.of<DataModel>(context);
    final currentTheme = Provider.of<ThemeChanger>(context).currentTheme;

    final patientBloc =
        BlocProvider.of<SearchPatientBloc>(context).addressCarerInfoBloc;
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
              child: isToAdd || isToUpdate
                  ? StreamTextField(
                      textStream: patientBloc.addressStream,
                      changeStream: patientBloc.changeaddress,
                      labelText: "Dirección",
                      initialValue: dataModel.currentCarer.address)
                  : FalseTextField(
                      labelText: "Dirección",
                      initialValue: dataModel.currentCarer.address,
                    )),
          SizedBox(
            height: cardWidth * 0.02,
          ),
          Container(
            width: cardWidth * 0.8,
            child: GestureDetector(
              onTap: isToAdd || isToUpdate
                  ? () async {
                      final latLng = await selectLatLng(context);
                      dataModel.currentCarer.carerOnMap =
                          "${latLng.latitude}, ${latLng.longitude}";
                      dataModel.currentCarer = dataModel.currentCarer;
                    }
                  : null,
              child: FalseTextField(
                initialValue: dataModel.currentCarer.carerOnMap,
                labelText: "Ubicación del cuidador",
              ),
            ),
          ),
          SizedBox(
            height: cardWidth * 0.02,
          ),
          Container(
            width: cardWidth * 0.8,
            child: GestureDetector(
              onTap: isToAdd || isToUpdate
                  ? () async {
                      final latLng = await selectLatLng(context);
                      dataModel.currentCarer.carerRoadOnMap =
                          "${latLng.latitude}, ${latLng.longitude}";
                      dataModel.currentCarer = dataModel.currentCarer;
                    }
                  : null,
              child: FalseTextField(
                initialValue: dataModel.currentCarer.carerRoadOnMap,
                labelText: "Ubicación de la entrada por carretera",
              ),
            ),
          ),
          SizedBox(
            height: cardWidth * 0.02,
          ),
          Container(
            width: cardWidth * 0.8,
            child: FalseTextField(
              initialValue: dataModel.currentCarer.timeFromRoadToCarer,
              labelText: "Tiempo desde carretera hasta el cuidador",
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
