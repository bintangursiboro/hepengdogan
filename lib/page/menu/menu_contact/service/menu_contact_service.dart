import 'package:contact_app/page/add_contact/model/contact_model.dart';
import 'package:contact_app/utility/di/injector_container.dart';
import 'package:contact_app/utility/exception/custom_exception.dart';
import 'package:contact_app/utility/network/network_interface.dart';

class MenuContactService {
  NetworkInterface networkInterface = InjectorContainer().getNetworkInterface();

  Future<List<ContactModel>> getContacts() async {
    return await networkInterface
        .requestGet(path: '/contact')
        .then((jsonResponse) {
      if (jsonResponse.code == 200) {
        return ContactModel.toList(jsonResponse.response);
      }
      throw UnexpectedErrorException();
    });
  }
}
