import 'package:flutter/material.dart';

import '../models/task.dart';

class ShowTask extends StatelessWidget {
  final Task task;
  const ShowTask({
    Key? key, required this.task,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController titleController = TextEditingController(text: task.title);
    TextEditingController descriptionController = TextEditingController(text: task.description);
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
            enabled: false,
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
          ElevatedButton(
            style: ElevatedButton.styleFrom(primary: Colors.red),
            onPressed: () => Navigator.pop(context),
            child: const Text("Cancelar"),
          ),
        ],
      ),
    );
  }
}
