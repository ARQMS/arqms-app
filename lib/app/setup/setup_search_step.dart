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
      width: 50,
      height: 50,
      child: Container(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
