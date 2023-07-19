# Persian Horizontal Date Picker

A customizable horizontal date picker library for Flutter. Support both jalali and gregorian dates.

![screenshot](https://raw.githubusercontent.com/ariaramin/persian_horizontal_date_picker/master/preview/screenshot.png)

## Getting started

1.Add it to your package's pubspec.yaml file

```yaml
dependencies:
  persian_horizontal_date_picker: ^0.1.6
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

| Parameter                   | Type                     | Default                |
|-----------------------------|--------------------------|------------------------|
| startDate                   | DateTime                 |                        |
| endDate                     | DateTime                 |                        |
| initialSelectedDate         | DateTime?                | null                   |
| markedDates                 | List<DateTime\>?         | null                  |
| onDateSelected              | Function(DateTime? date) |                        |
| isPersianDate               | bool?                    | true                   |
| datePickerHieght            | double?                  | 112                    |
| margin                      | double?                  | 8                      |
| contentPadding              | EdgeInsets?              | EdgeInsets.all(8)      |
| width                   | double?                  | 84                     |
| radius                  | double?                  | 56                     |
| backgroundColor         | Color?                   | Color(0xFFBBDEFB)      |
| selectedBackgroundColor | Color?                   | Colors.blue            |
| textColor         | Color?                   | Colors.blue   |
| selectedTextColor | Color?                   | Colors.white            |
| weekDayTextStyle        | TextStyle?               | TextStyle(fontSize: 12, color: Colors.blue)  |
| selectedWeekDayTextStyle | TextStyle?              | TextStyle(fontSize: 12, color: Colors.white) |
| dayTextStyle            | TextStyle?               | TextStyle(fontSize: 16, color: Colors.blue, fontWeight: FontWeight.bold)  |
| selectedDayTextStyle    | TextStyle?               | TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold) |
| monthTextStyle        | TextStyle?               | TextStyle(fontSize: 12, color: Colors.blue)  |
| selectedMonthTextStyle | TextStyle?              | TextStyle(fontSize: 12, color: Colors.white) |
| hasSelectedItemShadow       | bool?                    | true                   |
| markedDotColor              | Color?                   | Colors.blue            |
| selectedMarkedDotColor      | Color?                   | Colors.white           |

## Donation
<a href="https://www.coffeebede.com/ariaramin"> <img class="img-fluid" src="https://coffeebede.ir/DashboardTemplateV2/app-assets/images/banner/default-yellow.svg" width="210" /> </a>