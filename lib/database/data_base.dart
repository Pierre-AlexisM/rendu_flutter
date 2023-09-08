import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../model/user.dart';

class DatabaseHelper {
  static final _databaseName = 'my_database.db';
  static final _databaseVersion = 1;

  // Nom de la table et des colonnes
  static final tableUser = 'user';
  static final columnID = 'id';
  static final columnName = 'name';
  static final columnPassword = 'password';

  // Singleton pour assurer une seule instance de la base de données
  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  // Instance de la base de données
  static Database? _database;

  Future<Database?> get database async {
    if (_database != null) return _database;

    _database = await _initDatabase();
    return _database;
  }

  // Initialisation de la base de données
  _initDatabase() async {
    final path = join(await getDatabasesPath(), _databaseName);
    return await openDatabase(path, version: _databaseVersion, onCreate: _onCreate);
  }

  // Création de la table utilisateur lors de la première exécution
  Future _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE $tableUser (
        $columnID INTEGER PRIMARY KEY,
        $columnName TEXT NOT NULL,
        $columnPassword TEXT NOT NULL
      )
    ''');
  }

  // Insertion d'un utilisateur
  Future<int> insertUser(User user) async {
    final db = await database;
    return await db!.insert(tableUser, user.toMap());
  }
}