import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/models/enums.dart';
import 'package:todo_app/provider/todo_list_provider.dart';

class ExtraActionsButton extends StatelessWidget {
  const ExtraActionsButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TodoListProvider>(context);
    
    return PopupMenuButton<ExtraAction>(
      onSelected: (action) {
        if (action == ExtraAction.completeAll ){
          provider.completeAll();
        
        }
        else if(action == ExtraAction.clearCompleted ) {
          provider.clearCompleted();

        }
      },
      itemBuilder: (BuildContext context) => <PopupMenuItem<ExtraAction>>[
        const PopupMenuItem<ExtraAction>(
          value: ExtraAction.completeAll,
          child: Text('Completar Todos'),
        ),
        const PopupMenuItem<ExtraAction>(
          value: ExtraAction.clearCompleted,
          child: Text('Limpar completos'),
        ),
      ],
    );
  }
}
