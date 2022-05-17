class PatientUser {
  String document;
  String typeDocument;
  String firstName;
  String lastName;
  DateTime birthdate;
  String eps;
  String membership;
  int civilStateId;
  int addressId;
  int carerDocument;

  PatientUser(
      {this.document,
      this.typeDocument,
      this.firstName,
      this.lastName,
      this.birthdate,
      this.eps,
      this.membership,
      this.civilStateId,
      this.addressId,
      this.carerDocument});

  factory PatientUser.fromMap(Map<String, dynamic> map, String document) {
    return PatientUser(
      document: document,
      typeDocument: map['typeDocument'],
      firstName: map['firstName'],
      lastName: map['lastName'],
      birthdate: map['birthdate'],
      eps: map['eps'],
      membership: map['membership'],
      civilStateId: map['civilStateId'],
      addressId: map['addressId'],
      carerDocument: map['carerDocument'],
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'document': document,
      'typeDocument': typeDocument,
      'firstName': firstName,
      'lastName': lastName,
      'birthdate': birthdate,
      'eps': eps,
      'membership': membership,
      'civilStateId': civilStateId,
      'addressId': addressId,
      'carerDocument': carerDocument,
    };
  }
}
