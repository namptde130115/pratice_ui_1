class WritingContent {
  int id;
  String title;
  String subtitle;
  String description;

  WritingContent.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        title = json['title'],
        subtitle = json['subtitle'],
        description = json['description'];
}
