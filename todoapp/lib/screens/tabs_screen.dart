import 'package:flutter/material.dart';
import '../screens/completed_tasks_screen.dart';
import '../screens/favorite_tasks_screen.dart';
import '../screens/my_drawer.dart';
import '../screens/pending_screen.dart';

import 'add_task_screen.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({Key? key}) : super(key: key);
  static const id = "tabs_screen";

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  final List<Map<String, dynamic>>  _pageDetails = [
    {'pageName': const PendingTaskScreen(), "title": "Pending Tasks"},
    {'pageName': const CompletedTaskScreen(), "title": "Completed Tasks"},
    {'pageName': const FavoriteTaskScreen(), "title": "Favorite Tasks"},
  ];

  var _selectedPageIndex = 0;

  void _addTask(BuildContext context) {
    showModalBottomSheet(
        isScrollControlled: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        context: context,
        builder: (context) => FractionallySizedBox(
              heightFactor: 0.85,
              child: Flex(direction: Axis.vertical, children: const [
                AddTaskScreen(),
              ]),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pageDetails[_selectedPageIndex]["title"]),
      ),
      drawer: MyDrawer(
        receivedId: _selectedPageIndex == 0 ?PendingTaskScreen.id : _selectedPageIndex == 1 ? CompletedTaskScreen.id : FavoriteTaskScreen.id,
      ),
      body: _pageDetails[_selectedPageIndex]["pageName"],
      floatingActionButton: _selectedPageIndex ==0 ? FloatingActionButton(
        onPressed: () => _addTask(context),
        tooltip: 'Add Task',
        child: const Icon(Icons.add),
      ) : null,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedPageIndex,
        onTap: (index) {
          setState(() {
            _selectedPageIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.list), label: "Pending Tasks"),
          BottomNavigationBarItem(
              icon: Icon(Icons.done), label: "Completed Tasks"),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), label: "Favorite Tasks"),
        ],
      ),
    );
  }
}
