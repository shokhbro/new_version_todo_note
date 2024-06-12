import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_note_project/viewmodel.dart/course_view_model.dart';
import 'package:todo_note_project/views/widgets/course_list_item.dart';
import 'package:todo_note_project/views/widgets/search_view_delegate.dart';
import 'package:todo_note_project/views/screens/cart_screen.dart';
import 'package:todo_note_project/views/screens/favorite_screen.dart';

class CourseScreen extends StatefulWidget {
  @override
  State<CourseScreen> createState() => _CourseScreenState();
}

class _CourseScreenState extends State<CourseScreen> {
  int _selectedIndex = 0;

  static List<Widget> _pages = <Widget>[
    CourseList(),
    FavoriteScreen(),
    CartScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    final courseViewModel =
        Provider.of<CourseViewModel>(context, listen: false);
    courseViewModel.fetchCourses();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        centerTitle: true,
        elevation: 0,
        title: const Text(
          "Online Education",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              showSearch(
                context: context,
                delegate: SearchViewDelegate(
                  Provider.of<CourseViewModel>(context, listen: false).courses,
                ),
              );
            },
          ),
        ],
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}

class CourseList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final courseViewModel = Provider.of<CourseViewModel>(context);
    return courseViewModel.courses.isEmpty
        ? const Center(child: CircularProgressIndicator())
        : ListView.builder(
            itemCount: courseViewModel.courses.length,
            itemBuilder: (context, index) {
              final course = courseViewModel.courses[index];
              return CourseListItem(
                course: course,
                isFavorite: course.isFavorite,
                toggleFavorite: courseViewModel.toggleFavorite,
              );
            },
          );
  }
}
