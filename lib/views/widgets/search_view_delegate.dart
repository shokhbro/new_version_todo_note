import 'package:flutter/material.dart';
import 'package:todo_note_project/models/course.dart';
import 'package:todo_note_project/views/screens/cours_screen.dart';

class SearchViewDelegate extends SearchDelegate<Course> {
  final List<Course> courses;

  SearchViewDelegate(this.courses);

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: const Icon(Icons.clear),
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.pushReplacement(context, MaterialPageRoute(
          builder: (context) {
            return CourseScreen();
          },
        ));
      },
      icon: const Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final results =
        courses.where((course) => course.title.contains(query)).toList();

    return ListView.builder(
      itemCount: results.length,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          title: Text(results[index].title),
          subtitle: Text(results[index].description),
          onTap: () {
            close(context, results[index]);
          },
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionList = query.isEmpty
        ? courses
        : courses.where((course) => course.title.contains(query)).toList();

    return ListView.builder(
      itemCount: suggestionList.length,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          title: Text(suggestionList[index].title),
          subtitle: Text(suggestionList[index].description),
          onTap: () {
            close(context, suggestionList[index]);
          },
        );
      },
    );
  }
}
