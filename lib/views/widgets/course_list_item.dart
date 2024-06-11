import 'package:flutter/material.dart';
import 'package:todo_note_project/models/course.dart';

class CourseListItem extends StatelessWidget {
  final Course course;
  final bool isFavorite;
  final Function(String) toggleFavorite;

  const CourseListItem({
    required this.course,
    required this.isFavorite,
    required this.toggleFavorite,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(6),
      child: ListTile(
        contentPadding: const EdgeInsets.only(bottom: 10),
        leading: Image.network(
          course.imageUrl,
          fit: BoxFit.cover,
        ),
        title: Text(course.title),
        subtitle: Text(course.description),
        trailing: IconButton(
          onPressed: () {
            toggleFavorite(
                course.id); // Pass the course ID to toggleFavorite function
          },
          icon: Icon(
            isFavorite ? Icons.favorite : Icons.favorite_border,
            color: isFavorite ? Colors.red : null,
          ),
        ),
      ),
    );
  }
}
