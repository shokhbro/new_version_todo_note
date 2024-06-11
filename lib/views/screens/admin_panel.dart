import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_note_project/viewmodel.dart/admin_panel_viewmodel.dart';
import 'package:todo_note_project/viewmodel.dart/course_view_model.dart';

class AdminPanel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AdminPanelViewModel(
          Provider.of<CourseViewModel>(context, listen: false)),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.amber,
          title: const Text(
            'Admin Panel',
            style: TextStyle(fontFamily: 'Lato'),
          ),
        ),
        body: AdminPanelForm(),
      ),
    );
  }
}

class AdminPanelForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<AdminPanelViewModel>(context);

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          TextField(
            controller: viewModel.titleController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Title',
            ),
          ),
          const SizedBox(height: 15),
          TextField(
            controller: viewModel.descriptionController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Description',
            ),
          ),
          const SizedBox(height: 15),
          TextField(
            controller: viewModel.imageUrlController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Image URL',
            ),
          ),
          const SizedBox(height: 15),
          TextField(
            controller: viewModel.priceController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Price',
            ),
            keyboardType: TextInputType.number,
          ),
          const SizedBox(height: 30),
          ElevatedButton(
            onPressed: () {
              viewModel.addCourse();
              viewModel.clearControllers();
            },
            child: const Text('Add Course'),
          ),
        ],
      ),
    );
  }
}
