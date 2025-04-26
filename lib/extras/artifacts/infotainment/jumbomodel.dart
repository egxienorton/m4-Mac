class JumbotronContent {
  final String type; // "fact", "joke", "quote", etc.
  final String content;

  JumbotronContent({required this.type, required this.content});

  factory JumbotronContent.fromJson(Map<String, dynamic> json) {
    return JumbotronContent(
      type: json['type'],
      content: json['content'],
    );
  }
}
