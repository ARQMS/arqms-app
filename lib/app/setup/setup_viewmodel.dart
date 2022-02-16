import 'dart:async';

import 'package:ARQMS/app/app_navigator.dart';
import 'package:ARQMS/models/device/device.dart';
import 'package:ARQMS/services/device_service.dart';
import 'package:flutter/material.dart';

abstract class WizardViewModelAbs extends ChangeNotifier {
  int _currentStep = 0;
  bool _isCompleted = false;
  String _nextTitleId = "setup.wizard.next";

  int get currentStep => _currentStep;
  bool get isCompleted => _isCompleted;
  String get nextTitle => _nextTitleId;

  bool nextAvailable = true;

  final StreamController<String> _errorStream = StreamController();
  Stream<String> get errorStream => _errorStream.stream;

  Map<int, VoidCallback> get __fcnMap;
  Map<int, StepState> get __stateMap;

  StepState stepState(int index) => __stateMap[index]!;

  void onStepTapped(int value) {
    if (value <= __fcnMap.length - 1) {
      _currentStep = value;
      __fcnMap[value]?.call();
    } else {
      __wizardFinish();
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

  void __wizardFinish() {}
}

class SetupViewModel extends WizardViewModelAbs {
  final GlobalKey<FormState> formKey = GlobalKey();

  static const String defaultBrokerUri = "https://rpi:8443";
  static const String defaultDeviceName = "My Room";

  final DeviceService _deviceService;
  late Device _device;

  int get length => __fcnMap.length;

  final TextEditingController deviceName =
      TextEditingController(text: defaultDeviceName);
  final TextEditingController brokerUri =
      TextEditingController(text: defaultBrokerUri);
  int sendInterval = 15;
  final TextEditingController ssid = TextEditingController();
  final TextEditingController ssidPwd = TextEditingController();

  @override
  late final Map<int, VoidCallback> __fcnMap = {
    0: _infoEnter,
    1: _searchEnter,
    2: _configEnter,
  };

  @override
  late final Map<int, StepState> __stateMap = {
    0: StepState.editing,
    1: StepState.disabled,
    2: StepState.disabled,
  };

  SetupViewModel({required DeviceService deviceService})
      : _deviceService = deviceService;

  void _infoEnter() {
    // update state
    __stateMap[0] = StepState.editing;
    __stateMap[1] = StepState.disabled;
    __stateMap[2] = StepState.disabled;

    nextAvailable = true;
  }

  void _searchEnter() async {
    // update state
    __stateMap[0] = StepState.disabled;
    __stateMap[2] = StepState.disabled;

    nextAvailable = false;
    notifyListeners();
    final devices = await _deviceService.broadcast(const Duration(seconds: 30));
    if (devices.isEmpty) {
      _errorStream.add("setup.wizard.search.noDevice");
      // back to first page
      onStepTapped(0);
      return;
    } else if (devices.length >= 2) {
      // TODO multiple devices found, show extra step to select device
      _device = devices.first;
    } else {
      _device = devices.first;
    }

    nextAvailable = true;
    onStepContinue();
  }

  void _configEnter() {
    // update state
    __stateMap[0] = StepState.complete;
    __stateMap[1] = StepState.disabled;
    __stateMap[2] = StepState.editing;

    _nextTitleId = "setup.wizard.finish";
  }

  @override
  void __wizardFinish() async {
    var valid = formKey.currentState!.validate();
    if (!valid) return;

    formKey.currentState!.save();

    await _deviceService.setup(
      _device,
      deviceName: deviceName.text,
      interval: sendInterval,
      brokerUri: brokerUri.text,
      ssid: ssid.text,
      ssidPwd: ssidPwd.text,
    );

    // close
    AppNavigator.pop();
  }

  @override
  void dispose() {
    super.dispose();
    _deviceService.cancelBroadcast();
  }
}
