import 'package:contact_app/page/add_contact/model/contact_model.dart';
import 'package:contact_app/utility/di/injector_container.dart';
import 'package:contact_app/utility/exception/custom_exception.dart';
import 'package:contact_app/utility/network/network_interface.dart';

class MenuContactService {
  NetworkInterface networkInterface = InjectorContainer().getNetworkInterface();
  // Dio networkInterface = Dio();
  // String baseUrl = 'https://simple-contact-crud.herokuapp.com/';
  // String path = 'contact';

  Future<ContactModelResponse> getContacts() async {
    return await networkInterface
        .requestGet(parameter: {}, path: 'contact').then((jsonResponse) {
      if (jsonResponse.code == 200) {
        return ContactModelResponse.fromJson(jsonResponse.response);
      }
      throw UnexpectedErrorException();
    });
  }

  Future<bool> deleteContact(String id) async {
    return await networkInterface.requestDelete(id).then((jsonResponse) {
      if (jsonResponse.code == 202) {
        return true;
      }
      return false;
    });
  }
}
