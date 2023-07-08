import 'package:flutter/material.dart';
import 'package:plant_disease_detection/widgets/Profile_widget.dart';

class Profil extends StatefulWidget {
  const Profil({Key? key}) : super(key: key);

  @override
  State<Profil> createState() => _ProfilState();
}

class _ProfilState extends State<Profil> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16),
          height: size.height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 150,
                child: const CircleAvatar(
                  radius: 60,
                  backgroundColor: Colors.transparent,
                  backgroundImage: ExactAssetImage('assets/logo2.jpg'),
                ),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.grey.shade300,
                    width: 5.0,
                  ),
                ),
              ),
              SizedBox(
                width: size.width * .3,
                child: const Row(
                  children: [
                    Text(
                      'Aliou Cisse',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(
                      height: 24.0,
                    ),
                  ],
                ),
              ),
              const Text(
                'alioucisse@gmail.com',
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
              const SizedBox(
                height: 30.0,
              ),
              SizedBox(
                height: size.height * .7,
                width: size.width,
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ProfileWidget(
                      icon: Icons.person,
                      title: 'Mon profile',
                    ),
                    ProfileWidget(
                      icon: Icons.settings,
                      title: 'Parametres',
                    ),
                    ProfileWidget(
                      icon: Icons.notifications,
                      title: 'Notifications',
                    ),
                    ProfileWidget(
                      icon: Icons.chat,
                      title: 'FAQs',
                    ),
                    ProfileWidget(
                      icon: Icons.share,
                      title: 'Partager',
                    ),
                    ProfileWidget(
                      icon: Icons.logout,
                      title: 'Deconnexion',
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
