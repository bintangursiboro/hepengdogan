import 'package:contact_app/page/add_contact/model/contact_model.dart';
import 'package:contact_app/utility/di/injector_container.dart';
import 'package:contact_app/utility/exception/custom_exception.dart';
import 'package:contact_app/utility/network/network_interface.dart';
import 'package:contact_app/utility/network/network_model.dart';
import 'package:dio/dio.dart';

class MenuContactService {
  // NetworkInterface networkInterface = InjectorContainer().getNetworkInterface();
  Dio networkInterface = Dio();
  String baseUrl = 'https://simple-contact-crud.herokuapp.com/';
  String path = 'contact';

  Future<List<ContactModel>> getContacts() async {
    return await networkInterface.get('$baseUrl$path').then((jsonResponse) {
      if (jsonResponse != null) {
        if (jsonResponse.statusCode == 200) {
          return ContactModel.toList(jsonResponse.data['data']);
        }
        throw UnexpectedErrorException();
      }
      throw UnexpectedErrorException();
    });
  }
}
