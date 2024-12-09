import 'package:flutter/material.dart';
import 'package:todoapp/ui/priority_button.dart';

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
              const SizedBox(height: 32,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Semua Tugas',
                    style: TextStyle(
                      fontFamily: 'montserrat',
                      fontWeight: FontWeight.w700,
                      color: Color(fgColor),
                      fontSize: 20
                    ),
                  ),
                  const SizedBox(height: 8,),
                  Container(
                    alignment: Alignment.centerLeft,
                    width: double.maxFinite,
                    height: 70,
                    margin: const EdgeInsets.only(right: 16),
                    child: PriorityButton(),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

}