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
  int? _value = 1;

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
                return ChoiceChip(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                  showCheckmark: false,
                  label: Text('Item $index'),
                  selected: _value == index,
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