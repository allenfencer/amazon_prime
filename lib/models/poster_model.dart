class Poster{
  String title;
  String year;
  String rated;
  String release;
  String genre;
  String director;
  String actors;
  String writers;
  String plot;
  String language;
  String country;
  String poster;
  double imdb_rating;
  String type;
  int total_seasons;
  List <Ratings> rating;

  Poster({this.title,this.year,this.rated,this.release,this.genre,this.director,this.actors,this.writers,this.plot,this.language,this.country,this.poster,this.imdb_rating,this.total_seasons,this.type,this.rating});

  factory Poster.fromJson(Map<String,dynamic>json){
    var parsed_rating= json['Ratings'] as List;
    List <Ratings> rating_list= parsed_rating.map((e) => Ratings.fromJson(e)).toList();
    return Poster(
      title: json['Title'],
      year:  json['Year'],
      rated: json['Rated'],
      release: json['Released'],
      genre: json['Genre'],
      director: json['Director'],
      actors: json['Actors'],
      writers: json['Writers'],
      plot: json['Plot'],
      language: json['Language'],
      country: json['Country'],
      poster: json['Poster'],
      imdb_rating: json['imdbRating'],
      total_seasons: json['totalSeasons'] as int,
      type: json['Type'],
      rating: rating_list,
    );
  }
}

class Ratings{
  String source;
  String value;

  Ratings({this.value,this.source});
  factory Ratings.fromJson(Map<String,dynamic>jsonR){
    return Ratings(
      source: jsonR['Source'],
      value: jsonR['Value'],
    );
  }
}