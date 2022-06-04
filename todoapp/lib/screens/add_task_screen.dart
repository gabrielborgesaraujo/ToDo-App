import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

import '../blocs/blocs_exports.dart';
import '../models/task.dart';

class AddTaskScreen extends StatelessWidget {
  const AddTaskScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController titleController = TextEditingController();
    TextEditingController descriptionController = TextEditingController();
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          const Text(
            "Nova Tarefa",
            style: TextStyle(fontSize: 40),
          ),
          const SizedBox(
            height: 10,
          ),
          TextField(
            autofocus: false,
            controller: titleController,
            decoration: InputDecoration(
                filled: true,
                fillColor: const Color(0xFFD9D9D9),
                label: const Text("Titulo"),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                )),
          ),
          const SizedBox(
            height: 20,
          ),
          TextField(
            autofocus: false,
            controller: descriptionController,
            maxLines: 20,
            decoration: InputDecoration(
                filled: true,
                fillColor: const Color(0xFFD9D9D9),
                label: const Text("Descrição"),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                )),
          ),
          const SizedBox(
            height: 40,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(primary: Colors.green),
                onPressed: () {
                  if (titleController.text.isEmpty) {
                    showDialog(
                        context: context,
                        builder: (context) => const AlertDialog(title: Text("Insira um Titulo!"),));
                  } else {
                    var task = Task(
                      title: titleController.text,
                      description: descriptionController.text,
                      id: const Uuid().v4(),
                    );
                    context.read<TasksBloc>().add(AddTask(task: task));
                    Navigator.pop(context);
                  }
                },
                child: const Text("Confirmar"),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(primary: Colors.red),
                onPressed: () => Navigator.pop(context),
                child: const Text("Cancelar"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
