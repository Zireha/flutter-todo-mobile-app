import 'package:flutter/material.dart';
import 'package:todoapp/data/db_service/db_service.dart';

import 'ui/home_screen.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await DBService.instance.initDB();
  await DBService.instance.initializeTask();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'ToDo App',
        theme: ThemeData(),
        home: const HomeScreen());
  }
}
