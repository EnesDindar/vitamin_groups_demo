class vitamin {
  String title;
  String photo;
  String goodSources;
  String content;
  vitamin({
    required this.title,
    required this.photo,
    required this.goodSources,
    required this.content,
  });
  factory vitamin.fromJson(Map<String, dynamic> json) => vitamin(
        title: json['title'],
        photo: json['photo'],
        goodSources: json['goodSources'],
        content: json['content'],
      );
}
