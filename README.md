# Persian Horizontal Date Picker

A customizable horizontal date picker library for Flutter. Support both jalali and gregorian dates.

![screenshot](https://raw.githubusercontent.com/ariaramin/persian_horizontal_date_picker/master/preview/screenshot.png)

## Getting started

1.Add it to your package's pubspec.yaml file

```yaml
dependencies:
  persian_horizontal_date_picker: ^2.0.0
```

2.Install packages from the command line

```BASH
flutter pub get
```

3.Import the package:

```dart
import 'package:persian_horizontal_date_picker/persian_horizontal_date_picker.dart';
```

## Usage

Use the `PersianHorizontalDatePicker` widget

```dart
PersianHorizontalDatePicker(
    startDate: DateTime.now(),
    endDate: DateTime.now().add(const Duration(days: 30)),
    initialSelectedDate: DateTime.now(),
    onDateSelected: (date) {},
  )
```

## Parameters

| Parameter                   | Type                     | Default Value                                                                               | Description                                             |
|-----------------------------|--------------------------|---------------------------------------------------------------------------------------------|---------------------------------------------------------|
| `startDate`                 | `DateTime`              | `—`                                                                                            | The starting date of the picker.                       |
| `endDate`                   | `DateTime`              | `—`                                                                                            | The ending date of the picker.                         |
| `initialSelectedDate`       | `DateTime?`             | `null`                                                                                      | The date initially selected when the picker loads.     |
| `markedDates`               | `List<DateTime>?`       | `null`                                                                                      | Dates marked with a dot or special indication.         |
| `onDateSelected`            | `Function(DateTime?)`   | `—`                                                                                         | Callback triggered when a date is selected.            |
| `isPersianDate`             | `bool`                  | `true`                                                                                      | Whether the picker uses the Persian calendar system.   |
| `datePickerHeight`          | `double`                | `112`                                                                                       | The height of the date picker.                         |
| `gap`                       | `double`                | `—`                                                                                            | Gap between date tiles.                                |
| `width`                     | `double`                | `84`                                                                                        | The width of each date tile.                           |
| `verticalPadding`           | `double`                | `12`                                                                                        | Vertical padding inside each date tile.                |
| `radius`                    | `double`                | `56`                                                                                        | Corner radius for tiles.                               |
| `backgroundColor`           | `Color`                 | `Color(0xFFBBDEFB)`                                                                         | Background color for inactive tiles.                   |
| `selectedBackgroundColor`   | `Color`                 | `Colors.blue`                                                                               | Background color for selected tiles.                   |
| `onBackgroundColor`         | `Color`                 | `Colors.blue`                                                                               | Default text color for inactive tiles.                 |
| `selectedOnBackgroundColor` | `Color`                 | `Colors.white`                                                                              | Text color for selected tiles.                         |
| `weekDayTextStyle`          | `TextStyle?`            | `TextStyle(fontSize: 12)`                                                                   | Style for weekday labels.                              |
| `dayTextStyle`              | `TextStyle?`            | `TextStyle(fontSize: 16, fontWeight: FontWeight.bold)`                                      | Style for day labels.                                  |
| `monthTextStyle`            | `TextStyle?`            | `TextStyle(fontSize: 12)`                                                                   | Style for month labels.                                |
| `hasShadow`                 | `bool`                  | `true`                                                                                      | Whether tiles have a shadow effect.                    |
| `shadows`                   | `List<BoxShadow>`       | `[BoxShadow(color: Colors.blue, blurRadius: 25, spreadRadius: -12, offset: Offset(0, 16))]` | List of shadows for selected tiles.   |

## Migration Guide
- Replace `margin` with `gap`.
- Replace `contentPadding` with `verticalPadding`.
- Replace `hasSelectedItemShadow` with `hasShadow`.
- Deprecated parameter `textColor` has been removed.
- Deprecated parameter `selectedTextColor` has been removed.
- Deprecated parameter `selectedWeekDayTextStyle` has been removed.
- Deprecated parameter `selectedDayTextStyle` has been removed.
- Deprecated parameter `selectedMonthTextStyle` has been removed.
- Deprecated parameter `markedDotColor` has been removed.
- Deprecated parameter `selectedMarkedDotColor` has been removed.
