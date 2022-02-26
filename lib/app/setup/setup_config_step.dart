import 'package:ARQMS/app/app_localizations.dart';
import 'package:ARQMS/app/setup/setup_page.dart';
import 'package:ARQMS/app/setup/setup_viewmodel.dart';
import 'package:ARQMS/widgets/section_widget.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ConfigStepContent extends ConsumerStatefulWidget {
  const ConfigStepContent({Key? key}) : super(key: key);

  @override
  _ConfigStepContentState createState() => _ConfigStepContentState();
}

class _ConfigStepContentState extends ConsumerState<ConfigStepContent> {
  @override
  Widget build(BuildContext context) {
    final viewModel = ref.watch(setupViewModel);

    return Stack(children: [
      Form(
        key: viewModel.formKey,
        child: Column(
          children: [
            _buildDeviceSection(viewModel),
            _buildWlanSection(viewModel),
          ],
        ),
      ),
    ]);
  }

  Widget _buildWlanSection(SetupViewModel viewModel) =>
      Section(title: "setup.wizard.step.config.wlan".i18n(context), children: [
        TextFormField(
          controller: viewModel.ssid,
          decoration: InputDecoration(
            isDense: true,
            labelText: "setup.wizard.step.config.ssid".i18n(context),
          ),
        ),
        TextFormField(
          controller: viewModel.ssidPwd,
          obscureText: true,
          decoration: InputDecoration(
            isDense: true,
            labelText: "setup.wizard.step.config.ssidPwd".i18n(context),
          ),
        ),
      ]);

  Widget _buildDeviceSection(SetupViewModel viewModel) => Section(
          title: "setup.wizard.step.config.device".i18n(context),
          children: [
            TextFormField(
              controller: viewModel.roomName,
              validator: (value) {
                if (value == null) {
                  return "setup.wizard.step.config.devicename.error"
                      .i18n(context);
                }
              },
              decoration: InputDecoration(
                labelText: "setup.wizard.step.config.devicename".i18n(context),
              ),
            ),
            DropdownButtonFormField(
              decoration: InputDecoration(
                labelText: "setup.wizard.step.config.interval".i18n(context),
              ),
              onChanged: (int? value) {
                viewModel.sendInterval = value ?? viewModel.sendInterval;
              },
              value: viewModel.sendInterval,
              items: const [
                DropdownMenuItem<int>(child: Text("5"), value: 5),
                DropdownMenuItem<int>(child: Text("10"), value: 10),
                DropdownMenuItem<int>(child: Text("15"), value: 15),
                DropdownMenuItem<int>(child: Text("30"), value: 30),
                DropdownMenuItem<int>(child: Text("60"), value: 60),
                DropdownMenuItem<int>(child: Text("120"), value: 120),
              ],
            ),
            TextFormField(
              controller: viewModel.brokerUri,
              validator: (value) {
                if (value == null || !Uri.parse(value).isAbsolute) {
                  return "setup.wizard.step.config.brokeruri.error"
                      .i18n(context);
                }
              },
              decoration: InputDecoration(
                labelText: "setup.wizard.step.config.brokeruri".i18n(context),
              ),
            ),
          ]);
}
