import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todoapp/data/model/todo.dart';
import 'package:todoapp/ui/priority_button.dart';
import 'package:todoapp/ui/task_list.dart';

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

Widget showPriorityList(int priority) {
  List<Todo> todo = [];

  return ListView.builder(
      itemCount: todo.length,
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
                      color: getColor(todo[index].priority)),
                ),
                Container(
                    width: 287,
                    margin: const EdgeInsets.only(left: 9),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          todo[index].taskTitle,
                          style: const TextStyle(
                              fontFamily: 'urbanistBold', fontSize: 18),
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        Text(
                          todo[index].taskDescription,
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
                                  todo[index].endDate,
                                  style: const TextStyle(
                                      fontFamily: 'urbanistBold', fontSize: 14),
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
                                  todo[index].endTime,
                                  style: const TextStyle(
                                      fontFamily: 'urbanistBold', fontSize: 14),
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
      });
}
