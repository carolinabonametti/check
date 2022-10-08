import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/provider/todo_list_provider.dart';

class StatsCounter extends StatelessWidget {
  const StatsCounter() : super();

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TodoListProvider>(context);
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Text(
              'Todos Completos',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 24.0),
            child: Text(
              provider.numCompleted.toString(),

              style: Theme.of(context).textTheme.subtitle1,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Text(
              'Todos Ativos',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 24.0),
            child: Text(
              provider.numActive.toString(),
              style: Theme.of(context).textTheme.subtitle1,
            ),
          )
        ],
      ),
    );
  }
}
