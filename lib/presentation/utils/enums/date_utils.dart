import 'package:intl/intl.dart';

const String defaultDatePattern = 'yyyy-MM-dd';
final DateFormat defaultDateFormat = DateFormat(defaultDatePattern);

bool isToday(String date) {
  final now = DateTime.now();
  final today = DateTime(now.year, now.month, now.day);
  final picked = defaultDateFormat.parse(date);
  return picked.compareTo(today) == 0;
}
