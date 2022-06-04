import 'package:flutter/material.dart';

import '../blocs/blocs_exports.dart';
import '../models/task.dart';
import '../screens/show_task_screen.dart';

class TaskTile extends StatelessWidget {
  const TaskTile({
    Key? key,
    required this.task,
  }) : super(key: key);

  final Task task;

  void _removeOrDeleteTask(BuildContext ctx, Task task) {
    task.isDeleted!
        ? ctx.read<TasksBloc>().add(DeleteTask(task: task))
        : ctx.read<TasksBloc>().add(RemoveTask(task: task));
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        task.title,
        style: TextStyle(
          fontSize: 18,
          decoration: task.isDone! ? TextDecoration.lineThrough : null,
        ),
      ),
      onTap: () {
        showModalBottomSheet(
        isScrollControlled: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        context: context,
        builder: (context) => FractionallySizedBox(
              heightFactor: 0.85,
              child: Flex(direction: Axis.vertical, children:[
                ShowTask(task: task,),
              ]),
            ));
        //_removeOrDeleteTask(context, task);
      },
      onLongPress: () {
        _removeOrDeleteTask(context, task);
      },
      trailing: task.isDeleted == false ? Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          GestureDetector(child: const Icon(Icons.edit),onTap: (){},),
          const SizedBox(width: 10,),
          Checkbox(
            value: task.isDone,
            onChanged: task.isDeleted == false
                ? (value) {
                    context.read<TasksBloc>().add(UpdateTask(task: task));
                  }
                : null,
          ),
        ],
      ): null,
    );
  }
}
