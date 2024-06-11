import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:todo_note_project/utils/routes.dart';
import 'package:todo_note_project/views/screens/register_screen.dart';
import 'package:todo_note_project/views/widgets/custom_drawer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blue,
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (ctx) {
                  return const RegisterScreen();
                }),
              );
            },
            child: const Text(
              "Register",
              style: TextStyle(fontFamily: 'Lato'),
            ),
          ),
        ],
        title: const Text(
          "Home Screen",
          style: TextStyle(
            fontFamily: 'Lato',
            color: Colors.white,
          ),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, RoutesNames.todoScreen);
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: 70,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.amber,
                    ),
                    child: const Center(
                      child: Text(
                        "Todos",
                        style: TextStyle(
                          fontFamily: 'Lato',
                          fontSize: 25,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(15.0),
            child: Row(
              children: [
                Text(
                  "Courses",
                  style: TextStyle(
                    fontFamily: 'Lato',
                    fontSize: 30,
                  ),
                )
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, RoutesNames.course);
                },
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Colors.blue,
                      width: 2.5,
                    ),
                  ),
                  child: const Row(
                    children: [
                      Gap(20),
                      Text(
                        "IT",
                        style: TextStyle(
                          fontFamily: 'lato',
                          color: Colors.black,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const Gap(30),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, RoutesNames.course);
                },
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Colors.blue,
                      width: 2.5,
                    ),
                  ),
                  child: const Row(
                    children: [
                      Gap(20),
                      Text(
                        "Flutter Darslari",
                        style: TextStyle(
                          fontFamily: 'lato',
                          color: Colors.black,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const Gap(30),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, RoutesNames.course);
                },
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Colors.blue,
                      width: 2.5,
                    ),
                  ),
                  child: const Row(
                    children: [
                      Gap(20),
                      Text(
                        "Noldan Python",
                        style: TextStyle(
                          fontFamily: 'lato',
                          color: Colors.black,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      drawer: const CustomDrawer(),
    );
  }
}
 