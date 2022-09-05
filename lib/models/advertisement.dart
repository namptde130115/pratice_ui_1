import 'package:flutter/material.dart';

class Advertisement {
  final int id;
  final String name;
  final String description;
  final String imageUrl;
  final String createdAt;

  Advertisement({
    required this.id,
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.createdAt,
  });

  factory Advertisement.fromJson(Map<String, dynamic> json) {
    return Advertisement(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      imageUrl: json['image_url'],
      createdAt: json['created_at'],
    );
  }
}
