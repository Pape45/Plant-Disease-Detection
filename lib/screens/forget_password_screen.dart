import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:plant_disease_detection/components/authentication_button.dart';
import 'package:plant_disease_detection/components/custom_text_field.dart';
import 'package:plant_disease_detection/constants.dart';
import 'package:flutter/services.dart';


class ForgetPasswordScreen extends StatelessWidget {
  static const String id = 'ForgetPasswordScreen';

  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(
        alignment: Alignment.bottomRight,
        fit: StackFit.expand,
        children: [
          // First Child in the stack
          ClipPath(
            clipper: ImageClipper(),
            child: Image.asset(
              'assets/leaves.jpg',
              alignment: Alignment.topCenter,
              fit: BoxFit.fitWidth,
            ),
          ),

          Positioned(
            top: 30.0,
            left: 20.0,
            child: CircleAvatar(
              backgroundColor: Colors.white,
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

          // Second Child in the stack
          Positioned(
            height: MediaQuery.of(context).size.height * 0.67,
            width: MediaQuery.of(context).size.width,
            child: Scaffold(
              backgroundColor: Colors.transparent,
              body: SingleChildScrollView(
                child: Container(
                  constraints: BoxConstraints(
                    maxHeight: MediaQuery.of(context).size.height * 0.67,
                    maxWidth: MediaQuery.of(context).size.width,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Mot de passe oublié',
                            style: GoogleFonts.poppins(
                              fontSize: 32.0,
                              fontWeight: FontWeight.w600,
                              color: kDarkGreenColor,
                            ),
                          ),
                          Text(
                            'Entrez votre adresse e-mail pour réinitialiser votre mot de passe',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.poppins(
                              color: kGreyColor,
                              fontSize: 15.0,
                            ),
                          ),
                        ],
                      ),

                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30.0),
                        child: Column(
                          children: [
                            CustomTextField(
                              hintText: 'Adresse e-mail',
                              icon: Icons.email,
                              keyboardType: TextInputType.emailAddress,
                              onChanged: (value) {
                                // Do something with the email value
                              },
                            ),
                          ],
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 40.0),
                        child: AuthenticationButton(
                          label: '     Réinitialiser     ',
                          onPressed: () {
                            // Implement the logic to request password reset
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CurveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();

    path.lineTo(0, size.height * 0.30);

    path.quadraticBezierTo(
      size.width * 0.25,
      size.height * 0.36,
      size.width * 0.70,
      size.height * 0.30,
    );
    path.lineTo(size.width, size.height * 0.25);

    path.lineTo(size.width, 0);
    path.lineTo(0, 0);

    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class ImageClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();

    path.lineTo(0, size.height * 0.30);

    path.quadraticBezierTo(
      size.width * 0.25,
      size.height * 0.36,
      size.width * 0.70,
      size.height * 0.30,
    );
    path.lineTo(size.width, size.height * 0.25);

    path.lineTo(size.width, 0);
    path.lineTo(0, 0);

    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}