import 'package:contact_app/utility/network/network_model.dart';
import 'package:dio/dio.dart';

class NetworkInterface {
  final Dio dio;

  NetworkInterface({this.dio});

  Future<NetworkModel> requestGet(
      {String baseUrl, String path, Map<String, dynamic> parameter}) async {
    if (baseUrl == null) baseUrl = 'https://simple-contact-crud.herokuapp.com/';
    return await dio
        .get("$baseUrl$path", queryParameters: parameter)
        .then((jsonResponse) {
      return NetworkModel(
          code: jsonResponse.statusCode,
          error: '',
          response: jsonResponse.data);
    });
  }

  Future<NetworkModel> requestPost(
      {String baseUrl, String path, Map<String, dynamic> parameter}) async {
    if (baseUrl == null) baseUrl = 'https://simple-contact-crud.herokuapp.com/';
    return await dio.post("$baseUrl$path").then((jsonResponse) {
      return NetworkModel(
          code: jsonResponse.statusCode,
          error: '',
          response: jsonResponse.data);
    });
  }
}
