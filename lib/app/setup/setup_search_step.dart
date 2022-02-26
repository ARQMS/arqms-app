import 'package:flutter/material.dart';

class SearchStepContent extends StatefulWidget {
  const SearchStepContent({Key? key}) : super(key: key);

  @override
  _SearchStepContentState createState() => _SearchStepContentState();
}

class _SearchStepContentState extends State<SearchStepContent> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Container(
        width: 32,
        height: 32,
        child: CircularProgressIndicator(),
      ),
    );
  }
}
