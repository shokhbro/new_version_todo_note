import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:todo_note_project/views/screens/admin_panel.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.amber,
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Gap(50),
          const Divider(
            color: Colors.white,
            height: 1,
            thickness: 3,
          ),
          const Gap(10),
          Column(
            children: [
              Row(
                children: [
                  const Gap(20),
                  const Text(
                    "Menu",
                    style: TextStyle(
                      fontFamily: 'Lato',
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                  const Gap(180),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.arrow_forward_ios,
                      size: 16,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  const Gap(20),
                  const Text(
                    "Profile",
                    style: TextStyle(
                      fontFamily: 'Lato',
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                  const Gap(170),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.arrow_forward_ios,
                      size: 16,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  const Gap(20),
                  const Text(
                    "Settings",
                    style: TextStyle(
                      fontFamily: 'Lato',
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                  const Gap(156),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.arrow_forward_ios,
                      size: 16,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  const Gap(20),
                  const Text(
                    "About me",
                    style: TextStyle(
                      fontFamily: 'Lato',
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                  const Gap(142),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.arrow_forward_ios,
                      size: 16,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const Gap(20),
          const Divider(
            color: Colors.white,
            height: 1,
            thickness: 3,
          ),
          const Gap(20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (ctx) {
                    return const AdminPanel();
                  }));
                },
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.75,
                  height: 45,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.blue,
                  ),
                  child: const Row(
                    children: [
                      Gap(20),
                      Text(
                        "Admin Panel",
                        style: TextStyle(
                          fontFamily: 'Lato',
                          color: Colors.white,
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
    );
  }
}
