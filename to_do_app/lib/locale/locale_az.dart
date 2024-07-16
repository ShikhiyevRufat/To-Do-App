import 'locale.dart';

/// The translations for Azerbaijani (`az`).
class LocalizationServiceAz extends LocalizationService {
  LocalizationServiceAz([String locale = 'az']) : super(locale);

  @override
  String get welcome_back => 'Xoş gəldiniz';

  @override
  String get search => 'Axtar';

  @override
  String get manage_daily_tasks => 'Gündəlik tapşırıqları idarə edin';

  @override
  String get today_tasks => 'Bu günün tapşırıqları';

  @override
  String get see_all => 'Hamısını gör';

  @override
  String get no_tasks_for_today => 'Bu gün üçün tapşırıq yoxdur';

  @override
  String get no_tasks_available => 'Əlçatan tapşırıq yoxdur';

  @override
  String get start_time => 'Başlama vaxtı';

  @override
  String get end_time => 'Bitmə vaxtı';

  @override
  String get progress => 'Tərəqqi';

  @override
  String get low => 'Aşağı';

  @override
  String get medium => 'Orta';

  @override
  String get high => 'Yüksək';

  @override
  String get today => 'Bu gün';

  @override
  String get edit_image_and_name => 'Şəkil və adı redaktə edin';

  @override
  String get user_feedback => 'İstifadəçi rəyi';

  @override
  String get reminders => 'Xatırlatmalar';

  @override
  String get change_theme => 'Mövzunu dəyişdirin';

  @override
  String get change_language => 'Dili dəyişdirin';

  @override
  String get profile => 'Profil';

  @override
  String get add_task => 'Tapşırıq əlavə et';

  @override
  String get task_name => 'Tapşırıq adı';

  @override
  String get working => 'Tapşırıq...';

  @override
  String get description => 'Xülasə';

  @override
  String get select_category => 'Kateqoriya seç';

  @override
  String get date => 'Tarix';

  @override
  String get save => 'Yadda saxla';

  @override
  String get cancel => 'Ləğv et';
}