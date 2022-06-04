import 'package:flutter/material.dart';

import '../Widgets/task_list.dart';
import '../blocs/blocs_exports.dart';
import 'my_drawer.dart';

class RecycleBin extends StatelessWidget {
  const RecycleBin({Key? key}) : super(key: key);
  static const id = "recycle_bin_screen";

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TasksBloc, TasksState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Deleted Tasks'),
            actions: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.add),
              )
            ],
          ),
          drawer: const MyDrawer(receivedId: 'recycle_bin_screen',),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Chip(
                  label: Text(
                    "${state.removedTasks.length} Tasks",
                  ),
                ),
              ),
              TaskList(tasksList: state.removedTasks)
            ],
          ),
        );
      },
    );
  }
}
