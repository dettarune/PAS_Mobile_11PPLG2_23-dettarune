import 'package:pas_mobile_11pplg2_23/models/tv_show_list_model.dart';

class BookmarkModel {
  final String title;
  final Language language;
  final double? rating;
  final String image;

  BookmarkModel({
    required this.title,
    required this.language,
    required this.rating,
    required this.image,
  });

  Map<String, dynamic> toJson() {
    return {
      "title": title,
      "language": language,
      "rating": rating,
      "image": image,
    };
  }

  factory BookmarkModel.fromJson(Map<String, dynamic> json) {
    return BookmarkModel(
      title: json["title"],
      language: json["language"],
      rating: json["rating"],
      image: json["image"],
    );
  }
}
