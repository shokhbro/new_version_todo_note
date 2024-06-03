import 'package:flutter/material.dart';
import 'package:todo_note_project/views/widgets/edit_profile.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String name = "Eshmat";
  String surname = "Eshonov";

  void editProfile() async {
    final result = await showDialog<Map<String, String>>(
      context: context,
      builder: (context) {
        return EditProfile(
          initialName: name,
          initialSurname: surname,
          isEditing: true,
        );
      },
    );

    if (result != null) {
      setState(() {
        name = result['name']!;
        surname = result['surname']!;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Card(
            child: ListTile(
              leading: const CircleAvatar(
                backgroundImage: AssetImage("assets/images/person.png"),
              ),
              title: Text(
                name,
                style: const TextStyle(fontFamily: 'Lato'),
              ),
              subtitle: Text(
                surname,
                style: const TextStyle(fontFamily: 'Lato'),
              ),
              trailing: IconButton(
                icon: const Icon(Icons.edit),
                onPressed: editProfile,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
