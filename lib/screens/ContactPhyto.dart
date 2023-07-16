import 'package:flutter/material.dart';

class ContactPhyto extends StatefulWidget {
  const ContactPhyto({Key? key}) : super(key: key);

  @override
  State<ContactPhyto> createState() => _ContactPhytoState();
}

class _ContactPhytoState extends State<ContactPhyto> {
  final List<Map<String, String>> contacts = [
    {
      'name': 'John Doe',
      'photoUrl': 'assets/avatar.jpeg',
      'phoneNumber': '+1234567890',
      'email': 'john.doe@example.com',
    },
    {
      'name': 'Ndella',
      'photoUrl': 'assets/avatar1.jpg',
      'phoneNumber': '+0987654321',
      'email': 'ndella@gmail.com',
    },
    {
      'name': 'Coumba Bocar Kane',
      'photoUrl': 'assets/avatar4.jpeg',
      'phoneNumber': '+0987654321',
      'email': 'coumba@gmail.com',
    },
    {
      'name': 'Aicha Victor',
      'photoUrl': 'assets/avatar3.jpeg',
      'phoneNumber': '+0987654321',
      'email': 'victor@gmail.com',
    },
    {
      'name': 'Pape Diagne',
      'photoUrl': 'assets/avatar2.jpeg',
      'phoneNumber': '+0987654321',
      'email': 'papiiaaa@gmail.com',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contacts de nos phytopathologistes'),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 16.0), // Ajoutez la marge souhaitée ici
        child: ListView.builder(
          itemCount: contacts.length,
          itemBuilder: (BuildContext context, int index) {
            final contact = contacts[index];
            return ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage(contact['photoUrl']!),
              ),
              title: Text(contact['name']!),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Numéro de téléphone: ${contact['phoneNumber']}'),
                  Text('Email: ${contact['email']}'),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
