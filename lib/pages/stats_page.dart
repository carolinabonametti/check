import 'package:flutter/material.dart';
import 'package:todo_app/widgets/stats_counter.dart';

class StatsPage extends StatelessWidget {
  const StatsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Estatísicas'),
      ),
      body: Center(
        child: StatsCounter(),
      ),
    );
  }
}
