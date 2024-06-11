import 'package:flutter/material.dart';
import 'package:todo_note_project/models/course.dart';
import 'package:todo_note_project/viewmodel.dart/course_view_model.dart';

class AdminPanelViewModel extends ChangeNotifier {
  final CourseViewModel _courseViewModel;

  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController imageUrlController = TextEditingController();
  TextEditingController priceController = TextEditingController();

  AdminPanelViewModel(this._courseViewModel);

  void addCourse() {
    final course = Course(
      id: '',
      title: titleController.text,
      description: descriptionController.text,
      imageUrl: imageUrlController.text,
      lesson: [],
      price: double.parse(priceController.text),
      isFavorite: true,
    );
  }

  void clearControllers() {
    titleController.clear();
    descriptionController.clear();
    imageUrlController.clear();
    priceController.clear();
  }
}
