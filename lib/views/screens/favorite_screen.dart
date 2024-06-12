import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_note_project/viewmodel.dart/course_view_model.dart';
import 'package:todo_note_project/views/widgets/course_list_item.dart';

class FavoriteScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<CourseViewModel>(
      builder: (context, courseViewModel, child) {
        return courseViewModel.favoriteCourses.isEmpty
            ? const Center(
                child: Text("No favorite courses!"),
              )
            : ListView.builder(
                itemCount: courseViewModel.favoriteCourses.length,
                itemBuilder: (context, index) {
                  final course = courseViewModel.favoriteCourses[index];
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
