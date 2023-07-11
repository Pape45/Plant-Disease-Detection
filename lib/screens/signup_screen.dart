import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mysql1/mysql1.dart';
import 'package:plant_disease_detection/components/authentication_button.dart';
import 'package:plant_disease_detection/components/custom_text_field.dart';
import 'package:plant_disease_detection/constants.dart';
import 'package:plant_disease_detection/components/connection_bdd.dart';
import 'dart:math';

import 'login_screen.dart'; // Import de la page login_screen.dart

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  static String id = 'SignupScreen';

  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();
  late String _nomComplet;
  late String _email;
  late String _login;
  late String _motDePasse;
  late String _confirmationMotDePasse;

  void _registerUser() {
    if (_formKey.currentState!.validate()) {
      // Vérifier le format de l'email
      if (!_isEmailValid(_email)) {
        // Afficher une popup indiquant que l'email est invalide
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Email invalide'),
              content: Text(
                  'L\'adresse email $_email est invalide. Veuillez entrer une adresse email valide.'),
              actions: [
                TextButton(
                  child: Text('OK'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );
        return; // Arrêter l'exécution de la méthode si l'email est invalide
      }

      // Vérifier que les deux champs de mot de passe sont identiques
      if (_motDePasse != _confirmationMotDePasse) {
        // Afficher une popup indiquant que les mots de passe ne correspondent pas
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Mots de passe non identiques'),
              content: Text(
                  'Les mots de passe ne correspondent pas. Veuillez réessayer.'),
              actions: [
                TextButton(
                  child: Text('OK'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );
        return; // Arrêter l'exécution de la méthode si les mots de passe ne sont pas identiques
      }

      // Vérifier la duplication du login ou de l'email
      DBConnection.connect().then((_) {
        MySqlConnection connection = DBConnection.connection;

        // Vérifier la duplication du login
        connection.query(
          'SELECT * FROM Utilisateur WHERE login = ?',
          [_login],
        ).then((loginResults) {
          if (loginResults.isNotEmpty) {
            // Afficher une popup indiquant que le login est déjà utilisé
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text('Duplication du login'),
                  content: Text(
                      'Le login $_login est déjà utilisé. Veuillez réessayer avec un login différent.'),
                  actions: [
                    TextButton(
                      child: Text('OK'),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                );
              },
            );
          } else {
            // Vérifier la duplication de l'email
            connection.query(
              'SELECT * FROM Utilisateur WHERE mail = ?',
              [_email],
            ).then((emailResults) {
              if (emailResults.isNotEmpty) {
                // Afficher une popup indiquant que l'email est déjà utilisé
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Duplication de l\'email'),
                      content: Text(
                          'L\'email $_email est déjà utilisé. Veuillez réessayer avec une adresse email différente.'),
                      actions: [
                        TextButton(
                          child: Text('OK'),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    );
                  },
                );
              } else {
                // Génération d'un nombre aléatoire pour l'idEtudiant
                Random random = Random();
                int idEtudiant = random.nextInt(100000);

                // Insérer les données dans la base de données
                connection.query(
                  'INSERT INTO Utilisateur (idUtilisateur, nomComplet, mail, login, motDePasse) '
                  'VALUES (?, ?, ?, ?, ?)',
                  [idEtudiant, _nomComplet, _email, _login, _motDePasse],
                ).then((_) {
                  print('Données insérées avec succès.');

                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Inscription réussie'),
                        content: Text('Votre inscription a été réussie.'),
                        actions: [
                          TextButton(
                            child: Text('OK'),
                            onPressed: () {
                              Navigator.of(context).pop();
                              Navigator.pushReplacementNamed(
                                  context, LoginScreen.id);
                            },
                          ),
                        ],
                      );
                    },
                  );
                }).catchError((error) {
                  print('Erreur lors de l\'insertion des données : $error');
                  // Gérer l'erreur d'insertion des données
                });
              }
            });
          }
        });
      });
    }
  }

  bool _isEmailValid(String email) {
    final emailRegex =
        RegExp(r'^[\w-]+(\.[\w-]+)*@([a-zA-Z0-9-]+\.)+[a-zA-Z]{2,7}$');
    return emailRegex.hasMatch(email);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.only(top: 20.0),
            constraints: BoxConstraints(
              maxHeight: MediaQuery.of(context).size.height * 0.9,
            ),
            child: Form(
              key: _formKey,
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
                        onChanged: (value) {
                          _nomComplet = value;
                        },
                      ),
                      CustomTextField(
                        hintText: 'Email',
                        icon: Icons.mail,
                        keyboardType: TextInputType.name,
                        onChanged: (value) {
                          _email = value;
                        },
                      ),
                      CustomTextField(
                        hintText: 'Login',
                        icon: Icons.person,
                        keyboardType: TextInputType.name,
                        onChanged: (value) {
                          _login = value;
                        },
                      ),
                      CustomTextField(
                        hintText: 'Mot de passe',
                        icon: Icons.lock,
                        keyboardType: TextInputType.name,
                        onChanged: (value) {
                          _motDePasse = value;
                        },
                      ),
                      CustomTextField(
                        hintText: 'Confirmer le mot de passe',
                        icon: Icons.lock,
                        keyboardType: TextInputType.name,
                        onChanged: (value) {
                          _confirmationMotDePasse = value;
                        },
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
                      onPressed: _registerUser,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
