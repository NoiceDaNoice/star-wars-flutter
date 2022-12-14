import 'dart:convert';
import 'package:starwars/model/species.dart';
import 'package:http/http.dart' as http;

class Api {
  Future<SpeciesModel> getSpecies({required int page}) async {
    final response =
        await http.get(Uri.parse('https://swapi.dev/api/species/?page=$page'));
    if (response.statusCode == 200) {
      return SpeciesModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Failed to load species");
    }
  }
   
}
