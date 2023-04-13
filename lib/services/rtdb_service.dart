import 'dart:convert';

import 'package:children_health/models/place_model.dart';
import 'package:firebase_database/firebase_database.dart';

class RTDBService {
  static final database = FirebaseDatabase.instance.ref();

  static Future<Stream<DatabaseEvent>> addPost(PlaceModel placeModel) async {
    database.child('placeModel').push().set(placeModel.toJson());
    return database.onChildAdded;
  }

  static Future<List<PlaceModel>> getPosts() async {
    List<PlaceModel> list = [];
    Query query = database.ref.child('placeModel');
    DatabaseEvent event = await query.once();
    var snapshot = event.snapshot;
    for (var child in snapshot.children) {
      var jsonPlaceModel = jsonEncode(child.value);
      Map<String, dynamic> map = jsonDecode(jsonPlaceModel);
      var placeModel = PlaceModel.from(map);
      list.add(placeModel);
    }
    return list;
  }
}
