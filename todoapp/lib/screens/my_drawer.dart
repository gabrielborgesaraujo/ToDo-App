import 'package:flutter/material.dart';
import 'package:todoapp/screens/completed_tasks_screen.dart';
import 'package:todoapp/screens/favorite_tasks_screen.dart';
import '../screens/tabs_screen.dart';
import '../blocs/blocs_exports.dart';
import 'recycle_bin.dart';
import 'pending_screen.dart';

class MyDrawer extends StatelessWidget {
  final String receivedId;
  const MyDrawer({Key? key, required this.receivedId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 20),
              color: Colors.grey,
              child: Text(
                "Task Drawer",
                style: Theme.of(context).textTheme.headline5,
              ),
            ),
            BlocBuilder<TasksBloc, TasksState>(
              builder: (context, state) {
                return GestureDetector(
                  onTap: (){
                    if(receivedId==PendingTaskScreen.id || receivedId == CompletedTaskScreen.id || receivedId == FavoriteTaskScreen.id){
                      Navigator.pop(context);
                    }else{
                      Navigator.of(context).pushReplacementNamed(TabsScreen.id).whenComplete(() => Navigator.pop(context));
                    }
                  },
                  child: ListTile(
                    leading: const Icon(Icons.folder_special),
                    title: const Text("My Tasks"),
                    trailing: Text("${state.pendingTasks.length}"),
                  ),
                );
              },
            ),
            const Divider(),
            BlocBuilder<TasksBloc, TasksState>(
              builder: (context, state) {
                return GestureDetector(
                  onTap: (){
                    if(receivedId==RecycleBin.id){
                      Navigator.pop(context);
                    }else{
                      Navigator.of(context).pushNamed(RecycleBin.id).whenComplete(() => Navigator.pop(context));
                    }
                  },
                  child: ListTile(
                    leading: const Icon(Icons.delete),
                    title: const Text("Deleted Tasks"),
                    trailing: Text("${state.removedTasks.length}"),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
