import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Phytopathologist App',
      theme: ThemeData(
        primaryColor: const Color(0xFF447E43),
        hintColor: const Color(0xFF4AC637),
      ),
      home: const PhytopathologistHomePage(),
    );
  }
}

class PhytopathologistHomePage extends StatelessWidget {
  const PhytopathologistHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Accueil Phytopathologiste'),
        backgroundColor: const Color(0xFF447E43),
        actions: [
          PopupMenuButton<String>(
            onSelected: (value) {
              // Gérer les options du menu
              if (value == 'settings') {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ProfileEditPage(),
                  ),
                );
              } else if (value == 'preferences') {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const PreferencesPage(),
                  ),
                );
              } else if (value == 'logout') {
                // Déconnecter l'utilisateur
                // ...
              }
            },
            itemBuilder: (BuildContext context) {
              return [
                const PopupMenuItem<String>(
                  value: 'preferences',
                  child: Text('Paramètres'),
                ),
                const PopupMenuItem<String>(
                  value: 'logout',
                  child: Text('Déconnexion'),
                ),
              ];
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 30),
            const CircleAvatar(
              radius: 120,
              backgroundImage: AssetImage(
                  "assets/image1.jpeg"), // Remplacez par le chemin de votre photo
            ),
            const SizedBox(height: 30),
            const Text(
              'Bienvenue',
              style: TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const PhytopathologistForumPage(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.green,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                padding: const EdgeInsets.symmetric(
                    horizontal: 16.0, vertical: 12.0),
              ),
              child: const Text(
                'Accéder au forum de discussion',
                style: TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const TaskListPage(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.green,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                padding: const EdgeInsets.symmetric(
                    horizontal: 16.0, vertical: 12.0),
              ),
              child: const Text(
                'Accéder à la liste de vos tâches',
                style: TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: 0,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text('Tâche $index'),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () {
                        // Supprimer la tâche
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PhytopathologistForumPage extends StatefulWidget {
  const PhytopathologistForumPage({Key? key}) : super(key: key);

  @override
  _PhytopathologistForumPageState createState() =>
      _PhytopathologistForumPageState();
}

class _PhytopathologistForumPageState extends State<PhytopathologistForumPage> {
  String newDiseaseDetails = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Forum de discussion'),
        backgroundColor: const Color(0xFF447E43),
        actions: [
          IconButton(
            icon: const Icon(Icons.add_alert),
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text('Alerte Nouvelle Maladie'),
                    content: TextField(
                      onChanged: (value) {
                        setState(() {
                          newDiseaseDetails = value;
                        });
                      },
                      decoration: const InputDecoration(
                        labelText: 'Détails de la maladie',
                      ),
                    ),
                    actions: [
                      TextButton(
                        onPressed: () {
                          // Traiter l'alerte d'une nouvelle maladie
                          if (newDiseaseDetails.isNotEmpty) {
                            // Afficher les détails de la nouvelle maladie dans le forum de discussion
                            Navigator.pop(context, newDiseaseDetails);
                          }
                        },
                        child: const Text('Valider'),
                      ),
                    ],
                  );
                },
              );
            },
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(8.0),
                topRight: Radius.circular(8.0),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.3),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            margin: const EdgeInsets.only(
              left: 16.0,
              right: 16.0,
              top: 16.0,
            ),
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Détails de la nouvelle maladie:',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  newDiseaseDetails,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          const Expanded(
            child: Center(
              child: Text(
                'Forum de discussion des phytopathologistes',
                style: TextStyle(fontSize: 20, color: Colors.grey),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TaskListPage extends StatefulWidget {
  const TaskListPage({Key? key}) : super(key: key);

  @override
  _TaskListPageState createState() => _TaskListPageState();
}

class _TaskListPageState extends State<TaskListPage> {
  List<String> tasks = []; // Liste des tâches

  String newTask = ''; // Nouvelle tâche saisie par l'utilisateur

  void addTask() {
    if (newTask.isNotEmpty) {
      setState(() {
        tasks.add(newTask); // Ajouter la nouvelle tâche à la liste des tâches
        newTask = ''; // Réinitialiser la variable de la nouvelle tâche
      });
    }
  }

  void deleteTask(int index) {
    setState(() {
      tasks.removeAt(index); // Supprimer la tâche de la liste des tâches
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Liste des tâches'),
        backgroundColor: const Color(0xFF447E43),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const PreferencesPage(),
                ),
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: tasks.length,
              itemBuilder: (context, index) {
                final task = tasks[index];
                return ListTile(
                  title: Text(task),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () {
                      deleteTask(index);
                    },
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 20),
          TextFormField(
            onChanged: (value) {
              setState(() {
                newTask =
                    value; // Mettre à jour la variable de la nouvelle tâche avec la saisie de l'utilisateur
              });
            },
            decoration: InputDecoration(
              labelText: 'Nouvelle tâche',
              suffixIcon: IconButton(
                icon: const Icon(Icons.add),
                onPressed: () {
                  addTask(); // Appeler la fonction pour ajouter la nouvelle tâche
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ProfileEditPage extends StatefulWidget {
  const ProfileEditPage({Key? key}) : super(key: key);

  @override
  _ProfileEditPageState createState() => _ProfileEditPageState();
}

class _ProfileEditPageState extends State<ProfileEditPage> {
  String username = '';
  String email = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Modifier le profil'),
        backgroundColor: const Color(0xFF447E43),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextFormField(
              onChanged: (value) {
                setState(() {
                  username = value;
                });
              },
              decoration: const InputDecoration(
                labelText: 'Nom d\'utilisateur',
              ),
            ),
            const SizedBox(height: 20),
            TextFormField(
              onChanged: (value) {
                setState(() {
                  email = value;
                });
              },
              decoration: const InputDecoration(
                labelText: 'Email',
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Enregistrer les modifications du profil
                // ...
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF4AC637),
              ),
              child: const Text('Enregistrer'),
            ),
          ],
        ),
      ),
    );
  }
}

class PreferencesPage extends StatefulWidget {
  const PreferencesPage({Key? key}) : super(key: key);

  @override
  _PreferencesPageState createState() => _PreferencesPageState();
}

class _PreferencesPageState extends State<PreferencesPage> {
  String selectedLanguage = 'Français';
  bool receiveNotifications = true;
  bool manageAccounts = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Paramètres'),
        backgroundColor: const Color(0xFF447E43),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Langue préférée:',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 10),
            DropdownButton<String>(
              value: selectedLanguage,
              onChanged: (String? newValue) {
                setState(() {
                  selectedLanguage = newValue!;
                });
              },
              items: <String>[
                'Français',
                'English',
                'Español',
                'Deutsch',
                'Italiano',
              ].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                const Text(
                  'Notifications:',
                  style: TextStyle(fontSize: 18),
                ),
                const SizedBox(width: 10),
                Switch(
                  value: receiveNotifications,
                  onChanged: (value) {
                    setState(() {
                      receiveNotifications = value;
                    });
                  },
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                const Text(
                  'Gérer les comptes:',
                  style: TextStyle(fontSize: 18),
                ),
                const SizedBox(width: 10),
                Switch(
                  value: manageAccounts,
                  onChanged: (value) {
                    setState(() {
                      manageAccounts = value;
                    });
                  },
                ),
              ],
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Enregistrer les préférences
                // ...
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF4AC637),
              ),
              child: const Text('Enregistrer'),
            ),
            const SizedBox(height: 20),
            if (manageAccounts)
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ProfileEditPage(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF4AC637),
                ),
                child: const Text('Modifier le profil'),
              ),
          ],
        ),
      ),
    );
  }
}
