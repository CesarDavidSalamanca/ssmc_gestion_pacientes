class Patient {
  String patientId;
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
  double addressLat() {
    return double.tryParse(carerOnMap.split(", ")[0]);
  }

  double addressLng() {
    return double.tryParse(carerOnMap.split(", ")[1]);
  }

  double roadLat() {
    return double.tryParse(carerRoadOnMap.split(", ")[0]);
  }

  double roadLng() {
    return double.tryParse(carerRoadOnMap.split(", ")[1]);
  }
}
