import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:plant_disease_detection/components/authentication_button.dart';
import 'package:plant_disease_detection/components/custom_text_field.dart';
import 'package:plant_disease_detection/constants.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({Key? key}) : super(key: key);

  static String id = 'SignupScreen';

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(
        children: [
          Scaffold(
            body: SafeArea(
              child: SingleChildScrollView(
                child: Container(
                  margin: const EdgeInsets.only(top: 20.0), // Ajout de la marge en haut
                  constraints: BoxConstraints(
                    maxHeight: MediaQuery.of(context).size.height * 0.9,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'S\'inscrire',
                            style: GoogleFonts.poppins(
                              fontSize: 32.0,
                              fontWeight: FontWeight.w600,
                              color: kDarkGreenColor,
                            ),
                          ),
                          const SizedBox(height: 10.0),
                          Text(
                            'créer un nouveau compte',
                            style: GoogleFonts.poppins(
                              color: kGreyColor,
                              fontSize: 16.0,
                            ),
                          ),
                          const SizedBox(height: 40.0),
                          CustomTextField(
                            hintText: 'Nom complet',
                            icon: Icons.person,
                            keyboardType: TextInputType.name,
                            onChanged: (value) {},
                          ),
                          CustomTextField(
                            hintText: 'Email',
                            icon: Icons.mail,
                            keyboardType: TextInputType.name,
                            onChanged: (value) {},
                          ),
                          CustomTextField(
                            hintText: 'Login',
                            icon: Icons.person,
                            keyboardType: TextInputType.name,
                            onChanged: (value) {},
                          ),
                          CustomTextField(
                            hintText: 'Mot de passe',
                            icon: Icons.lock,
                            keyboardType: TextInputType.name,
                            onChanged: (value) {},
                          ),
                          CustomTextField(
                            hintText: 'Confirmer le mot de passe',
                            icon: Icons.lock,
                            keyboardType: TextInputType.name,
                            onChanged: (value) {},
                          ),
                          const SizedBox(height: 15.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'En s\'inscrivant, vous acceptez nos',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.w600,
                                  color: kDarkGreenColor,
                                ),
                              ),
                              Text(
                                ' conditions ',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.w600,
                                  color: kGreyColor,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'et ',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.w600,
                                  color: kDarkGreenColor,
                                ),
                              ),
                              Text(
                                ' avis de confidentialité',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.w600,
                                  color: kGreyColor,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                        child: AuthenticationButton(
                          label: 'S\'inscrire',
                          onPressed: () {},
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 30.0,
            left: 20.0,
            child: CircleAvatar(
              backgroundColor: Colors.grey.shade300,
              radius: 20.0,
              child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.arrow_back_ios_new,
                  color: kDarkGreenColor,
                  size: 24.0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
