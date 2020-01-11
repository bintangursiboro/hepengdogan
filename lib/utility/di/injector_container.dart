import 'package:contact_app/utility/env/navigator_helper.dart';
import 'package:kiwi/kiwi.dart';

class InjectorContainer {
  void initDependencyInjection() {
    final Container container = Container();
    container.registerInstance(NavigationKeyHelper());
  }

  NavigationKeyHelper getNavigationKeyHelper() {
    final Container container = Container();

    return container.resolve<NavigationKeyHelper>();
  }
}
