import 'package:flutter/foundation.dart';

enum DisarmResult { success, silentDuressTriggered, invalidPin }

/// Centralized Safety Service Controller
/// Handles PIN security verification, hardware panic events, and background listeners.
class SafetyService extends ChangeNotifier {
  static final SafetyService instance = SafetyService._internal();
  SafetyService._internal();

  bool _isTravelModeActive = true;
  bool _isSosActive = false;
  bool _isDuressActive = false;
  final String _currentPin = '1234';
  final String _duressPin = '9999';

  bool get isTravelModeActive => _isTravelModeActive;
  bool get isSosActive => _isSosActive;
  bool get isDuressActive => _isDuressActive;

  /// Verifies disarm attempt with 4-digit PIN
  DisarmResult verifyAndDisarm(String enteredPin) {
    if (enteredPin == _currentPin) {
      _isTravelModeActive = false;
      _isSosActive = false;
      notifyListeners();
      return DisarmResult.success;
    } else if (enteredPin == _duressPin) {
      // Visually disarms, but secretly flags silent duress
      _isTravelModeActive = false;
      _isDuressActive = true;
      _isSosActive = true;
      notifyListeners();
      return DisarmResult.silentDuressTriggered;
    }
    return DisarmResult.invalidPin;
  }

  /// Triggers hardware panic combo event (Power x1 + Vol Up/Down x2)
  void triggerHardwarePanic() {
    _isSosActive = true;
    notifyListeners();
  }

  /// Resets emergency alarm
  void resetEmergency() {
    _isSosActive = false;
    _isDuressActive = false;
    notifyListeners();
  }
}
