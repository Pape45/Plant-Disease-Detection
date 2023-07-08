import 'package:flutter/material.dart';

class ContactPhyto extends StatefulWidget {
  const ContactPhyto({Key? key}) : super(key: key);

  @override
  State<ContactPhyto> createState() => _ContactPhytoState();
}

class _ContactPhytoState extends State<ContactPhyto> {
  @override
  Widget build(BuildContext context) {
    final List<Contact> contacts = [
      Contact(
        name: 'John Doe',
        photoUrl: 'assets/avatar.png',
        phoneNumber: '+1234567890',
        email: 'john.doe@example.com',
      ),
      Contact(
        name: 'Ndella',
        photoUrl: 'assets/avatar1.jpg',
        phoneNumber: '+0987654321',
        email: 'ndella@gmail.com',
      ),
      Contact(
        name: 'Coumba Bocar Kane',
        photoUrl: 'assets/avatar4.png',
        phoneNumber: '+0987654321',
        email: 'coumba@gmail.com',
      ),
      Contact(
        name: 'Aicha Victor',
        photoUrl: 'assets/avatar3.png',
        phoneNumber: '+0987654321',
        email: 'victor@gmail.com',
      ),
      Contact(
        name: 'Pape Diagne',
        photoUrl: 'assets/avatar2.png',
        phoneNumber: '+0987654321',
        email: 'papiiaaa@gmail.com',
      ),
    ];
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contacts de nos phytopathologistes'),
      ),
      body: ListView.builder(
        itemCount: contacts.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(contacts[index].photoUrl),
            ),
            title: Text(contacts[index].name),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Numéro de téléphone: ${contacts[index].phoneNumber}'),
                Text('Email: ${contacts[index].email}'),
              ],
            ),
          );
        },
      ),
    );
  }
}

class Contact {
  final String name;
  final String photoUrl;
  final String phoneNumber;
  final String email;

  Contact({
    required this.name,
    required this.photoUrl,
    required this.phoneNumber,
    required this.email,
  });
}
