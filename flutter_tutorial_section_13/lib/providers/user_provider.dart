import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_tutorial_section_13/model/place.dart';
import 'package:path_provider/path_provider.dart' as syspaths;
import 'package:path/path.dart' as path;
import 'package:sqflite/sqflite.dart' as sql;
import 'package:sqflite/sqlite_api.dart';

Future<Database> _getDatabase() async {
  final dbPath = await sql.getDatabasesPath();
  return sql.openDatabase(path.join(dbPath, 'places.db'), onCreate: (db, version) {
    return db.execute('CREATE TABLE user_places(id TEXT PRIMARY KEY, title TEXT, image TEXT, lat REAL, lng REAL, address TEXT)');
  }, version: 1);
}


class UserPlacesNotifier extends StateNotifier<List<Place>>{
  UserPlacesNotifier() :super(const []);

  Future<void> loadPlaces() async {
    state = [];

    final db = await _getDatabase();

    final data = await db.query('user_places');
    final places = data.map((row){
      return Place(
        id: row['id'] as String,
        title: row['title'] as String,
        image: File(row['image'] as String),
        location: PlaceLocation(
          latitude: row['lat'] as double,
          longitude: row['lng'] as double,
          address: row['address'] as String
        )
      );
    }).toList();

    state = places;
  }

  void addPlace(String title, File image, PlaceLocation location) async {
    final appDir = await syspaths.getApplicationDocumentsDirectory();
    final fileName = path.basename(image.path);
    image.copy('${appDir.path}/$fileName');
    final copiedImage = await image.copy('${appDir.path}/$fileName');

    final newPlace = Place(
      title: title,
      image: copiedImage,
      location: location
    );


    final dbPath = await sql.getDatabasesPath();

    final db = await _getDatabase();

    await db.insert('user_places', {
      'id': newPlace.id,
      'title': title,
      'image': copiedImage.path,
      'lat': location.latitude,
      'lng': location.longitude,
      'address': location.address
    });

    state = [...state, newPlace];
  }

  void removePlace(String id){
    state = state.where((place) => place.id != id).toList();
  }
  
}

final userPlacesProvider = StateNotifierProvider<UserPlacesNotifier, List<Place>>(
  (ref) => UserPlacesNotifier()
);