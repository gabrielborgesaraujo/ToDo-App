import 'package:flutter/material.dart';
import '../Widgets/task_list.dart';
import '../blocs/blocs_exports.dart';
import '../models/task.dart';

class PendingTaskScreen extends StatelessWidget {
  const PendingTaskScreen({Key? key}) : super(key: key);
  static const id = "pending_task_screen";
 
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TasksBloc, TasksState>(
      builder: (context, state) {
        List<Task> tasksList = state.pendingTasks;
        return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Chip(
                  label: Text(
                    "${tasksList.length} Pending | ${state.completedTasks.length} Completed",
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
