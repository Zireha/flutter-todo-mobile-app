import 'package:flutter/material.dart';

class PriorityButton extends StatelessWidget {
  const PriorityButton({super.key});

  @override
  Widget build(BuildContext context) {
    return const ActionChoiceExample();
  }
}

class ActionChoiceExample extends StatefulWidget {
  const ActionChoiceExample({super.key});

  @override
  State<ActionChoiceExample> createState() => _ActionChoiceExampleState();
}

class _ActionChoiceExampleState extends State<ActionChoiceExample> {
  int? _value = 0;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Column(
        children: <Widget>[
          Wrap(
            spacing: 11.0,
            children: List<Widget>.generate(
              4,
              (int index) {
                final List<String> labels = [
                  'Semua',
                  'Tinggi',
                  'Sedang',
                  'Rendah'
                ];
                final List<int> colors = [
                  0xFF243244,
                  0xFFFE5F55,
                  0xFFF69D0B,
                  0xFF75D829
                ];

                return ChoiceChip(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                  showCheckmark: false,
                  chipAnimationStyle: ChipAnimationStyle(
                      enableAnimation: AnimationStyle(
                          duration: const Duration(milliseconds: 1),
                          reverseDuration: const Duration(milliseconds: 1))),
                  label: Text(
                    labels[index],
                    style: const TextStyle(
                        color: Colors.white, fontFamily: 'urbanistBold'),
                  ),
                  side: BorderSide.none,
                  selected: _value == index,
                  selectedColor: Color(colors[index]),
                  backgroundColor: Color(colors[index]).withOpacity(0.4),
                  onSelected: (bool selected) {
                    setState(() {
                      _value = selected ? index : 0;
                    });
                  },
                );
              },
            ).toList(),
          ),
        ],
      ),
    );
  }
}
