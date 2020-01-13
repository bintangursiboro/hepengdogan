import 'package:meta/meta.dart';

class NetworkModel {
  int code;

  Map<String, dynamic> response;

  String error;

  NetworkModel({
    @required this.code,
    @required this.response,
    @required this.error,
  });
}

class DataModel {
  String message;
  Map<String, dynamic> data;

  DataModel({this.data, this.message});

  DataModel.fromJson(Map<String, dynamic> jsonResponse) {
    if (jsonResponse['message'] != null) this.message = jsonResponse['message'];
    if (jsonResponse['data'] != null) this.data = jsonResponse['data'];
  }
}
