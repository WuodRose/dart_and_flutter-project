
import 'package:mysql1/mysql1.dart';
import '../../config/database_config.dart';

class DatabaseService {
  static Future<MySqlConnection> getConnection() async {
    final settings = ConnectionSettings(
      host: DatabaseConfig.host,
      port: DatabaseConfig.port,
      user: DatabaseConfig.username,
      password: DatabaseConfig.password,
      db: DatabaseConfig.database,
    );
    
    return await MySqlConnection.connect(settings);
  }
}