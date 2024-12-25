part of '../persian_horizontal_date_picker.dart';

class PersianDatePickerContent extends StatefulWidget {
  const PersianDatePickerContent({
    Key? key,
    required this.startDate,
    required this.endDate,
    this.markedDates,
    required this.onDateSelected,
    required this.isPersianDate,
    required this.datePickerHeight,
    required this.gap,
    required this.width,
    required this.verticalPadding,
    required this.radius,
    required this.backgroundColor,
    required this.selectedBackgroundColor,
    required this.onBackgroundColor,
    required this.selectedOnBackgroundColor,
    required this.weekDayTextStyle,
    required this.dayTextStyle,
    required this.monthTextStyle,
    required this.hasShadow,
    required this.shadows,
  }) : super(key: key);

  final DateTime startDate;
  final DateTime endDate;
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
  State<PersianDatePickerContent> createState() =>
      _PersianDatePickerContentState();
}

class _PersianDatePickerContentState extends State<PersianDatePickerContent> {
  late AutoScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = AutoScrollController(axis: Axis.horizontal);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final datePickerState =
          Provider.of<DatePickerState>(context, listen: false);
      if (datePickerState.selectedDate != null) {
        _scrollToInitialFocusedDate(datePickerState.selectedDate!);
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final datePickerState = Provider.of<DatePickerState>(context);
    final double shadowOffsetDY = widget.shadows
        .map((shadow) => shadow.offset.dy)
        .fold(0.0, (max, dy) => dy > max ? dy : max);
    final double heightWithShadow =
        widget.datePickerHeight + (shadowOffsetDY * 2);

    return Directionality(
      textDirection:
          widget.isPersianDate ? TextDirection.rtl : TextDirection.ltr,
      child: SizedBox(
        height: widget.hasShadow ? heightWithShadow : widget.datePickerHeight,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          controller: _scrollController,
          itemCount: widget.endDate.dateDifference(widget.startDate) + 1,
          itemBuilder: (context, index) {
            final DateTime itemDate =
                widget.startDate.add(Duration(days: index));
            final bool isMarked = widget.markedDates
                    ?.any((element) => element.isSameDate(itemDate)) ??
                false;
            final bool isActive =
                datePickerState.selectedDate?.isSameDate(itemDate) ?? false;

            return AutoScrollTag(
              key: ValueKey(index),
              controller: _scrollController,
              index: index,
              child: DateTile(
                date: itemDate,
                isActive: isActive,
                isMarked: isMarked,
                onTap: () {
                  if (!isActive) {
                    datePickerState.setSelectedDate(itemDate);
                    widget.onDateSelected(itemDate);
                    _scrollToIndex(index);
                  }
                },
                width: widget.width,
                verticalPadding: widget.verticalPadding,
                radius: widget.radius,
                backgroundColor: widget.backgroundColor,
                selectedBackgroundColor: widget.selectedBackgroundColor,
                onBackgroundColor: widget.onBackgroundColor,
                selectedOnBackgroundColor: widget.selectedOnBackgroundColor,
                weekDayTextStyle: widget.weekDayTextStyle,
                dayTextStyle: widget.dayTextStyle,
                monthTextStyle: widget.monthTextStyle,
                hasShadow: widget.hasShadow,
                shadows: widget.shadows,
                isPersianDate: widget.isPersianDate,
              ),
            );
          },
          separatorBuilder: (context, index) => SizedBox(width: widget.gap),
        ),
      ),
    );
  }

  void _scrollToIndex(int index) {
    _scrollController.scrollToIndex(
      index,
      preferPosition: AutoScrollPosition.middle,
    );
  }

  void _scrollToInitialFocusedDate(DateTime initialDate) {
    final int index = initialDate.dateDifference(widget.startDate);
    _scrollController.scrollToIndex(
      index,
      preferPosition: AutoScrollPosition.middle,
    );
  }
}
