import 'package:shamsi_date/shamsi_date.dart';

extension DateHelperExtension on DateTime {
  int dateDifference(DateTime secondDate) {
    return DateTime(year, month, day)
        .difference(
          DateTime(
            secondDate.year,
            secondDate.month,
            secondDate.day,
          ),
        )
        .inDays;
  }

  bool isSameDate(DateTime other) {
    return year == other.year && month == other.month && day == other.day;
  }

  String getJalaliDay() {
    final f = Jalali.fromDateTime(this).formatter;
    return f.d;
  }

  String getJalaliWeekDay() {
    final f = Jalali.fromDateTime(this).formatter;
    return f.wN;
  }

  String getJalaliMonth() {
    final f = Jalali.fromDateTime(this).formatter;
    return f.mN;
  }

  String getGregorianDay() {
    final f = Jalali.fromDateTime(this).toGregorian().formatter;
    return f.d;
  }

  String getGregorianWeekDay() {
    final f = Jalali.fromDateTime(this).toGregorian().formatter;
    return f.wN;
  }

  String getGregorianMonth() {
    final f = Jalali.fromDateTime(this).toGregorian().formatter;
    return f.mN;
  }
}
