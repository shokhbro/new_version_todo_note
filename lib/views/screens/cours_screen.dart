import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_note_project/models/course.dart';
import 'package:todo_note_project/models/lesson.dart';
import 'package:todo_note_project/viewmodel.dart/course_view_model.dart';
import 'package:todo_note_project/views/screens/cart_screen.dart';
import 'package:todo_note_project/views/screens/favorite_screen.dart';
import 'package:todo_note_project/views/screens/quiz_screen.dart';
import 'package:todo_note_project/views/widgets/course_list_item.dart';

class CoursScreen extends StatefulWidget {
  @override
  State<CoursScreen> createState() => _CoursScreenState();
}

class _CoursScreenState extends State<CoursScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget _buildCourseListItem(Course course, bool isFavorite) {
    return CourseListItem(
      course: course,
      isFavorite: isFavorite,
      toggleFavorite: (String courseId) {
        final courseViewModel =
            Provider.of<CourseViewModel>(context, listen: false);
        courseViewModel.toggleFavorite(courseId);
      },
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.amber,
        title: const Text(
          "Courses Screen",
          style: TextStyle(
            fontFamily: 'Lato',
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (ctx) {
                  final someLessonObject = Lesson(
                    id: '1',
                    courseld: '1',
                    title: 'Some Lesson',
                    description: 'Some Lesson Description',
                    videoUrl: 'https://www.example.com/video.mp4',
                    quizes: [],
                  );
                  return QuizScreen(lesson: someLessonObject);
                }),
              );
            },
            child: const Text("Quizes"),
          ),
        ],
      ),
      body: _selectedIndex == 2
          ? const FavoriteScreen()
          : _selectedIndex == 1
              ? const CartScreen()
              : Consumer<CourseViewModel>(
                  builder: (context, courseViewModel, child) {
                    return FutureBuilder<List<Course>>(
                      future: courseViewModel.fetchCourses(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                        if (snapshot.hasError) {
                          return Center(
                            child: Text(snapshot.error.toString()),
                          );
                        }
                        if (!snapshot.hasData || snapshot.data!.isEmpty) {
                          return const Center(
                            child: Text("Malumotlar topilmadi!"),
                          );
                        }

                        final courses = snapshot.data!;
                        return Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: ListView.builder(
                            itemCount: courses.length,
                            itemBuilder: (ctx, index) {
                              final course = courses[index];
                              return _buildCourseListItem(
                                course,
                                course.isFavorite,
                              );
                            },
                          ),
                        );
                      },
                    );
                  },
                ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorite',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        onTap: _onItemTapped,
      ),
    );
  }
}
