import 'package:flutter/material.dart';
import 'package:todoapp/data/db_service/db_service.dart';
import 'package:todoapp/data/model/todo.dart';
import 'package:todoapp/ui/priority_button.dart';

const bgColor = 0xFFF1F1FF;
const fgColor = 0xFF243244;

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(bgColor),
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Todo App',
            style: TextStyle(
                fontFamily: 'montserrat',
                fontWeight: FontWeight.w700,
                color: Color(fgColor)),
          ),
        ),
        backgroundColor: const Color(bgColor),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.only(left: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 40),
              // Heading
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Selamat Pagi, User!",
                    style: TextStyle(
                        fontFamily: 'montserrat',
                        fontWeight: FontWeight.w700,
                        color: Color(fgColor),
                        fontSize: 24),
                  ),
                  Text(
                    "Apa aja aktivitasmu hari ini?",
                    style: TextStyle(
                        fontFamily: 'urbanist',
                        fontWeight: FontWeight.w700,
                        color: Color(fgColor),
                        fontSize: 12),
                  ),
                ],
              ),
              const SizedBox(
                height: 32,
              ),

              // Priority Selector
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Semua Tugas',
                    style: TextStyle(
                        fontFamily: 'montserrat',
                        fontWeight: FontWeight.w700,
                        color: Color(fgColor),
                        fontSize: 20),
                  ),
                  // const SizedBox(height: 2,),
                  Container(
                    width: double.maxFinite,
                    height: 68,
                    margin: const EdgeInsets.only(right: 16),
                    child: const PriorityButton(),
                  )
                ],
              ),
              // const SizedBox(height: 2,),

              // All tasks
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                    margin: const EdgeInsets.only(right: 16),
                    width: double.maxFinite,
                    height: double.maxFinite,
                    child: const TaskList(),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class TaskList extends StatefulWidget {
  const TaskList({super.key});

  @override
  _TaskListState createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
  List<Todo> _todo = [];

  @override
  void initState() {
    // TODO: implement initState
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
          // itemCount: 2,
          itemBuilder: (context, index) {
            return InkWell(
                onTap: () {},
                child: Container(
                  margin: const EdgeInsets.only(bottom: 7),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      color: const Color(0xFFFFFFFF)),
                  child: Row(
                    children: <Widget>[
                      Container(
                        height: 90,
                        width: 22,
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(6),
                                bottomLeft: Radius.circular(6)),
                            color: Colors.red),
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
                                    fontFamily: 'urbanistBold', fontSize: 16
                                ),
                              ),
                              const SizedBox(height: 4,),
                              Text(
                                _todo[index].taskDescription,
                                style: const TextStyle(
                                    fontFamily: 'urbanist', fontSize: 12),
                              ),
                              const SizedBox(height: 7,),
                              Row(
                                children: [
                                  Text(
                                      _todo[index].endDate,
                                    style: const TextStyle(
                                        fontFamily: 'urbanistBold', fontSize: 10
                                    ),
                                  ),
                                  const SizedBox(width: 28,),
                                  Text(
                                    _todo[index].endTime,
                                    style: const TextStyle(
                                        fontFamily: 'urbanistBold', fontSize: 10
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ))
                    ],
                  ),
                ));
          }),
    );
  }
}
