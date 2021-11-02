class Patient {
  String typeDoc;
  String doc;

  String name;
  String illness;
  String zone;

  int birthdate;
  String eps;
  String typeAfiliation;
  String civilState;

  String address;
  String carerOnMap;
  String carerRoadOnMap;
  String timeFromRoadToCarer;

  Patient(
      {this.typeDoc,
      this.doc,
      this.address,
      this.birthdate,
      this.carerOnMap,
      this.carerRoadOnMap,
      this.civilState,
      this.eps,
      this.illness,
      this.name,
      this.timeFromRoadToCarer,
      this.typeAfiliation,
      this.zone});
}
