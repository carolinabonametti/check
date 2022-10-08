import 'package:flutter/material.dart';
import 'package:todo_app/widgets/extra_actions_button.dart';
import 'package:todo_app/widgets/todo_list.dart';

class HomePage extends StatefulWidget {
  const HomePage() : super();

  @override
  State<StatefulWidget> createState() {
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo App'),
        actions: [
          IconButton(
            icon: const Icon(Icons.pie_chart),
            tooltip: 'Estatísticas',
            onPressed: () {
              Navigator.pushNamed(context, '/stats');
            },
          ),
          const ExtraActionsButton()
        ],
      ),
      body: const TodoList(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/addTodo');
        },
        tooltip: 'Add Todo',
        child: const Icon(Icons.add),
      ),
    );
  }
}
