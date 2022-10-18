import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class SpeciesModel extends Equatable {
  const SpeciesModel({
    this.count,
    this.next,
    this.previous,
    this.results,
  });

  final int? count;
  final String? next;
  final String? previous;
  final List<SpeciesResult>? results;

  factory SpeciesModel.fromJson(Map<String, dynamic> json) {
    var list = json['results'] as List;
    List<SpeciesResult> speciesList =
        list.map((i) => SpeciesResult.fromJson(i)).toList();
    return SpeciesModel(
      count: json['count'],
      next: json['next'],
      previous: json['previous'],
      results: speciesList,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
        count,
        next,
        previous,
        results,
      ];
}
@immutable
class SpeciesResult extends Equatable {
  const SpeciesResult({
    this.name,
    this.classification,
    this.designation,
    this.averageHeight,
    this.skinColors,
    this.hairColors,
    this.eyeColors,
    this.averageLifespan,
    this.homeworld,
    this.language,
    this.people,
    this.films,
    this.created,
    this.edited,
    this.url,
  });

  final String? name;
  final String? classification;
  final String? designation;
  final String? averageHeight;
  final String? skinColors;
  final String? hairColors;
  final String? eyeColors;
  final String? averageLifespan;
  final String? homeworld;
  final String? language;
  final List<String>? people;
  final List<String>? films;
  final String? created;
 final  String? edited;
  final String? url;

  factory SpeciesResult.fromJson(Map<String, dynamic> json) {
    var people = json['people'] as List;
    List<String> listPeople = people.map((i) => i as String).toList();

    var film = json['films'] as List;
    List<String> listFilm = film.map((i) => i as String).toList();

    return SpeciesResult(
      name: json['name'],
      classification: json['classification'],
      designation: json['designation'],
      averageHeight: json['average_height'],
      skinColors: json['skin_colors'],
      hairColors: json['hair_colors'],
      eyeColors: json['eye_colors'],
      averageLifespan: json['average_lifespan'],
      homeworld: json['homeworld'],
      language: json['language'],
      people: listPeople,
      films: listFilm,
      created: json['created'],
      edited: json['edited'],
      url: json['url'],
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
        name,
        classification,
        designation,
        averageHeight,
        skinColors,
        hairColors,
        hairColors,
        eyeColors,
        averageHeight,
        homeworld,
        language,
        people,
        films,
        created,
        edited,
        url,
      ];
}
