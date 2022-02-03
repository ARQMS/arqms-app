import 'package:ARQMS/app/app_localizations.dart';
import 'package:flutter/material.dart';

class EmptyContent extends StatelessWidget {
  const EmptyContent({
    Key? key,
    this.titleId,
    this.messageId,
  }) : super(key: key);
  final String? titleId;
  final String? messageId;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            (titleId ?? "widgets.emptyContent.title").i18n(context),
            style: const TextStyle(fontSize: 32.0, color: Colors.black54),
          ),
          Text(
            (messageId ?? "widgets.emptyContent.message").i18n(context),
            style: const TextStyle(fontSize: 16.0, color: Colors.black54),
          ),
        ],
      ),
    );
  }
}
