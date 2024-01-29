import 'package:json_annotation/json_annotation.dart';
part 'movie_model.g.dart';

@JsonSerializable()
class HomeResponse {
  int? page;
  @JsonKey(name: "total_pages")
  int? totalPages;
  List<MovieData>? results;
  HomeResponse({this.page, this.totalPages, this.results});

  factory HomeResponse.fromJson(Map<String, dynamic> json) =>
      _$HomeResponseFromJson(json);
}

@JsonSerializable()
class MovieData {
  @JsonKey(name: "backdrop_path")
  String? imageUrl;
  bool? adult;
  int? id;
  String? title;
  String? overview;
  @JsonKey(name: "media_type")
  String? mediaType;
  @JsonKey(name: "release_date")
  String? releaseDate;
  @JsonKey(name: "vote_count")
  int? voteCount;
  @JsonKey(name: "vote_average")
  double? voteAverage;
  @JsonKey(name: "original_language")
  String? language;

  MovieData(
      {this.imageUrl,
      this.adult,
      this.id,
      this.title,
      this.overview,
      this.mediaType,
      this.releaseDate,
      this.voteAverage,
      this.voteCount,
      this.language});

  factory MovieData.fromJson(Map<String, dynamic> json) =>
      _$MovieDataFromJson(json);

  MovieData.fromMap(Map<String, Object?> map) {
    imageUrl = map['imageUrl'] as String;
    adult = map['adult'] == 1;
    id = map['id'] as int;
    title = map['title'] as String;
    overview = map['overview'] as String;
    mediaType = map['mediaType'] as String;
    releaseDate = map['releaseDate'] as String;
    voteAverage = (map['voteAverage'] as num?)?.toDouble();
    voteCount = map['voteCount'] as int;
    language = map['language'] as String;
  }

  Map<String, Object?> toMap(MovieData movie) => <String, Object?>{
        'imageUrl': movie.imageUrl,
        'adult': (movie.adult == true) ? 1 : 0,
        'id': movie.id,
        'title': movie.title,
        'overview': movie.overview,
        'mediaType': movie.mediaType,
        'releaseDate': movie.releaseDate,
        'voteCount': movie.voteCount,
        'voteAverage': movie.voteAverage,
        'language': movie.language
      };
}
