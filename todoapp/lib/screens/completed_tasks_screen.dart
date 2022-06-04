import 'package:flutter/material.dart';
import '../Widgets/task_list.dart';
import '../blocs/blocs_exports.dart';
import '../models/task.dart';

class CompletedTaskScreen extends StatelessWidget {
  const CompletedTaskScreen({Key? key}) : super(key: key);
  static const id = "completed_task_screen";
 
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TasksBloc, TasksState>(
      builder: (context, state) {
        List<Task> tasksList = state.completedTasks;
        return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Chip(
                  label: Text(
                    "${tasksList.length} Tasks",
                  ),
                ),
              ),
              TaskList(tasksList: tasksList)
            ],
          );
          /*floatingActionButton: FloatingActionButton(
            onPressed: () => _addTask(context),
            tooltip: 'Add Task',
            child: const Icon(Icons.add),
          ),*/
        
      },
    );
  }
}
