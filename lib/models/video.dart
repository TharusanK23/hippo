class VideoResult {
  VideoResult({
    this.search,
    this.totalResults,
    this.response,
  });

  List<Video>? search;
  String? totalResults, response;

  factory VideoResult.fromJson(Map<String, dynamic> json) => VideoResult(
        search: json["Search"] != null ? List<Video>.from(json["Search"].map((x) => Video.fromJson(x))) : [],
        totalResults: json["totalResults"],
        response: json["Response"],
      );

  Map<String, dynamic> toJson() => {
        "Search": List<dynamic>.from(search!.map((x) => x.toJson())),
        "totalResults": totalResults,
        "Response": response,
      };
}

class Video {
  Video({
    this.title,
    this.year,
    this.imdbId,
    this.type,
    this.poster,
    this.isLiked = false,
  });

  String? title, year, imdbId, type, poster;
  bool? isLiked;

  factory Video.fromJson(Map<String, dynamic> json) => Video(
        title: json["Title"],
        year: json["Year"],
        imdbId: json["imdbID"],
        type: json["Type"],
        poster: json["Poster"],
      );

  Map<String, dynamic> toJson() => {
        "Title": title,
        "Year": year,
        "imdbID": imdbId,
        "Type": type,
        "Poster": poster,
      };
}

class SingleVideo {
  SingleVideo({
    this.title,
    this.year,
    this.rated,
    this.released,
    this.runtime,
    this.genre,
    this.director,
    this.writer,
    this.actors,
    this.plot,
    this.language,
    this.country,
    this.awards,
    this.poster,
    this.ratings,
    this.metascore,
    this.imdbRating,
    this.imdbVotes,
    this.imdbId,
    this.type,
    this.dvd,
    this.boxOffice,
    this.production,
    this.website,
    this.response,
  });

  String? title, year, rated, released, runtime, genre, director, writer, actors, plot, language, country, awards, poster, metascore, imdbRating, imdbVotes, imdbId, type, dvd, boxOffice, production, website, response;
  List<Rating>? ratings;

  factory SingleVideo.fromJson(Map<String, dynamic> json) => SingleVideo(
        title: json["Title"],
        year: json["Year"],
        rated: json["Rated"],
        released: json["Released"],
        runtime: json["Runtime"],
        genre: json["Genre"],
        director: json["Director"],
        writer: json["Writer"],
        actors: json["Actors"],
        plot: json["Plot"],
        language: json["Language"],
        country: json["Country"],
        awards: json["Awards"],
        poster: json["Poster"],
        ratings: json["Ratings"] != null ? List<Rating>.from(json["Ratings"].map((x) => Rating.fromJson(x))) : [],
        metascore: json["Metascore"],
        imdbRating: json["imdbRating"],
        imdbVotes: json["imdbVotes"],
        imdbId: json["imdbID"],
        type: json["Type"],
        dvd: json["DVD"],
        boxOffice: json["BoxOffice"],
        production: json["Production"],
        website: json["Website"],
        response: json["Response"],
      );

  Map<String, dynamic> toJson() => {
        "Title": title,
        "Year": year,
        "Rated": rated,
        "Released": released,
        "Runtime": runtime,
        "Genre": genre,
        "Director": director,
        "Writer": writer,
        "Actors": actors,
        "Plot": plot,
        "Language": language,
        "Country": country,
        "Awards": awards,
        "Poster": poster,
        "Ratings": List<dynamic>.from(ratings!.map((x) => x.toJson())),
        "Metascore": metascore,
        "imdbRating": imdbRating,
        "imdbVotes": imdbVotes,
        "imdbID": imdbId,
        "Type": type,
        "DVD": dvd,
        "BoxOffice": boxOffice,
        "Production": production,
        "Website": website,
        "Response": response,
      };
}

class Rating {
  Rating({
    this.source,
    this.value,
  });

  String? source, value;

  factory Rating.fromJson(Map<String, dynamic> json) => Rating(
        source: json["Source"],
        value: json["Value"],
      );

  Map<String, dynamic> toJson() => {
        "Source": source,
        "Value": value,
      };
}
