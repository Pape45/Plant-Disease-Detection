import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mysql1/mysql1.dart';
import 'package:plant_disease_detection/components/authentication_button.dart';
import 'package:plant_disease_detection/components/custom_text_field.dart';
import 'package:plant_disease_detection/constants.dart';
import 'package:plant_disease_detection/screens/signup_screen.dart';
import 'package:plant_disease_detection/screens/root_page.dart';
import 'package:plant_disease_detection/screens/pages-phytopathologist.dart';
import 'forget_password_screen.dart';
import 'package:plant_disease_detection/components/connection_bdd.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  static const String id = 'LoginScreen';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool rememberMe = false;
  String username = '';
  String password = '';
  String dropdownValue = 'Utilisateur simple';

  @override
  void initState() {
    super.initState();
    DBConnection.connect();
  }

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
                onPressed: () {},
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
              body: SingleChildScrollView(
                child: Container(
                  constraints: BoxConstraints(
                    maxHeight: MediaQuery.of(context).size.height * 0.67,
                    maxWidth: MediaQuery.of(context).size.width,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      // First Column
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'As Salamu Aleykoum',
                            style: GoogleFonts.poppins(
                              fontSize: 32.0,
                              fontWeight: FontWeight.w600,
                              color: kDarkGreenColor,
                            ),
                          ),
                          Text(
                            'Connecte-toi',
                            style: GoogleFonts.poppins(
                              color: kGreyColor,
                              fontSize: 15.0,
                            ),
                          ),
                        ],
                      ),
                      // Second Column
                      Column(
                        children: [
                          CustomTextField(
                            hintText: 'Login ou Email',
                            icon: Icons.person,
                            keyboardType: TextInputType.name,
                            onChanged: (value) {
                              username = value != '' ? value : '';
                            },
                          ),
                          CustomTextField(
                            hintText: 'Mot de passe',
                            icon: Icons.lock,
                            obscureText: true,
                            keyboardType: TextInputType.visiblePassword,
                            onChanged: (value) {
                              password = value != '' ? value : '';
                            },
                          ),
                          Container(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 10.0),
                            decoration: BoxDecoration(
                              color: const Color(0xFFE5F0EA),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: DropdownButton<String>(
                              value: dropdownValue,
                              dropdownColor: const Color(0xFFE5F0EA),
                              style: GoogleFonts.poppins(
                                color: kDarkGreenColor,
                                fontSize: 15.0,
                                fontWeight: FontWeight.w600,
                              ),
                              items: <String>[
                                'Utilisateur simple',
                                'Agriculteur',
                                'Phytopathologiste',
                              ].map((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                              onChanged: (newValue) {
                                setState(() {
                                  dropdownValue = newValue!;
                                });
                              },
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Checkbox(
                                      checkColor: Colors.white,
                                      fillColor: MaterialStateProperty.all(
                                          kDarkGreenColor),
                                      value: rememberMe,
                                      onChanged: (value) {
                                        setState(() {
                                          rememberMe = value!;
                                        });
                                      },
                                    ),
                                    Text(
                                      'Se souvenir de moi',
                                      style: TextStyle(
                                        color: kGreyColor,
                                        fontSize: 14.0,
                                      ),
                                    ),
                                  ],
                                ),
                                TextButton(
                                  style: ButtonStyle(
                                    foregroundColor: MaterialStateProperty.all(
                                        kDarkGreenColor),
                                  ),
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const ForgetPasswordScreen(),
                                      ),
                                    );
                                  },
                                  child: const Text(
                                    'Mot de passe oublié ?',
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      // Third Column
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 20.0,
                          right: 20.0,
                          bottom: 20.0,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            AuthenticationButton(
                              label: 'Se connecter',
                              onPressed: () async {
                                MySqlConnection connection =
                                    DBConnection.connection;

                                // Vérification des informations de connexion dans la base de données
                                String query =
                                    'SELECT * FROM Utilisateur WHERE login = ? OR mail = ?';
                                var result = await connection
                                    .query(query, [username, username]);

                                if (result.isNotEmpty) {
                                  var user = result.first;
                                  String storedPassword = user['motDePasse'];
                                  String userType = dropdownValue;

                                  if (password == storedPassword) {
                                    if (userType == 'Utilisateur simple') {
                                      // Redirection vers la page pour l'utilisateur simple
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const RootPage(),
                                        ),
                                      );
                                    } else if (userType == 'Agriculteur') {
                                      // Vérification supplémentaire dans la table Agriculteur
                                      query =
                                          'SELECT * FROM Agriculteur WHERE idUtilisateur = ?';
                                      var agriculteurResult = await connection
                                          .query(
                                              query, [user['idUtilisateur']]);

                                      if (agriculteurResult.isNotEmpty) {
                                        // Redirection vers la page pour l'agriculteur
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => RootPage(),
                                          ),
                                        );
                                      } else {
                                        // Utilisateur sélectionné n'est pas un agriculteur
                                        showDialog(
                                          context: context,
                                          builder: (context) => AlertDialog(
                                            title: Text('Erreur'),
                                            content: Text(
                                                'L\'utilisateur sélectionné n\'est pas un agriculteur.'),
                                            actions: [
                                              TextButton(
                                                onPressed: () =>
                                                    Navigator.pop(context),
                                                child: Text('OK'),
                                              ),
                                            ],
                                          ),
                                        );
                                      }
                                    } else if (userType ==
                                        'Phytopathologiste') {
                                      // Vérification supplémentaire dans la table Phytopathologiste
                                      query =
                                          'SELECT * FROM Phytopathologiste WHERE idUtilisateur = ?';
                                      var phytopathologisteResult =
                                          await connection.query(
                                              query, [user['idUtilisateur']]);

                                      if (phytopathologisteResult.isNotEmpty) {
                                        // Redirection vers la page pour le phytopathologiste
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                const PhytopathologistHomePage(),
                                          ),
                                        );
                                      } else {
                                        // Utilisateur sélectionné n'est pas un phytopathologiste
                                        showDialog(
                                          context: context,
                                          builder: (context) => AlertDialog(
                                            title: Text('Erreur'),
                                            content: Text(
                                                'L\'utilisateur sélectionné n\'est pas un phytopathologiste.'),
                                            actions: [
                                              TextButton(
                                                onPressed: () =>
                                                    Navigator.pop(context),
                                                child: Text('OK'),
                                              ),
                                            ],
                                          ),
                                        );
                                      }
                                    }
                                  } else {
                                    // Mot de passe incorrect
                                    showDialog(
                                      context: context,
                                      builder: (context) => AlertDialog(
                                        title: Text('Erreur'),
                                        content:
                                            Text('Mot de passe incorrect.'),
                                        actions: [
                                          TextButton(
                                            onPressed: () =>
                                                Navigator.pop(context),
                                            child: Text('OK'),
                                          ),
                                        ],
                                      ),
                                    );
                                  }
                                } else {
                                  // Login ou email incorrect
                                  showDialog(
                                    context: context,
                                    builder: (context) => AlertDialog(
                                      title: Text('Erreur'),
                                      content:
                                          Text('Login ou e-mail incorrect.'),
                                      actions: [
                                        TextButton(
                                          onPressed: () =>
                                              Navigator.pop(context),
                                          child: Text('OK'),
                                        ),
                                      ],
                                    ),
                                  );
                                }
                              },
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 10.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text(
                                    'Tu n\'as pas de compte ?',
                                    style: TextStyle(fontSize: 14.0),
                                  ),
                                  TextButton(
                                    style: ButtonStyle(
                                      foregroundColor:
                                          MaterialStateProperty.all(
                                              kDarkGreenColor),
                                    ),
                                    onPressed: () {
                                      Navigator.pushNamed(
                                        context,
                                        SignupScreen.id,
                                      );
                                    },
                                    child: const Text(
                                      'S\'inscrire',
                                      style: TextStyle(fontSize: 14.0),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
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

class CurvePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    paint.color = kSpiritedGreen;
    paint.style = PaintingStyle.fill;

    var path = Path();

    path.moveTo(0, size.height * 0.70);

    path.quadraticBezierTo(
      size.width * 0.40,
      size.height * 0.80,
      size.width * 0.75,
      size.height * 0.60,
    );
    path.quadraticBezierTo(
      size.width * 0.95,
      size.height * 0.48,
      size.width,
      size.height * 0.32,
    );

    path.lineTo(size.width, 20);
    path.quadraticBezierTo(size.width, 0, size.width - 20, 0);
    path.lineTo(20, 0);
    path.quadraticBezierTo(0, 0, 0, 20);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CurvePainter oldDelegate) => false;

  @override
  bool shouldRebuildSemantics(CurvePainter oldDelegate) => false;
}
