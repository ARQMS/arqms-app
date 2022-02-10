import 'package:ARQMS/app/app_localizations.dart';
import 'package:ARQMS/widgets/section_widget.dart';
import 'package:flutter/material.dart';

class ConfigStepContent extends StatefulWidget {
  const ConfigStepContent({Key? key}) : super(key: key);

  @override
  _ConfigStepContentState createState() => _ConfigStepContentState();
}

class _ConfigStepContentState extends State<ConfigStepContent> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildDeviceSection(context),
        _buildWlanSection(context),
      ],
    );
  }

  Widget _buildWlanSection(BuildContext context) =>
      Section(title: "setup.wizard.step.config.wlan".i18n(context), children: [
        TextFormField(
          decoration: InputDecoration(
            isDense: true,
            labelText: "setup.wizard.step.config.ssid".i18n(context),
          ),
        ),
        TextFormField(
          obscureText: true,
          decoration: InputDecoration(
            isDense: true,
            labelText: "setup.wizard.step.config.ssidPwd".i18n(context),
          ),
        ),
      ]);

  Widget _buildDeviceSection(BuildContext context) => Section(
          title: "setup.wizard.step.config.device".i18n(context),
          children: [
            TextFormField(
              decoration: InputDecoration(
                labelText: "setup.wizard.step.config.devicename".i18n(context),
              ),
            ),
            DropdownButtonFormField(
              decoration: InputDecoration(
                labelText: "setup.wizard.step.config.interval".i18n(context),
              ),
              onChanged: (int? value) {
                // TODO update viewModel
              },
              items: const [
                DropdownMenuItem<int>(child: Text("5"), value: 5),
                DropdownMenuItem<int>(child: Text("10"), value: 10),
                DropdownMenuItem<int>(child: Text("15"), value: 15),
                DropdownMenuItem<int>(child: Text("30"), value: 30),
                DropdownMenuItem<int>(child: Text("60"), value: 60),
                DropdownMenuItem<int>(child: Text("120"), value: 120),
              ],
            ),
          ]);
}
