import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_note_project/viewmodel.dart/course_view_model.dart';
import 'package:todo_note_project/views/widgets/course_list_item.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<CourseViewModel>(
      builder: (context, courseViewModel, child) {
        return courseViewModel.cartCourses.isEmpty
            ? const Center(
                child: Text("No items in cart!"),
              )
            : ListView.builder(
                itemCount: courseViewModel.cartCourses.length,
                itemBuilder: (context, index) {
                  final course = courseViewModel.cartCourses[index];
                  return CourseListItem(
                    course: course,
                    isFavorite: course.isFavorite,
                    toggleFavorite: courseViewModel.toggleFavorite,
                  );
                },
              );
      },
    );
  }
}
