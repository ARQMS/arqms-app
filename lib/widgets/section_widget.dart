import 'package:flutter/material.dart';

// coverage:ignore-file Justification: UI test not implemented at the moment

class Section extends StatelessWidget {
  final List<Widget> children;
  final List<Widget>? actions;
  final String title;

  const Section({
    Key? key,
    required this.title,
    required this.children,
    this.actions,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5.0,
      margin: const EdgeInsets.symmetric(vertical: 12.0),
      child: Container(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                Container(
                  child: Row(
                    children: actions ?? [],
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 12.0, top: 15.0),
              child: Wrap(
                spacing: 30.0,
                runSpacing: 20.0,
                children: children,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
