import 'package:flutter/material.dart';



class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {

    const bgColor = 0xFFF1F1FF;
    const fgColor = 0xFF243244;
    const highPriorityColor = 0xFFFE5F55;
    const midPriorityColor = 0xFFEAD42F;
    const lowPriorityColor = 0xFF75D829;
    const fadedHighPriority = 0xFFFFBFBB;
    const fadedMidPriority = 0xFFF6EEAC;
    const fadedLowPriority = 0xFFC8EFAA;

    return Scaffold(
      backgroundColor: Color(bgColor),
      appBar: AppBar(
        title: const Center(
          child: Text(
              'Todo App',
            style: TextStyle(
              fontFamily: 'montserrat', fontWeight: FontWeight.w700, color: Color(fgColor)
            ),
          ),
        ),
        backgroundColor: Color(bgColor),

      ),
    );
  }
}