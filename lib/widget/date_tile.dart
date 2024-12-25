part of '../persian_horizontal_date_picker.dart';

class DateTile extends StatelessWidget {
  const DateTile({
    super.key,
    required this.date,
    required this.isActive,
    required this.isMarked,
    required this.onTap,
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
    required this.isPersianDate,
  });

  final DateTime date;
  final bool isActive;
  final bool isMarked;
  final VoidCallback onTap;
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
  final bool isPersianDate;

  @override
  Widget build(BuildContext context) {
    final TextStyle effectiveWeekDayTextStyle = weekDayTextStyle?.copyWith(
          color: isActive ? selectedOnBackgroundColor : onBackgroundColor,
        ) ??
        TextStyle(
            fontSize: 12,
            color: isActive ? selectedOnBackgroundColor : onBackgroundColor);

    final TextStyle effectiveDayTextStyle = dayTextStyle?.copyWith(
          color: isActive ? selectedOnBackgroundColor : onBackgroundColor,
        ) ??
        TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: isActive ? selectedOnBackgroundColor : onBackgroundColor,
        );

    final TextStyle effectiveMonthTextStyle = monthTextStyle?.copyWith(
          color: isActive ? selectedOnBackgroundColor : onBackgroundColor,
        ) ??
        TextStyle(
            fontSize: 12,
            color: isActive ? selectedOnBackgroundColor : onBackgroundColor);

    final List<BoxShadow> effectiveShadows = hasShadow && isActive
        ? (shadows.isNotEmpty
            ? shadows
            : [
                BoxShadow(
                  color: selectedBackgroundColor,
                  blurRadius: 25,
                  spreadRadius: -12,
                  offset: const Offset(0, 16),
                ),
              ])
        : [];

    final double bottomPadding = hasShadow
        ? (shadows.isNotEmpty
            ? shadows
                    .map((shadow) => shadow.offset.dy)
                    .reduce((max, dy) => dy > max ? dy : max) *
                2
            : 32)
        : 0;

    return Padding(
      padding: EdgeInsets.only(bottom: bottomPadding),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: width,
          padding: EdgeInsets.symmetric(vertical: verticalPadding),
          decoration: ShapeDecoration(
            shape: ContinuousRectangleBorder(
              borderRadius: BorderRadius.circular(radius),
            ),
            color: isActive ? selectedBackgroundColor : backgroundColor,
            shadows: effectiveShadows,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                isPersianDate
                    ? date.getJalaliWeekDay()
                    : date.getGregorianWeekDay(),
                style: effectiveWeekDayTextStyle,
              ),
              Text(
                isPersianDate ? date.getJalaliDay() : date.getGregorianDay(),
                style: effectiveDayTextStyle,
              ),
              Text(
                isPersianDate
                    ? date.getJalaliMonth()
                    : date.getGregorianMonth(),
                style: effectiveMonthTextStyle,
              ),
              if (isMarked)
                Container(
                  width: 6,
                  height: 6,
                  decoration: BoxDecoration(
                    color: isActive
                        ? selectedOnBackgroundColor
                        : onBackgroundColor,
                    shape: BoxShape.circle,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
