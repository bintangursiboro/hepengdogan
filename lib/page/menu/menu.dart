import 'package:contact_app/page/menu/menu_contact/menu_contact.dart';
import 'package:flutter/material.dart';

class Menu extends StatefulWidget {
  static const String PATH = '/menu';

  @override
  State<StatefulWidget> createState() {
    return _MenuState();
  }
}

class _MenuState extends State<Menu> {
  PageController _pageController = PageController(initialPage: 0);
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Uang Teman Mobile Challange'),
      ),
      body: PageView(
        children: <Widget>[
          MenuContact(),
          Container(),
        ],
        controller: _pageController,
        onPageChanged: (index) {
          changePage(index);
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        type: BottomNavigationBarType.shifting,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.perm_identity), title: Text('Contact')),
          BottomNavigationBarItem(
              icon: Icon(Icons.map), title: Text('Contact Map')),
        ],
        onTap: (index) {
          onClickBottomNav(index);
        },
      ),
    );
  }

  void onClickBottomNav(int index) {
    setState(() {
      selectedIndex = index;
      _pageController.animateToPage(index,
          curve: Curves.ease, duration: Duration(milliseconds: 500));
    });
  }

  void changePage(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }
}
