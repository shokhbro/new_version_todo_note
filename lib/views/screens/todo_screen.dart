import 'package:flutter/material.dart';
import 'package:todo_note_project/controllers/note_controller.dart';
import 'package:todo_note_project/controllers/todo_controller.dart';
import 'package:todo_note_project/views/screens/note_screen.dart';
import 'package:todo_note_project/views/screens/profile__screen.dart';
import 'package:todo_note_project/views/screens/statistics_screen.dart';
import 'package:todo_note_project/views/widgets/add_edit_note_widget.dart';
import 'package:todo_note_project/views/widgets/add_edit_todo_widget.dart';
import 'package:todo_note_project/views/widgets/task_item.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen({super.key});

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen>
    with SingleTickerProviderStateMixin {
  final TodoController todoController = TodoController();
  late TabController tabController;

  final NoteController noteController = NoteController();

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
    tabController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  int id(int index) {
    return index++;
  }

  int selectedIndex = 0;

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  void addNote() async {
    final result = await showDialog<Map<String, String>>(
      context: context,
      builder: (context) {
        return const NoteAddEditDialog(
          isEditing: false,
        );
      },
    );

    if (result != null) {
      setState(() {
        noteController.addNote(
          id(noteController.notes.length + 1),
          result['title']!,
          result['content']!,
        );
      });
    }
  }

  void _addTask() async {
    final result = await showDialog<Map<String, String>>(
      context: context,
      builder: (context) {
        return const TodoAddEditDialog(
          isEditing: false,
        );
      },
    );

    if (result != null) {
      setState(() {
        todoController.addTodo(
          todoController.list.length + 1,
          result['title']!,
          result['description']!,
        );
      });
    }
  }

  void _editTask(int index) async {
    final initialTitle = todoController.list[index].title;
    final initialDescription = todoController.list[index].description;

    final result = await showDialog<Map<String, String>>(
      context: context,
      builder: (context) {
        return TodoAddEditDialog(
          initialTitle: initialTitle,
          initialDescription: initialDescription,
          isEditing: true,
        );
      },
    );

    if (result != null) {
      setState(() {
        todoController.editTodo(
          index,
          result['title']!,
          result['description']!,
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        centerTitle: true,
        title: const Text(
          "Todos",
          style: TextStyle(
            fontFamily: 'Lato',
          ),
        ),
        bottom: selectedIndex == 0
            ? TabBar(
                controller: tabController,
                labelStyle: const TextStyle(fontFamily: 'Lato', fontSize: 20),
                tabs: const [
                  Tab(text: "Todo"),
                  Tab(text: "Note"),
                ],
              )
            : null,
      ),
      body: IndexedStack(
        index: selectedIndex,
        children: [
          TabBarView(
            controller: tabController,
            children: [
              Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: todoController.list.length,
                      itemBuilder: (context, index) {
                        return TaskItem(
                          task: todoController.list[index],
                          onDelete: () {
                            setState(() {
                              todoController.removeTodo(index);
                            });
                          },
                          onEdit: () => _editTask(index),
                          onToggle: () {
                            setState(() {
                              todoController.toggleTodoCompletion(index);
                            });
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
              NoteScreen(noteController: noteController),
            ],
          ),
          StatisticsScreen(todoController: todoController),
          const ProfileScreen(),
        ],
      ),
      floatingActionButton: selectedIndex == 0
          ? FloatingActionButton(
              onPressed: tabController.index == 0 ? _addTask : addNote,
              child: tabController.index == 0
                  ? const Icon(Icons.add)
                  : const Icon(Icons.note),
            )
          : null,
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.stacked_bar_chart),
            label: 'Statistics',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: selectedIndex,
        selectedItemColor: Colors.purple,
        onTap: onItemTapped,
      ),
    );
  }
}
