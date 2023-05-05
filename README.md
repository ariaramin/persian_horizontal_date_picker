# Persian Horizontal Date Picker

A customizable horizontal date picker library for Flutter. Support both jalali and gregorian dates.

![screenshot](https://raw.githubusercontent.com/ariaramin/persian_horizontal_date_picker/master/preview/screenshot.png)

## Getting started

1.Add it to your package's pubspec.yaml file

```yaml
dependencies:
  persian_horizontal_date_picker: ^0.1.0
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
| markedDates                 | List<DateTime\>?          | null                   |
| onDateSelected              | Function(DateTime? date) |                        |
| isPersianDate               | bool?                    | true                   |
| datePickerHieght            | double?                  | 112                    |
| itemPadding                 | double?                  | 8                      |
| itemWidth                   | double?                  | 84                     |
| itemRadius                  | double?                  | 56                     |
| selectedItemWidth           | double?                  | 84                     |
| selectedItemRadius          | double?                  | 56                     |
| itemBackgroundColor         | Color?                   | Color(0xFFBBDEFB)      |
| selectedItemBackgroundColor | Color?                   | Colors.blue            |
| itemWeekDayTextStyle        | TextStyle?               | TextStyle(fontFamily: "Shabnam", fontSize: 12, color: Colors.blue)  |
| selectedItemWeekDayTextStyle | TextStyle?              | TextStyle(fontFamily: "Shabnam", fontSize: 12, color: Colors.white) |
| itemDayTextStyle            | TextStyle?               | TextStyle(fontFamily: "Shabnam", fontSize: 16, color: Colors.blue, fontWeight: FontWeight.bold)  |
| selectedItemDayTextStyle    | TextStyle?               | TextStyle(fontFamily: "Shabnam", fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold) |
| itemMonthTextStyle        | TextStyle?               | TextStyle(fontFamily: "Shabnam", fontSize: 12, color: Colors.blue)  |
| selectedItemMonthTextStyle | TextStyle?              | TextStyle(fontFamily: "Shabnam", fontSize: 12, color: Colors.white) |
| hasSelectedItemShadow       | bool?                    | true                   |
| markedDotColor              | Color?                   | Colors.blue            |
| selectedMarkedDotColor      | Color?                   | Colors.white           |

## Donation

<a href="https://www.coffeebede.com/ariaramin">
<img class="img-fluid" src="https://coffeebede.ir/DashboardTemplateV2/app-assets/images/banner/default-yellow.svg" width=30%/>
</a>
