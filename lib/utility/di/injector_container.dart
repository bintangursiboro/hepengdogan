import 'package:contact_app/utility/env/navigator_helper.dart';
import 'package:contact_app/utility/network/network_interface.dart';
import 'package:kiwi/kiwi.dart';
import 'package:dio/dio.dart';

class InjectorContainer {
  void initDependencyInjection() {
    final Container container = Container();
    container.registerInstance(NavigationKeyHelper());

    //network
    container.registerInstance(Dio());
    container.registerFactory((c) => NetworkInterface(dio: c.resolve<Dio>()));
  }

  NavigationKeyHelper getNavigationKeyHelper() {
    final Container container = Container();

    return container.resolve<NavigationKeyHelper>();
  }

  Dio getDio() {
    final Container container = Container();
    return container.resolve<Dio>();
  }

  NetworkInterface getNetworkInterface() {
    final Container container = Container();
    return container.resolve<NetworkInterface>();
  }
}
