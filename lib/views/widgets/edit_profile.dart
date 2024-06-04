import 'package:flutter/material.dart';

class EditProfile extends StatefulWidget {
  final String? initialName;
  final String? initialSurname;
  final String? phoneNumber;

  final bool isEditing;

  const EditProfile({
    Key? key,
    this.initialName,
    this.initialSurname,
    required this.isEditing,
    required this.phoneNumber,
  }) : super(key: key);

  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _surnameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.isEditing) {
      _nameController.text = widget.initialName ?? '';
      _surnameController.text = widget.initialSurname ?? '';
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _surnameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Malumotlarni tahrirlash'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: _nameController,
            decoration: const InputDecoration(labelText: 'Ism'),
          ),
          TextField(
            controller: _surnameController,
            decoration: const InputDecoration(labelText: 'Familiya'),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Bekor qilish'),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop({
              'name': _nameController.text,
              'surname': _surnameController.text,
            });
          },
          child: const Text('Saqlash'),
        ),
      ],
    );
  }
}
