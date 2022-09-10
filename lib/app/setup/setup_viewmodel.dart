import 'dart:async';

import 'package:ARQMS/app/app_navigator.dart';
import 'package:ARQMS/data/exception_datasource.dart';
import 'package:ARQMS/models/device/device.dart';
import 'package:ARQMS/services/device_service.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

typedef BoolCallback = bool Function();

class WizardException implements Exception {
  final String message;

  WizardException(this.message);
}

abstract class WizardViewModelAbs extends ChangeNotifier {
  int _currentStep = 0;
  bool _isCompleted = false;
  String _nextTitleId = "setup.wizard.next";

  int get currentStep => _currentStep;
  bool get isCompleted => _isCompleted;
  String get nextTitle => _nextTitleId;

  bool nextAvailable = true;

  WizardViewModelAbs() {
    wizardInitialize();
  }

  final StreamController<String> _errorStream = StreamController();
  Stream<String> get errorStream => _errorStream.stream;

  @protected
  Map<int, AsyncCallback> get _stepFunc;
  @protected
  Map<int, StepState> get _stepState;
  @protected
  Map<int, BoolCallback> get _stepReady;

  StepState stepState(int index) => _stepState[index]!;

  void wizardGoTo(int value) async {
    if (value <= _stepFunc.length - 1) {
      _currentStep = value;
      notifyListeners();

      try {
        var callback = _stepFunc[value];
        await callback?.call();
      } on WizardException catch (e) {
        _errorStream.add(e.message);
        wizardGoTo(0);
        return;
      }
    } else {
      wizardFinish();
    }
  }

  void wizardContinue() {
    if (_stepReady[_currentStep]?.call() != true) {
      return;
    }

    _isCompleted = _currentStep + 1 >= _stepFunc.length;
    wizardGoTo(_currentStep + 1);
  }

  void wizardCancel() {}

  @protected
  Future wizardInitialize() async {}

  @protected
  void wizardFinish() {}
}

class SetupViewModel extends WizardViewModelAbs {
  final GlobalKey<FormState> formKey = GlobalKey();

  static const String defaultBrokerUri = "https://rpi:8443";
  static const String defaultDeviceName = "My Room";
  static const int defaultInterval = 30;

  final DeviceService _deviceService;

  Device? _device;

  int get length => _stepFunc.length;

  final sn = TextEditingController();
  final roomName = TextEditingController(text: defaultDeviceName);
  final brokerUri = TextEditingController(text: defaultBrokerUri);
  final ssid = TextEditingController();
  final ssidPwd = TextEditingController();
  final sendInterval = TextEditingController();

  @override
  late final Map<int, AsyncCallback> _stepFunc = {
    0: wizardInitialize,
    1: _connectDevice,
    2: _configDevice,
    3: _registerDevice,
  };

  @override
  late final Map<int, StepState> _stepState = {
    0: StepState.disabled,
    1: StepState.disabled,
    2: StepState.disabled,
    3: StepState.disabled,
  };

  @override
  late final Map<int, BoolCallback> _stepReady = {
    0: () => true,
    1: () => _device != null,
    2: () => formKey.currentState!.validate(),
    3: () => true,
  };

  SetupViewModel({required DeviceService deviceService})
      : _deviceService = deviceService;

  @override
  Future wizardInitialize() async {
    _stepState[0] = StepState.editing;
    _stepState[1] = StepState.disabled;
    _stepState[2] = StepState.disabled;
    _stepState[3] = StepState.disabled;

    nextAvailable = true;
    notifyListeners();
  }

  Future _connectDevice() async {
    _stepState[0] = StepState.disabled;
    _stepState[1] = StepState.editing;

    final devices = await _deviceService.broadcast(const Duration(seconds: 10));

    if (devices.isEmpty) {
      throw WizardException("setup.wizard.search.noDevice");
    }

    // select device
    _device = devices.first;
    if (devices.length >= 2) {
      // TODO multiple devices found, show extra step to select device
    }

    var connected = await _deviceService.connect(_device!);
    if (!connected) {
      throw WizardException("setup.wizard.search.noDevice");
    }

    await _deviceService.reload();

    sn.text = await _deviceService.readConfigurationString(
      name: "SerialNumber",
    );
    brokerUri.text = await _deviceService.readConfigurationString(
      name: "BrokerUri",
    );
    sendInterval.text = (await _deviceService.readConfigurationInt(
      name: "Interval",
    ))
        .toString();
    roomName.text = await _deviceService.readConfigurationString(
      name: "Room",
    );
    ssid.text = await _deviceService.readConfigurationString(
      name: "Wifi_SSID",
    );
    ssidPwd.text = await _deviceService.readConfigurationString(
      name: "Wifi_PWD",
    );

    wizardContinue();
  }

  Future _configDevice() async {
    // update state
    _stepState[1] = StepState.disabled;
    _stepState[2] = StepState.editing;
    _stepState[3] = StepState.disabled;

    _nextTitleId = "setup.wizard.finish";
    nextAvailable = true;
    notifyListeners();
  }

  Future _registerDevice() async {
    _stepState[2] = StepState.disabled;
    _stepState[3] = StepState.editing;
    nextAvailable = false;
    notifyListeners();

    try {
      var registered = await _deviceService.setup(
        _device!,
        roomName: roomName.text,
        interval: int.parse(sendInterval.text),
        brokerUri: brokerUri.text,
        ssid: ssid.text,
        ssidPwd: ssidPwd.text,
      );

      if (!registered) {
        throw WizardException("setup.wizard.search.noDevice");
      }

      // TODO create new room on parse server for registered device
    } on DataSourceException catch (e) {
      // some errors on connection side, so go back and try again
      if (e.message != null) {
        _errorStream.add(e.message!);
      }
      wizardGoTo(2);
      return;
    }

    wizardContinue();
  }

  @override
  void wizardFinish() async {
    AppNavigator.pop();
  }

  @override
  void wizardCancel() {
    super.wizardCancel();
    _deviceService.cancelBroadcast();

    AppNavigator.pop();
  }

  @override
  void dispose() {
    super.dispose();
    _deviceService.cancelBroadcast();

    roomName.dispose();
    brokerUri.dispose();
    ssid.dispose();
    ssidPwd.dispose();
  }
}
