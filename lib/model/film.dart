import 'package:equatable/equatable.dart';

class FilmModel extends Equatable {
  const FilmModel({
    this.title,
    this.episodeId,
    this.openingCrawl,
    this.director,
    this.producer,
    this.releaseDate,
    this.characters,
    this.planets,
    this.starships,
    this.vehicles,
    this.species,
    this.created,
    this.edited,
    this.url,
  });

  final String? title;
  final int? episodeId;
  final String? openingCrawl;
  final String? director;
  final String? producer;
  final DateTime? releaseDate;
  final List<String>? characters;
  final List<String>? planets;
  final List<String>? starships;
  final List<String>? vehicles;
  final List<String>? species;
  final DateTime? created;
  final DateTime? edited;
  final String? url;

  factory FilmModel.fromJson(Map<String, dynamic> json) {
    var characters = json['characters'] as List;
    List<String> characterList = characters.map((i) => i as String).toList();
    var planets = json['planets'] as List;
    List<String> planetList = planets.map((i) => i as String).toList();
    var starships = json['starships'] as List;
    List<String> starshipList = starships.map((i) => i as String).toList();
    var vehicles = json['vehicles'] as List;
    List<String> vehicleList = vehicles.map((i) => i as String).toList();
    var species = json['species'] as List;
    List<String> speciesList = species.map((i) => i as String).toList();
    return FilmModel(
      title: json['title'],
      episodeId: json['episode_id'],
      openingCrawl: json['opening_crawl'],
      director: json['director'],
      producer: json['producer'],
      releaseDate: json['release_date'],
      characters: characterList,
      planets: planetList,
      starships: starshipList,
      vehicles: vehicleList,
      species: speciesList,
      created: json['created'],
      edited: json['edited'],
      url: json['url'],
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
        title,
        episodeId,
        openingCrawl,
        director,
        producer,
        releaseDate,
        characters,
        planets,
        starships,
        vehicles,
        species,
        created,
        edited,
        url,
      ];
}
