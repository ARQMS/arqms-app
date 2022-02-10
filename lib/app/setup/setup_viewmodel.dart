import 'package:ARQMS/app/app_navigator.dart';
import 'package:flutter/material.dart';

class WizardViewModel extends ChangeNotifier {
  int _currentStep = 0;
  bool _isCompleted = false;
  bool nextAvailable = true;
  String _nextTitleId = "setup.wizard.next";

  final int length;

  int get currentStep => _currentStep;
  bool get isCompleted => _isCompleted;
  String get nextTitle => _nextTitleId;

  WizardViewModel(this.length);

  void onStepTapped(int value) {
    final Map<int, VoidCallback> _fcnMap = {
      0: _infoEnter,
      1: _searchEnter,
      2: _configEnter,
    };

    if (value <= _fcnMap.length - 1) {
      _currentStep = value;
      _fcnMap[value]?.call();
    } else {
      _wizardFinish();
    }

    notifyListeners();
  }

  void onStepContinue() {
    _isCompleted = _currentStep + 1 >= 3;
    onStepTapped(_currentStep + 1);
  }

  void onCancel() {
    AppNavigator.pop();
  }

  void _infoEnter() {}

  void _searchEnter() async {
    nextAvailable = false;
    notifyListeners();
    // TODO await deviceManager.startBroadcast(const Duration(seconds: 30));
    await Future.delayed(const Duration(seconds: 2), _searchFinish);
  }

  void _searchFinish() {
    nextAvailable = true;
    onStepContinue();
  }

  void _configEnter() {
    _nextTitleId = "setup.wizard.finish";
  }

  void _wizardFinish() {
    // close
    AppNavigator.pop();
  }

  @override
  void dispose() {
    super.dispose();
  }
}
