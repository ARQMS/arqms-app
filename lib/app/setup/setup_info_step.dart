import 'package:ARQMS/app/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class InfoStepContent extends ConsumerStatefulWidget {
  const InfoStepContent({Key? key}) : super(key: key);

  @override
  _InfoStepContentState createState() => _InfoStepContentState();
}

class _InfoStepContentState extends ConsumerState<InfoStepContent> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildStep(descId: "setup.wizard.step.info.desc1", step: 1),
      ],
    );
  }

  Widget _buildStep({required String descId, required int step}) {
    return Column(
      children: [
        Text(
          descId.i18n(context),
          textAlign: TextAlign.center,
        ),
        const Padding(padding: EdgeInsets.all(5)),
        Image.asset(
          "assets/connect_cable.gif",
          width: 400,
        ),
      ],
    );
  }
}
