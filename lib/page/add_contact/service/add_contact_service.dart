import 'package:contact_app/page/add_contact/model/contact_model.dart';
import 'package:contact_app/utility/di/injector_container.dart';
import 'package:contact_app/utility/network/network_interface.dart';

class AddContactService {
  NetworkInterface networkInterface = InjectorContainer().getNetworkInterface();
  final String path = 'contact';

  Future<void> saveContact({ContactModel contactModel}) async {
    await networkInterface.requestPost(
        path: path, parameter: ContactModel.toJson(contactModel));
  }
}
