class SearchModel{
  List <Search> search;

  SearchModel({this.search});

  factory SearchModel.fromJson(Map<String,dynamic>json){
    var parsedjson= json['Search'] as List;
    List searchResults = parsedjson.map((e) => Search.fromJson(e)).toList();
    return SearchModel(
      search: searchResults,
    );
  }
}

class Search{
  String title;
  String year;
  String imdbID;
  String type;
  String poster;

  Search({this.title,this.year,this.imdbID,this.type,this.poster});

  factory Search.fromJson(Map<String,dynamic> json){
    return Search(
      title: json['Title'],
      year: json['Year'],
      imdbID: json['imdbID'],
      type: json['Type'],
      poster: json['Poster'],
    );
  }
}