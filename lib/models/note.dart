class Note {
  final int id;
  String title;
  String content;
  final DateTime createDate;

  Note({
    required this.id,
    required this.title,
    required this.content,
    required this.createDate,
  });

  factory Note.fromJson(Map<String, dynamic> map) {
    return Note(
      id: map['id'] as int,
      title: map['title'].toString(),
      content: map['content'].toString(),
      createDate: map['createDate'],
    );
  }
}
