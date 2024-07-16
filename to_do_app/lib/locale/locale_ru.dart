import 'locale.dart';

/// The translations for Russian (`ru`).
class LocalizationServiceRu extends LocalizationService {
  LocalizationServiceRu([String locale = 'ru']) : super(locale);

  @override
  String get welcome_back => 'Добро пожаловать';

  @override
  String get search => 'Поиск';

  @override
  String get manage_daily_tasks => 'Управление ежедневными задачами';

  @override
  String get today_tasks => 'Сегодняшние задачи';

  @override
  String get see_all => 'Увидеть все';

  @override
  String get no_tasks_for_today => 'Нет задач на сегодня';

  @override
  String get no_tasks_available => 'Нет доступных задач';

  @override
  String get start_time => 'Время начала';

  @override
  String get end_time => 'Время окончания';

  @override
  String get progress => 'Прогресс';

  @override
  String get low => 'Низкий';

  @override
  String get medium => 'Середина';

  @override
  String get high => 'Высокий';

  @override
  String get today => 'Сегодня';

  @override
  String get edit_image_and_name => 'Редактировать изображение и имя';

  @override
  String get user_feedback => 'Отзывы пользователей';

  @override
  String get reminders => 'Напоминания';

  @override
  String get change_theme => 'Менять тему';

  @override
  String get change_language => 'Изменить язык';

  @override
  String get profile => 'Профиль';

  @override
  String get add_task => 'Добавить задачу';

  @override
  String get task_name => 'Название задачи';

  @override
  String get working => 'Работающий';

  @override
  String get description => 'Описание';

  @override
  String get select_category => 'Выберите категорию';

  @override
  String get date => 'Дата';

  @override
  String get save => 'Сохранять';

  @override
  String get cancel => 'Отмена';
}
