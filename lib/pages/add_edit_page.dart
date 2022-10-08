import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/models/todo.dart';
import 'package:todo_app/provider/todo_list_provider.dart';

class AddEditPage extends StatefulWidget {
  const AddEditPage({
    Key? key,
  }) : super(key: key);

  @override
  _AddEditPageState createState() => _AddEditPageState();
}

class _AddEditPageState extends State<AddEditPage> {
  static final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String? _task;
  String? _note;

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TodoListProvider>(context);
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Adicionar Todo'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: formKey,
          onWillPop: () {
            return Future(() => true);
          },
          child: ListView(
            children: [
              TextFormField(
                autofocus: true,
                style: Theme.of(context).textTheme.headline5,
                decoration: const InputDecoration(
                  hintText: 'O que precisa ser feito?',
                ),
                onSaved: (value) => _task = value!,
                validator: (value){
                  if (value == null || value.isEmpty){
                    return 'Este campo é requisitado';
                  }
                  return null;
                },
              ),
              TextFormField(
                maxLines: 10,
                style: Theme.of(context).textTheme.subtitle1,
                decoration: const InputDecoration(
                  hintText: 'Notas adicionais...',
                ),
                onSaved: (value) => _note = value ?? '',
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Salvar',
        child: const Icon(Icons.add),
        onPressed: () {
          final form = formKey.currentState;
          if (form!.validate()) {
            form.save();

           final novoTodo= Todo(_task.toString(), note:_note.toString());
           provider.addTodo(novoTodo);

            Navigator.pop(context);
          }
        },
      ),
    );
  }
}
