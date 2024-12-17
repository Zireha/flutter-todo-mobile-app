import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../data/db_service/db_service.dart';
import '../data/model/todo.dart';

class TaskList extends StatefulWidget {
  final int? priorityValue;

  const TaskList({super.key, this.priorityValue});

  @override
  _TaskListState createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
  List<Todo> _todo = [];

  @override
  void initState() {
    super.initState();
    _fetchTask();
  }

  Future<void> _fetchTask() async {
    final taskMaps = await DBService.instance.queryAll();

    setState(() {
      _todo = taskMaps.map((taskMap) => Todo.fromMap(taskMap)).toList();
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: _todo.length,
          itemBuilder: (context, index) {
            return Container(
              margin: const EdgeInsets.only(bottom: 7),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  color: const Color(0xFFFFFFFF)),
              child: InkWell(
                onTap: () {},
                child: Row(
                  children: <Widget>[
                    Container(
                      height: 90,
                      width: 22,
                      decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(6),
                              bottomLeft: Radius.circular(6)),
                          color: getColor(_todo[index].priority)),
                    ),
                    Container(
                        width: 287,
                        margin: const EdgeInsets.only(left: 9),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              _todo[index].taskTitle,
                              style: const TextStyle(
                                  fontFamily: 'urbanistBold', fontSize: 18),
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            Text(
                              _todo[index].taskDescription,
                              style: const TextStyle(
                                  fontFamily: 'urbanist', fontSize: 14),
                            ),
                            const SizedBox(
                              height: 7,
                            ),
                            Row(
                              children: [
                                Row(
                                  children: <Widget>[
                                    const Icon(Icons.calendar_month),
                                    const SizedBox(
                                      width: 4,
                                    ),
                                    Text(
                                      _todo[index].endDate,
                                      style: const TextStyle(
                                          fontFamily: 'urbanistBold',
                                          fontSize: 14),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  width: 28,
                                ),
                                Row(
                                  children: <Widget>[
                                    const Icon(CupertinoIcons.clock),
                                    const SizedBox(
                                      width: 4,
                                    ),
                                    Text(
                                      _todo[index].endTime,
                                      style: const TextStyle(
                                          fontFamily: 'urbanistBold',
                                          fontSize: 14),
                                    ),
                                  ],
                                )
                              ],
                            )
                          ],
                        ))
                  ],
                ),
              ),
            );
          }),
    );
  }
}

Color getColor(index) {
  List<Todo> todo = [];

  if (index == 1) {
    return const Color(0xFFFE5F55);
  } else if (index == 2) {
    return const Color(0xFFEAD42F);
  } else if (index == 3) {
    return const Color(0xFF75D829);
  }

  return const Color(0xFFFFFFFF);
}
