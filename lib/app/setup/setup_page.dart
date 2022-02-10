import 'package:ARQMS/app/app_localizations.dart';
import 'package:ARQMS/app/setup/setup_config_step.dart';
import 'package:ARQMS/app/setup/setup_info_step.dart';
import 'package:ARQMS/app/setup/setup_search_step.dart';
import 'package:ARQMS/app/setup/setup_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final wizardViewModel = ChangeNotifierProvider.autoDispose
    .family<WizardViewModel, int>((ref, length) {
  return WizardViewModel(length);
});

class SetupPage extends ConsumerWidget {
  SetupPage({Key? key}) : super(key: key);

  static List<Step> _buildSteps(BuildContext context) => [
        Step(
          title: Text("setup.wizard.step.info.title".i18n(context)),
          state: StepState.disabled,
          content: const InfoStepContent(),
        ),
        Step(
          title: Text("setup.wizard.step.search.title".i18n(context)),
          state: StepState.disabled,
          content: const SearchStepContent(),
        ),
        Step(
          title: Text("setup.wizard.step.config.title".i18n(context)),
          state: StepState.disabled,
          content: const ConfigStepContent(),
        ),
      ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final steps = _buildSteps(context);
    final viewModel = ref.watch(wizardViewModel(steps.length));

    return Scaffold(
      appBar: AppBar(),
      body: Stack(
        children: [
          Stepper(
            steps: steps,
            type: StepperType.horizontal,
            currentStep: viewModel.currentStep,
            onStepCancel: viewModel.onCancel,
            onStepContinue: viewModel.onStepContinue,
            onStepTapped: viewModel.onStepTapped,
            controlsBuilder: (BuildContext context, ControlsDetails control) {
              return const SizedBox.shrink();
            },
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: _bottomBar(context, viewModel),
          )
        ],
      ),
    );
  }

  Widget _bottomBar(BuildContext context, WizardViewModel viewModel) {
    return Container(
      width: double.infinity,
      height: 50,
      color: Colors.black12,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextButton(
            onPressed: viewModel.onCancel,
            child: Text("setup.wizard.cancel".i18n(context)),
          ),
          _pageIndicator(context, viewModel),
          TextButton(
            onPressed:
                viewModel.nextAvailable ? viewModel.onStepContinue : null,
            child: Text(
              viewModel.nextTitle.i18n(context),
            ),
          ),
        ],
      ),
    );
  }

  Widget _pageIndicator(BuildContext context, WizardViewModel viewModel) {
    return Row(
      children: <Widget>[
        for (int i = 0; i < viewModel.length; i++)
          circleBar(context, i == viewModel.currentStep)
      ],
    );
  }

  Widget circleBar(BuildContext context, bool isActive) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 150),
      margin: const EdgeInsets.symmetric(horizontal: 8),
      height: isActive ? 12 : 8,
      width: isActive ? 12 : 8,
      decoration: BoxDecoration(
          color: isActive
              ? Theme.of(context).primaryColor
              : Theme.of(context).backgroundColor,
          borderRadius: const BorderRadius.all(Radius.circular(12))),
    );
  }
}
