import 'package:shamsi_date/shamsi_date.dart';

extension DateHelperExtension on DateTime {
  int dateDifference(DateTime secondDate) {
    final firstDate = DateTime(year, month, day);
    final difference = firstDate.difference(
        DateTime(secondDate.year, secondDate.month, secondDate.day));
    return difference.inDays;
  }

  bool isSameDate(DateTime other) {
    return year == other.year && month == other.month && day == other.day;
  }

  String getJalaliDay() {
    final formatter = Jalali.fromDateTime(this).formatter;
    return formatter.d;
  }

  String getJalaliWeekDay() {
    final formatter = Jalali.fromDateTime(this).formatter;
    return formatter.wN;
  }

  String getJalaliMonth() {
    final formatter = Jalali.fromDateTime(this).formatter;
    return formatter.mN;
  }

  String getGregorianDay() {
    final formatter = Jalali.fromDateTime(this).toGregorian().formatter;
    return formatter.d;
  }

  String getGregorianWeekDay() {
    final formatter = Jalali.fromDateTime(this).toGregorian().formatter;
    return formatter.wN;
  }

  String getGregorianMonth() {
    final formatter = Jalali.fromDateTime(this).toGregorian().formatter;
    return formatter.mN;
  }
}
