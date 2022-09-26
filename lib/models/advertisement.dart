import 'dart:convert';

List<Advertisement> postFromJson(String str) => List<Advertisement>.from(
    json.decode(str).map((x) => Advertisement.fromJson(x)));

String postToJson(List<Advertisement> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Advertisement {
  final String id;
  final String name;
  final String description;
  // final String imageUrl;
  // final String createdAt;

  Advertisement({
    required this.id,
    required this.name,
    required this.description,
    // required this.imageUrl,
    // required this.createdAt,
  });

  factory Advertisement.fromJson(Map<String, dynamic> json) => Advertisement(
        id: json['id'],
        name: json['name'],
        description: json['description'],
        // imageUrl: json['image_url'],
        // createdAt: json['created_at'],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "id": id,
        "description": description,
        // "image_url": imageUrl,
        // "created_at": createdAt,
      };
}
