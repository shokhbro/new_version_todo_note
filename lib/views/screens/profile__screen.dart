import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:todo_note_project/views/widgets/edit_profile.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String name = "Eshmat";
  String surname = "Eshonov";
  String phoneNumber = "+998785692345";

  void editProfile() async {
    final result = await showDialog<Map<String, String>>(
      context: context,
      builder: (context) {
        return EditProfile(
          initialName: name,
          initialSurname: surname,
          phoneNumber: phoneNumber,
          isEditing: true,
        );
      },
    );

    if (result != null) {
      setState(() {
        name = result['name']!;
        surname = result['surname']!;
        phoneNumber = result['phoneNumber']!;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const Gap(20),
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.blue, width: 2.5),
                  shape: BoxShape.circle,
                  image: const DecorationImage(
                    image: AssetImage("assets/images/person.png"),
                  ),
                ),
              ),
              IconButton(
                icon: const Icon(Icons.edit),
                onPressed: editProfile,
              ),
            ],
          ),
          const Gap(20),
          ListTile(
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Text(
                      "name:  ",
                      style: TextStyle(
                        fontFamily: 'Lato',
                      ),
                    ),
                    Text(
                      name,
                      style: const TextStyle(
                        fontFamily: 'Lato',
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Text(
                      "surname:  ",
                      style: TextStyle(
                        fontFamily: 'Lato',
                      ),
                    ),
                    Text(
                      surname,
                      style: const TextStyle(
                        fontFamily: 'Lato',
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            subtitle: Row(
              children: [
                const Text(
                  "phone number:  ",
                  style: TextStyle(fontFamily: 'Lato'),
                ),
                Text(
                  phoneNumber,
                  style: const TextStyle(
                    fontFamily: 'Lato',
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
