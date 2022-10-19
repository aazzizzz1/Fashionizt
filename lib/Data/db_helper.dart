import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:fashionizt/Models/Cart.dart';

class DbHelper {
  static final DbHelper _instance = DbHelper._internal();
  static Database? _database;
  final String tableName = 'tableKeranjang';
  final String columnId = 'Id';
  final String columnNamaProduk = 'NamaProduk';
  final String columnHarga = 'Harga';
  final String columnGambar = 'Gambar';
  final String columnJumlah = 'Jumlah';
  final String columnStatus = 'Status';

  DbHelper._internal();
  factory DbHelper() => _instance;

  Future<Database?> get _db  async {
    if (_database != null) {
      return _database;
    }
    _database = await _initDb();
    return _database;
  }

  Future<Database?> _initDb() async {
    String databasePath = await getDatabasesPath();
    String path = join(databasePath, 'keranjang.db');

    return await openDatabase(path, version: 1, onCreate: _onCreate);
  }

  Future<void> _onCreate(Database db, int version) async {
    var sql = "CREATE TABLE $tableName($columnId INTEGER PRIMARY KEY, "
        "$columnNamaProduk TEXT,"
        "$columnHarga TEXT,"
        "$columnGambar TEXT,"
        "$columnStatus INTEGER,"
        "$columnJumlah INTEGER)";
    await db.execute(sql);
  }

  Future<int?> saveKeranjang(CartShop keranjang) async {
    var dbClient = await _db;
    return await dbClient!.insert(tableName, keranjang.toMap());
  }

  Future<List?> getAllKeranjang() async {
    var dbClient = await _db;
    var result = await dbClient!.query(tableName, columns: [
      columnId,
      columnNamaProduk,
      columnHarga,
      columnGambar,
      columnJumlah,
      columnStatus,
    ]);

    return result.toList();
  }
  Future<String?> jumlahKeranjang() async{
    var dbClient = await _db;
    String count = "SELECT count(*) FROM tableKeranjang";
    var result = await dbClient!.rawQuery(count);
    return result.toString();
  }

  Future<int?> updateKeranjang(CartShop keranjang) async {
    var dbClient = await _db;
    return await dbClient!.update(tableName, keranjang.toMap(), where: '$columnId = ?', whereArgs: [keranjang.id]);
  }

  Future<int?> deleteKeranjang(int id) async {
    var dbClient = await _db;
    return await dbClient!.delete(tableName, where: '$columnId = ?', whereArgs: [id]);
  }
}