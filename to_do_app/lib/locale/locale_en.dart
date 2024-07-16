import 'locale.dart';

/// The translations for English (`en`).
class LocalizationServiceEn extends LocalizationService {
  LocalizationServiceEn([String locale = 'en']) : super(locale);

  @override
  String get welcome_back => 'Welcome back';

  @override
  String get search => 'Search';

  @override
  String get manage_daily_tasks => 'Manage Daily tasks';

  @override
  String get today_tasks => 'Today\'s Tasks';

  @override
  String get see_all => 'See all';

  @override
  String get no_tasks_for_today => 'No tasks for today';

  @override
  String get no_tasks_available => 'No tasks available';

  @override
  String get start_time => 'Start Time';

  @override
  String get end_time => 'End Time';

  @override
  String get progress => 'Progress';

  @override
  String get low => 'Low';

  @override
  String get medium => 'Medium';

  @override
  String get high => 'High';

  @override
  String get today => 'Today';

  @override
  String get edit_image_and_name => 'Edit image and name';

  @override
  String get user_feedback => 'User feedback';

  @override
  String get reminders => 'Reminders';

  @override
  String get change_theme => 'Change theme';

  @override
  String get change_language => 'Change language';

  @override
  String get profile => 'Profile';

  @override
  String get add_task => 'Add Task';

  @override
  String get task_name => 'Task name';

  @override
  String get working => 'Working';

  @override
  String get description => 'Description';

  @override
  String get select_category => 'Select Category';

  @override
  String get date => 'Date';

  @override
  String get save => 'Save';

  @override
  String get cancel => 'Cancel';
}