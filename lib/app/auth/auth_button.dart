import 'package:ARQMS/app/app_localizations.dart';
import 'package:flutter/material.dart';

class AuthButton extends StatelessWidget {
  final Widget? icon;
  final String textId;

  final VoidCallback onTab;

  const AuthButton({
    Key? key,
    this.icon,
    required this.textId,
    required this.onTab,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTab,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (icon != null)
            Flexible(
              flex: 1,
              child: SizedBox(height: 20.0, width: 20.0, child: icon),
            ),
          const SizedBox(width: 14.0),
          Flexible(
            flex: 9,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                textId.i18n(context),
                textAlign: TextAlign.center,
                style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.white),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class AuthProviderButton extends StatelessWidget {
  final Widget? icon;
  final String textId;

  final VoidCallback onTab;

  const AuthProviderButton({
    Key? key,
    this.icon,
    required this.textId,
    required this.onTab,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTab,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (icon != null)
            Flexible(
              flex: 1,
              child: SizedBox(height: 20.0, width: 20.0, child: icon),
            ),
          const SizedBox(width: 14.0),
          Flexible(
            flex: 9,
            child: Text(
              textId.i18n(context),
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.black.withOpacity(0.64),
              ),
            ),
          )
        ],
      ),
    );
  }
}
