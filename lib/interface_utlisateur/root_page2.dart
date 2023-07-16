import 'package:flutter/material.dart';
import 'package:plant_disease_detection/interface_utlisateur/home_user.dart';
import 'profil_user.dart';
import 'RechercheInfoMaladie.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class RootPage2 extends StatefulWidget {
  const RootPage2({Key? key}) : super(key: key);

  @override
  State<RootPage2> createState() => _RootPage2State();
}

class _RootPage2State extends State<RootPage2> {
  final bool _showNotification = false;
  int _bottomNavIndex = 0;
  bool _isMenuOpen = false;

  List<Widget> pages = [
    HomePageFarmer(),
    Profil(),
    Accueil(),
  ];

  List<IconData> iconList = [
    Icons.home,
    Icons.person,
    Icons.search
  ];

  List<String> titleList = [
    'Home',
    'Profile',
    'Infos Maladie'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            SizedBox(
              height: AppBar().preferredSize.height,
              width: AppBar().preferredSize.height,
              child: Image.asset('assets/images/logo2.jpg'),
            ),
            const SizedBox(width: 2),
            const Text('AgriFarm'),
          ],
        ),
        backgroundColor: Colors.transparent,
        elevation: 4,
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
        children: pages,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _openCamera();
        },
        backgroundColor: Colors.lightGreen[800],
        child: Image.asset('assets/images/logoPhoto.png', height: 30.0),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.lightGreen[800],
        unselectedItemColor: Colors.black.withOpacity(.5),
        currentIndex: _bottomNavIndex,
        onTap: (index) {
          setState(() {
            _bottomNavIndex = index;
          });
        },
        items: [
          // Home
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),

          // Profile
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),

          // Rechercher maladie
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Rechercher maladie',
          ),

          // Historique Diagnostic
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: 'Historique Diagnostic',
          ),
        ],
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

  Future<void> _openCamera() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      File imageFile = File(pickedFile.path);
      // Use the imageFile for further operations, such as displaying or uploading the image.
    }
  }
}

void main() {
  runApp(const MaterialApp(
    home: RootPage2(),
  ));
}
