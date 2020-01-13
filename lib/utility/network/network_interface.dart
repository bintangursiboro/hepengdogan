import 'package:contact_app/utility/network/network_model.dart';
import 'package:dio/dio.dart';

class NetworkInterface {
  final Dio dio;

  NetworkInterface({this.dio});

  Future<NetworkModel> requestGet(
      {String path, Map<String, dynamic> parameter}) async {
    String baseUrl = 'https://simple-contact-crud.herokuapp.com/';
    return await dio
        .get("$baseUrl$path", queryParameters: parameter)
        .then((jsonResponse) {
      print('${jsonResponse.data}');
      return NetworkModel(
          code: jsonResponse.statusCode,
          error: '',
          response: jsonResponse.data);
    });
  }

  Future<NetworkModel> requestPost(
      {String path, Map<String, dynamic> parameter}) async {
    String baseUrl = 'https://simple-contact-crud.herokuapp.com/';
    return await dio.post("$baseUrl$path").then((jsonResponse) {
      return NetworkModel(
          code: jsonResponse.statusCode,
          error: '',
          response: jsonResponse.data);
    });
  }

  Future<NetworkModel> requestDelete(String path) async {
    String baseUrl = 'https://simple-contact-crud.herokuapp.com/contact/';
    return dio.delete("$baseUrl$path").then((jsonResponse) {
      return NetworkModel(
        code: jsonResponse.statusCode,
        response: jsonResponse.data,
        error: '',
      );
    });
  }
}
