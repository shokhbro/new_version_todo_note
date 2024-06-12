import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_note_project/models/course.dart';
import 'package:todo_note_project/viewmodel.dart/course_view_model.dart';

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
    final courseViewModel =
        Provider.of<CourseViewModel>(context, listen: false);

    return Container(
      margin: const EdgeInsets.all(6),
      child: ListTile(
        contentPadding: const EdgeInsets.only(bottom: 10),
        leading: Container(
          height: 60,
          width: 55,
          decoration: BoxDecoration(
            color: Colors.amber,
            image: DecorationImage(
              image: NetworkImage(course.imageUrl),
              fit: BoxFit.cover,
            ),
          ),
        ),
        title: Text(course.title, overflow: TextOverflow.ellipsis),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              onPressed: () {
                _editCourse(context, course);
              },
              icon: const Icon(
                Icons.edit,
                color: Colors.black,
              ),
            ),
            IconButton(
              onPressed: () {
                courseViewModel.deleteCourse(course.id);
              },
              icon: const Icon(
                Icons.delete,
                color: Colors.red,
              ),
            ),
            IconButton(
              onPressed: () {
                toggleFavorite(course.id);
              },
              icon: Icon(
                isFavorite ? Icons.favorite : Icons.favorite_border,
                color: isFavorite ? Colors.red : null,
              ),
            ),
            IconButton(
              onPressed: () {
                courseViewModel.addToCart(course);
              },
              icon: const Icon(
                Icons.shopping_cart,
                color: Colors.green,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _editCourse(BuildContext context, Course course) {
    TextEditingController  _titleController =
        TextEditingController(text: course.title);
    TextEditingController _descriptionController =
        TextEditingController(text: course.description);
    TextEditingController _imageUrlController =
        TextEditingController(text: course.imageUrl);
    TextEditingController _priceController =
        TextEditingController(text: course.price.toString());

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Edit Course'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: _titleController,
                decoration: const InputDecoration(labelText: 'Title'),
              ),
              TextField(
                controller: _descriptionController,
                decoration: const InputDecoration(labelText: 'Description'),
              ),
              TextField(
                controller: _imageUrlController,
                decoration: const InputDecoration(labelText: 'Image URL'),
              ),
              TextField(
                controller: _priceController,
                decoration: const InputDecoration(labelText: 'Price'),
                keyboardType: TextInputType.number,
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                Course updatedCourse = Course(
                  id: course.id,
                  title: _titleController.text,
                  description: _descriptionController.text,
                  imageUrl: _imageUrlController.text,
                  lesson: course.lesson,
                  price: double.parse(_priceController.text),
                  isFavorite: course.isFavorite,
                );
                Provider.of<CourseViewModel>(context, listen: false)
                    .updateCourse(updatedCourse);
                Navigator.of(context).pop();
              },
              child: const Text('Save'),
            ),
          ],
        );
      },
    );
  }
}
