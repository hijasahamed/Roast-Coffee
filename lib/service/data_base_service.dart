import 'package:intl/intl.dart';
import 'package:roast_coffee/model/product_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseService {
  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  // Initialize the database
  Future<Database> _initDatabase() async {
    final dbPath = await getDatabasesPath();
    return openDatabase(
      join(dbPath, 'cart.db'),
      onCreate: (db, version) async {
        await db.execute(''' 
          CREATE TABLE products (
            id INTEGER PRIMARY KEY,
            name TEXT,
            price TEXT,
            currency TEXT,
            makingTime TEXT,
            rating TEXT,
            ratingCount INTEGER,
            imageUrl TEXT,
            orderDateTime TEXT
          )
        ''');
      },
      version: 1,
    );
  }

  // Insert product into the database
  Future<void> addProduct(Product product) async {
    final db = await DatabaseService().database;
    final String currentDateTime = DateFormat('dd-MM-yyyy | hh:mm a').format(DateTime.now());
    await db.insert(
      'products',
      {
        'id': product.id,
        'name': product.name,
        'price': product.price,
        'currency': product.currency,
        'makingTime': product.makingTime,
        'rating': product.rating,
        'ratingCount': product.ratingCount,
        'imageUrl': product.imageUrl,
        'orderDateTime': currentDateTime,
      },
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  // Get all products from the database
  Future<List<Product>> getAllProducts() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('products');
    return List.generate(maps.length, (i) {
      final product = Product.fromJson(maps[i]);
      return product;
    });
  }

  // Check if the product exists by ID
  Future<bool> productExists(int id) async {
    final db = await database;
    final result = await db.query(
      'products',
      where: 'id = ?',
      whereArgs: [id],
    );
    return result.isNotEmpty;
  }
}