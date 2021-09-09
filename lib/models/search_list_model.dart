// To parse this JSON data, do
//
//     final search = searchFromMap(jsonString);

import 'dart:convert';

class Search {
  Search({
    this.search,
    this.totalResults,
    this.response,
  });

  List<SearchElement> search;
  String totalResults;
  String response;

  factory Search.fromJson(String str) => Search.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Search.fromMap(Map<String, dynamic> json) => Search(
    search: List<SearchElement>.from(json["Search"].map((x) => SearchElement.fromMap(x))),
    totalResults: json["totalResults"],
    response: json["Response"],
  );

  Map<String, dynamic> toMap() => {
    "Search": List<dynamic>.from(search.map((x) => x.toMap())),
    "totalResults": totalResults,
    "Response": response,
  };
}

class SearchElement {
  SearchElement({
    this.title,
    this.year,
    this.imdbId,
    this.type,
    this.poster,
  });

  String title;
  String year;
  String imdbId;
  Type type;
  String poster;

  factory SearchElement.fromJson(String str) => SearchElement.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory SearchElement.fromMap(Map<String, dynamic> json) => SearchElement(
    title: json["Title"],
    year: json["Year"],
    imdbId: json["imdbID"],
    type: typeValues.map[json["Type"]],
    poster: json["Poster"],
  );

  Map<String, dynamic> toMap() => {
    "Title": title,
    "Year": year,
    "imdbID": imdbId,
    "Type": typeValues.reverse[type],
    "Poster": poster,
  };
}

enum Type { MOVIE }

final typeValues = EnumValues({
  "movie": Type.MOVIE
});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
