import 'package:contact_app/page/add_contact/model/contact_model.dart';
import 'package:contact_app/utility/di/injector_container.dart';
import 'package:contact_app/utility/exception/custom_exception.dart';
import 'package:contact_app/utility/network/network_interface.dart';

class AddContactService {
  NetworkInterface _networkInterface =
      InjectorContainer().getNetworkInterface();
  final String path = 'contact';

  Future<bool> saveContact({ContactModel contactModel}) async {
    Map<String, dynamic> modelJson = ContactModel.toJson(contactModel);
    print(modelJson);
    return await _networkInterface
        .requestPost(path: path, parameter: modelJson)
        .then((jsonResponse) {
      if (jsonResponse.code >= 200 && jsonResponse.code < 300) {
        return true;
      }
      throw UnexpectedErrorException();
    });
  }
}
