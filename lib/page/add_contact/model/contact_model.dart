class ContactModel {
  String firstName;
  String lastName;
  int age;
  String photo;

  static Map<String, dynamic> toJson(ContactModel model) {
    return {
      'firstName': model.firstName,
      'lastName': model.lastName,
      'age': model.age,
      'photo': model.photo,
    };
  }

  ContactModel.fromJson(Map<String, dynamic> json) {
    if (json['firstName'] != null) this.firstName = json['firstName'] ?? '';
    if (json['lastName'] != null) this.lastName = json['lastName'] ?? '';
    if (json['age'] != null) this.age = json['age'] ?? 0;
    if (json['photo'] != null) this.photo = json['photo'] ?? '';
  }

  static List<ContactModel> toList(Map<String, dynamic> json) {
    return List<ContactModel>.from(
        json['data'].map((x) => ContactModel.fromJson(x)));
  }
}

class ContactModelResponse {
  String message;
  List<ContactModel> listContactModel;

  ContactModelResponse.fromJson(Map<String, dynamic> jsonResponse) {
    if (jsonResponse['message'] != null) this.message = jsonResponse['message'];
    if (jsonResponse['data'] != null)
      this.listContactModel =
          List.from(jsonResponse['data'].map((x) => ContactModel.fromJson(x)));
  }
}
