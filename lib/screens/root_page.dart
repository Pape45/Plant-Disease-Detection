import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:plant_disease_detection/screens/HomePageFarmer.dart';
import 'package:plant_disease_detection/screens/profil.dart';
import 'package:plant_disease_detection/screens/ContactPhyto.dart';

class RootPage extends StatefulWidget {
  const RootPage({Key? key}) : super(key: key);

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  bool _showNotification = false;
  int _bottomNavIndex = 0;
  bool _isMenuOpen = false;

  List<Widget> Pages = const [
    HomePageFarmer(),
    ContactPhyto(),
    Profil(),
  ];

  List<IconData> iconList = [
    Icons.home,
    Icons.map,
    Icons.contacts_sharp,
    Icons.person,
  ];

  List<String> titleList = [
    'Home',
    'Ajouter un champ',
    'Contacts phytos',
    'Profile',
  ];
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            SizedBox(
              height: AppBar().preferredSize.height,
              width: AppBar().preferredSize.height,
              child: Image.asset('assets/logo2.jpg'),
            ),
            const SizedBox(width: 2),
            const Text('AgriFarm'),
          ],
        ),
        backgroundColor: Colors.white,
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 9.0),
            child: IconButton(
              icon: const Icon(Icons.notifications),
              tooltip: 'Notifications',
              onPressed: () {
                setState(() {});
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: IconButton(
              icon: Icon(_isMenuOpen ? Icons.close : Icons.menu),
              tooltip: 'Menu',
              onPressed: () {
                setState(() {
                  _isMenuOpen = !_isMenuOpen;
                });
              },
            ),
          ),
        ],
      ),
      body: IndexedStack(
        index: _bottomNavIndex,
        children: Pages,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.lightGreen[800],
        child: Image.asset('assets/logoPhoto.png', height: 30.0),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar(
        splashColor: Colors.lightGreen[800],
        activeColor: Colors.lightGreen[800],
        inactiveColor: Colors.black.withOpacity(.5),
        icons: iconList,
        activeIndex: _bottomNavIndex,
        gapLocation: GapLocation.center,
        notchSmoothness: NotchSmoothness.softEdge,
        onTap: (index) {
          setState(() {
            _bottomNavIndex = index;
          });
        },
      ),
    );
  }

  Widget _buildNotification() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        color: Colors.yellow,
        width: 200,
        height: 200,
        child: const Center(
          child: Text(
            'Vous avez une nouvelle notification!',
            style: TextStyle(fontSize: 18),
          ),
        ),
      ),
    );
  }
}
