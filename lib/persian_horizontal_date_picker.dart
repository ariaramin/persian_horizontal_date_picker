import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:persian_horizontal_date_picker/extension/datetime_extension.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

part 'widget/date_tile.dart';
part 'widget/persian_date_picker_content.dart';

// ChangeNotifier to manage the selected date state
class DatePickerState with ChangeNotifier {
  DateTime? _selectedDate;

  DateTime? get selectedDate => _selectedDate;

  void setSelectedDate(DateTime? date) {
    _selectedDate = date;
    notifyListeners();
  }
}

class PersianHorizontalDatePicker extends StatelessWidget {
  const PersianHorizontalDatePicker({
    Key? key,
    required this.startDate,
    required this.endDate,
    this.initialSelectedDate,
    this.markedDates,
    required this.onDateSelected,
    this.isPersianDate = true,
    this.datePickerHeight = 112,
    this.gap = 16,
    this.width = 84,
    this.verticalPadding = 12,
    this.radius = 56,
    this.backgroundColor = const Color(0xFFBBDEFB),
    this.selectedBackgroundColor = Colors.blue,
    this.onBackgroundColor = Colors.blue,
    this.selectedOnBackgroundColor = Colors.white,
    this.weekDayTextStyle,
    this.dayTextStyle,
    this.monthTextStyle,
    this.hasShadow = true,
    this.shadows = const [],
  }) : super(key: key);

  final DateTime startDate;
  final DateTime endDate;
  final DateTime? initialSelectedDate;
  final List<DateTime>? markedDates;
  final Function(DateTime? date) onDateSelected;
  final bool isPersianDate;
  final double datePickerHeight;
  final double gap;
  final double width;
  final double verticalPadding;
  final double radius;
  final Color backgroundColor;
  final Color selectedBackgroundColor;
  final Color onBackgroundColor;
  final Color selectedOnBackgroundColor;
  final TextStyle? weekDayTextStyle;
  final TextStyle? dayTextStyle;
  final TextStyle? monthTextStyle;
  final bool hasShadow;
  final List<BoxShadow> shadows;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => DatePickerState()..setSelectedDate(initialSelectedDate),
      child: PersianDatePickerContent(
        startDate: startDate,
        endDate: endDate,
        markedDates: markedDates,
        onDateSelected: onDateSelected,
        isPersianDate: isPersianDate,
        datePickerHeight: datePickerHeight,
        gap: gap,
        width: width,
        verticalPadding: verticalPadding,
        radius: radius,
        backgroundColor: backgroundColor,
        selectedBackgroundColor: selectedBackgroundColor,
        onBackgroundColor: onBackgroundColor,
        selectedOnBackgroundColor: selectedOnBackgroundColor,
        weekDayTextStyle: weekDayTextStyle,
        dayTextStyle: dayTextStyle,
        monthTextStyle: monthTextStyle,
        hasShadow: hasShadow,
        shadows: shadows,
      ),
    );
  }
}
