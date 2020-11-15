import 'package:intl/intl.dart';

class DateFormats{
  static final DateFormat getDateFormat = DateFormat.yMMMd();
  static final DateFormat getSettingsDateFormat = DateFormat('yyyy-MM-dd');
  static final DateFormat getTimeFormat = DateFormat.jm();
}