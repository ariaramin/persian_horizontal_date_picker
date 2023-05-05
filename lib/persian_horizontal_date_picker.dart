library persian_horizontal_date_picker;

import 'package:flutter/material.dart';
import 'package:persian_horizontal_date_picker/extention/datetime_extention.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

class PersianHorizontalDatePicker extends StatefulWidget {
  final DateTime startDate;
  final DateTime endDate;
  final DateTime? initialSelectedDate;
  final List<DateTime>? markedDates;
  final Function(DateTime? date) onDateSelected;
  final bool? isPersianDate;
  final double? datePickerHieght;
  final double? itemPadding;
  final double? itemWidth;
  final double? itemRadius;
  final double? selectedItemWidth;
  final double? selectedItemRadius;
  final Color? itemBackgroundColor;
  final Color? selectedItemBackgroundColor;
  final TextStyle? itemWeekDayTextStyle;
  final TextStyle? selectedItemWeekDayTextStyle;
  final TextStyle? itemDayTextStyle;
  final TextStyle? selectedItemDayTextStyle;
  final TextStyle? itemMonthTextStyle;
  final TextStyle? selectedItemMonthTextStyle;
  final bool? hasSelectedItemShadow;
  final Color? markedDotColor;
  final Color? selectedMarkedDotColor;

  const PersianHorizontalDatePicker({
    super.key,
    required this.startDate,
    required this.endDate,
    this.initialSelectedDate,
    this.markedDates,
    required this.onDateSelected,
    this.isPersianDate = true,
    this.datePickerHieght = 112,
    this.itemPadding = 8,
    this.itemWidth = 84,
    this.itemRadius = 56,
    this.selectedItemWidth = 84,
    this.selectedItemRadius = 56,
    this.itemBackgroundColor = const Color(0xFFBBDEFB),
    this.selectedItemBackgroundColor = Colors.blue,
    this.itemWeekDayTextStyle,
    this.selectedItemWeekDayTextStyle,
    this.itemDayTextStyle,
    this.selectedItemDayTextStyle,
    this.itemMonthTextStyle,
    this.selectedItemMonthTextStyle,
    this.hasSelectedItemShadow = true,
    this.markedDotColor = Colors.blue,
    this.selectedMarkedDotColor = Colors.white,
  });

  @override
  State<PersianHorizontalDatePicker> createState() =>
      _PersianHorizontalDatePickerState();
}

