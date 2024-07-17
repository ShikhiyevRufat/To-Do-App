import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ReminderSwitchNotifier extends StateNotifier<bool> {
  ReminderSwitchNotifier() : super(true) {
    _loadSwitchState();
  }

  Future<void> _loadSwitchState() async {
    final prefs = await SharedPreferences.getInstance();
    state = prefs.getBool('reminderSwitch') ?? true;
  }

  Future<void> toggleSwitch(bool value) async {
    state = value;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('reminderSwitch', state);
  }
}

final reminderSwitchProvider = StateNotifierProvider<ReminderSwitchNotifier, bool>((ref) {
  return ReminderSwitchNotifier();
});
