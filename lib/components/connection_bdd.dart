import 'package:mysql1/mysql1.dart';

class DBConnection {
  static late MySqlConnection _connection;

  static Future<void> connect() async {
    final settings = ConnectionSettings(
      host: 'localhost',
      port: 3306,
      user: 'papi',
      password: 'passer',
      db: 'plant_disease_detection',
    );

    _connection = await MySqlConnection.connect(settings);
  }

  static MySqlConnection get connection => _connection;
}
