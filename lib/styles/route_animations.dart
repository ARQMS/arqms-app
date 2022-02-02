// coverage:ignore-file

import 'package:flutter/material.dart';

/// Custom page transition animation
class SlideRoute extends PageRouteBuilder<dynamic> {
  final Widget page;

  /// Default constructor
  SlideRoute({required this.page})
      : super(
          pageBuilder: (context, animation1, animation2) => page,
          transitionsBuilder: (context, animation1, animation2, child) =>
              SlideTransition(
            position:
                Tween<Offset>(begin: const Offset(-1, 0), end: Offset.zero)
                    .animate(animation1),
            child: child,
          ),
        );
}
