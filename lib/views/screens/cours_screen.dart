import 'package:flutter/material.dart';
import 'package:todo_note_project/controllers/course_controller.dart';

class CoursScreen extends StatelessWidget {
  CoursScreen({super.key});

  final courseContoller = CourseController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Courses Screen",
          style: TextStyle(
            fontFamily: 'Lato',
          ),
        ),
        backgroundColor: Colors.amber,
      ),
      body: FutureBuilder(
        future: courseContoller.getCourse(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (!snapshot.hasData) {
            return const Center(
              child: Text("Malumotlar topilmadi!"),
            );
          }

          if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.hasError.toString()),
            );
          }
          final courses = snapshot.data;
          return courses == null || courses.isEmpty
              ? const Center(
                  child: Text("Mahsulotlar mavjud emas!"),
                )
              : Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: ListView.builder(
                    itemCount: courses.length,
                    itemBuilder: (ctx, index) {
                      final course = courses[index];
                      return Card(
                        child: ListTile(
                          contentPadding: const EdgeInsets.only(bottom: 10),
                          leading: Image.network(
                            course.imageUrl,
                            fit: BoxFit.cover,
                          ),
                          title: Text(course.title),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(course.description),
                              Text(course.price.toString()),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                );
        },
      ),
    );
  }
}
