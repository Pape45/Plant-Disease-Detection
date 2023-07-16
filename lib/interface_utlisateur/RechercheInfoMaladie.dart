import 'package:flutter/material.dart';

class Accueil extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Accueil'),
      ),
      body: SingleChildScrollView(
        child: InfosMaladie(),
      ),
    );
  }
}

class InfosMaladie extends StatefulWidget {
  @override
  _InfosMaladieState createState() => _InfosMaladieState();
}

class _InfosMaladieState extends State<InfosMaladie> {
  String maladie = '';
  String description = '';

  void rechercherMaladie() {
    setState(() {
      if (maladie == 'Oïdium') {
        description =
            'Une indication courante de la maladie est l’apparition d’une croissance fongique blanche et poudreuse sur les feuilles, les tiges des panicules, les fleurs et les jeunes fruits. Le champignon attaque les jeunes tissus de toutes les sections de l’inflorescence, des feuilles et des fruits. Cette maladie peut provoquer la chute prématurée des fleurs et des fruits, ce qui réduit considérablement le rendement des cultures, voire empêche la formation de fruits. La propagation de la maladie est facilitée par des pluies ou des brouillards combinés à des températures nocturnes plus fraîches pendant la floraison.';
      } else if (maladie == 'Anthracnose') {
        description =
            'L’anthracnose est répandue et peut causer des dommages importants aux jeunes pousses, aux fleurs et aux fruits, en particulier dans les régions où l’humidité est élevée, les précipitations fréquentes et les températures comprises entre 24 et 32°C. La maladie peut également affecter les fruits stockés. Les symptômes de la maladie comprennent des taches sur les feuilles, des brûlures sur les fleurs, des pointes flétries, des brûlures sur les rameaux et des pourritures sur les fruits.';
      } else if (maladie == 'dépérissement') {
        description =
            'Le dépérissement est une maladie grave qui affecte les manguiers et qui est répandue dans la plupart des zones de culture. Les symptômes de la maladie peuvent être observés à n’importe quel moment de l’année, mais ils sont plus visibles pendant la floraison. La maladie provoque le dessèchement des rameaux et des branches, ce qui entraîne une défoliation complète et donne à l’arbre un aspect roussi. Le premier symptôme visible est la décoloration et l’assombrissement de l’écorce, qui progresse et provoque le flétrissement des jeunes rameaux verts, en commençant par la base et en s’étendant vers l’extérieur le long des nervures des bords des feuilles.';
      } else {
        description = 'Aucune information trouvée pour cette maladie.';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              onChanged: (value) {
                setState(() {
                  maladie = value;
                });
              },
              decoration: InputDecoration(
                labelText: 'Renseigner la maladie',
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: rechercherMaladie,
              child: Text('Rechercher'),
            ),
            SizedBox(height: 16.0),
            Visibility(
              visible: description.isNotEmpty,
              child: Column(
                children: [
                  if (maladie == 'Oïdium')
                    Column(
                      children: [
                        Image.asset('assets/images/plante_oidium.jpeg'),
                        SizedBox(height: 16.0), // Ajout de la marge
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.0),
                          child: Text(description),
                        ),
                      ],
                    )
                  else if (maladie == 'Anthracnose')
                    Column(
                      children: [
                        Image.asset('assets/images/plante_anthracnose.jpeg'),
                        SizedBox(height: 16.0), // Ajout de la marge
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.0),
                          child: Text(description),
                        ),
                      ],
                    )
                  else if (maladie == 'dépérissement')
                    Column(
                      children: [
                        Image.asset('assets/images/plante_deperissement.jpeg'),
                        SizedBox(height: 16.0), // Ajout de la marge
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.0),
                          child: Text(description),
                        ),
                      ],
                    )
                  else
                    Text(description),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