class _PersianHorizontalDatePickerState
    extends State<PersianHorizontalDatePicker> {
  late AutoScrollController _scrollController;
  late ValueNotifier<DateTime?> _selectedDateValueNotifier;

  @override
  void initState() {
    _scrollController = AutoScrollController(axis: Axis.horizontal);
    _selectedDateValueNotifier =
        ValueNotifier<DateTime?>(widget.initialSelectedDate);
    if (widget.initialSelectedDate != null) {
      _scrollToInitialFocusedDate();
    }
    super.initState();
  }

  @override
  void dispose() {
    _selectedDateValueNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection:
          widget.isPersianDate! ? TextDirection.rtl : TextDirection.ltr,
      child: SizedBox(
        height: widget.hasSelectedItemShadow!
            ? widget.datePickerHieght! + 32
            : widget.datePickerHieght,
        child: ValueListenableBuilder(
          valueListenable: _selectedDateValueNotifier,
          builder: (context, selectedDate, child) {
            return ListView.builder(
              scrollDirection: Axis.horizontal,
              controller: _scrollController,
              itemCount: widget.endDate.dateDifference(widget.startDate) + 1,
              itemBuilder: (context, index) {
                DateTime itemDate = widget.startDate.add(Duration(days: index));
                bool isMarked = widget.markedDates != null
                    ? widget.markedDates!
                        .where((element) => element.isSameDate(itemDate))
                        .isNotEmpty
                    : false;
                bool isActive =
                    _isDatePickerItemSelected(itemDate, selectedDate);
                return AutoScrollTag(
                  key: ValueKey(index),
                  controller: _scrollController,
                  index: index,
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: 8,
                      right: 8,
                      bottom: widget.hasSelectedItemShadow! ? 32 : 0,
                    ),
                    child: GestureDetector(
                      onTap: () {
                        if (!_isDatePickerItemSelected(
                            itemDate, selectedDate)) {
                          _setSelectedDate(itemDate);
                          _scrollToIndex(index);
                        }
                      },
                      child: Container(
                        width: isActive
                            ? widget.selectedItemWidth
                            : widget.itemWidth,
                        decoration: ShapeDecoration(
                          shape: ContinuousRectangleBorder(
                            borderRadius: BorderRadius.circular(isActive
                                ? widget.selectedItemRadius!
                                : widget.itemRadius!),
                          ),
                          color: isActive
                              ? widget.selectedItemBackgroundColor
                              : widget.itemBackgroundColor,
                          shadows: widget.hasSelectedItemShadow! && isActive
                              ? [
                                  BoxShadow(
                                    color: widget.selectedItemBackgroundColor!,
                                    blurRadius: 25,
                                    spreadRadius: -12,
                                    offset: const Offset(0, 16),
                                  ),
                                ]
                              : [],
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(widget.itemPadding!),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                  widget.isPersianDate!
                                      ? itemDate.getJalaliWeekDay()
                                      : itemDate.getGregorianWeekDay(),
                                  style: isActive
                                      ? widget.selectedItemWeekDayTextStyle ??
                                          TextStyle(
                                            fontFamily: widget.isPersianDate!
                                                ? "Shabnam"
                                                : "Poppins",
                                            fontSize: 12,
                                            color: Colors.white,
                                          )
                                      : widget.itemWeekDayTextStyle ??
                                          TextStyle(
                                            fontFamily: widget.isPersianDate!
                                                ? "Shabnam"
                                                : "Poppins",
                                            fontSize: 12,
                                            color: Colors.blue,
                                          )),
                              Text(
                                  widget.isPersianDate!
                                      ? itemDate.getJalaliDay()
                                      : itemDate.getGregorianDay(),
                                  style: isActive
                                      ? widget.selectedItemDayTextStyle ??
                                          TextStyle(
                                            fontFamily: widget.isPersianDate!
                                                ? "Shabnam"
                                                : "Poppins",
                                            fontSize: 16,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                          )
                                      : widget.itemDayTextStyle ??
                                          TextStyle(
                                            fontFamily: widget.isPersianDate!
                                                ? "Shabnam"
                                                : "Poppins",
                                            fontSize: 16,
                                            color: Colors.blue,
                                            fontWeight: FontWeight.bold,
                                          )),
                              Text(
                                  widget.isPersianDate!
                                      ? itemDate.getJalaliMonth()
                                      : itemDate.getGregorianMonth(),
                                  style: isActive
                                      ? widget.selectedItemMonthTextStyle ??
                                          TextStyle(
                                            fontFamily: widget.isPersianDate!
                                                ? "Shabnam"
                                                : "Poppins",
                                            fontSize: 12,
                                            color: Colors.white,
                                          )
                                      : widget.itemMonthTextStyle ??
                                          TextStyle(
                                            fontFamily: widget.isPersianDate!
                                                ? "Shabnam"
                                                : "Poppins",
                                            fontSize: 12,
                                            color: Colors.blue,
                                          )),
                              isMarked
                                  ? SizedBox(
                                      width: 6,
                                      height: 6,
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(32),
                                          color: isActive
                                              ? widget.selectedMarkedDotColor ??
                                                  Colors.white
                                              : widget.markedDotColor ??
                                                  Colors.blue,
                                        ),
                                      ),
                                    )
                                  : const SizedBox(),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }

  bool _isDatePickerItemSelected(DateTime itemDate, DateTime? selectedDate) {
    if (selectedDate == null) return false;
    return itemDate.dateDifference(selectedDate) == 0;
  }

  _setSelectedDate(DateTime? date) {
    _selectedDateValueNotifier.value = date;
    widget.onDateSelected(date);
  }

  _scrollToIndex(index) async {
    await _scrollController.scrollToIndex(
      index,
      preferPosition: AutoScrollPosition.middle,
    );
  }

  _scrollToInitialFocusedDate() async {
    _scrollToIndex(
        widget.initialSelectedDate?.dateDifference(widget.startDate));
  }
}
