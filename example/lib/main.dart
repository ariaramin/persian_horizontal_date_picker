import 'package:flutter/material.dart';
import 'package:persian_horizontal_date_picker/persian_horizontal_date_picker.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Persian Horizontal Date Picker',
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Persian Horizontal Date Picker"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              PersianHorizontalDatePicker(
                startDate: DateTime.now(),
                endDate: DateTime.now().add(const Duration(days: 30)),
                initialSelectedDate: DateTime.now(),
                markedDates: [DateTime.now()],
                isPersianDate: true,
                datePickerHieght: 112,
                itemPadding: 8,
                itemWidth: 84,
                itemRadius: 56,
                selectedItemWidth: 84,
                selectedItemRadius: 56,
                itemBackgroundColor: const Color(0xFFBBDEFB),
                selectedItemBackgroundColor: Colors.blue,
                itemWeekDayTextStyle: const TextStyle(
                  fontFamily: "Shabnam",
                  fontSize: 12,
                  color: Colors.blue,
                ),
                selectedItemWeekDayTextStyle: const TextStyle(
                  fontFamily: "Shabnam",
                  fontSize: 12,
                  color: Colors.white,
                ),
                itemDayTextStyle: const TextStyle(
                  fontFamily: "Shabnam",
                  fontSize: 16,
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                ),
                selectedItemDayTextStyle: const TextStyle(
                  fontFamily: "Shabnam",
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
                itemMonthTextStyle: const TextStyle(
                  fontFamily: "Shabnam",
                  fontSize: 12,
                  color: Colors.blue,
                ),
                selectedItemMonthTextStyle: const TextStyle(
                  fontFamily: "Shabnam",
                  fontSize: 12,
                  color: Colors.white,
                ),
                hasSelectedItemShadow: true,
                markedDotColor: Colors.blue,
                selectedMarkedDotColor: Colors.white,
                onDateSelected: (date) {},
              ),
            ],
          ),
        ), // This trailing comma makes auto-formatting nicer for build methods.
      ),
    );
  }
}
