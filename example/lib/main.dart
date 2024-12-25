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
      theme: ThemeData(fontFamily: 'Shabnam'),
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Persian Horizontal Date Picker"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            PersianHorizontalDatePicker(
              startDate: DateTime.now(),
              endDate: DateTime.now().add(const Duration(days: 30)),
              initialSelectedDate: DateTime.now(),
              markedDates: [DateTime.now()],
              isPersianDate: true,
              datePickerHeight: 112,
              width: 84,
              verticalPadding: 12,
              radius: 56,
              backgroundColor: const Color(0xFFBBDEFB),
              selectedBackgroundColor: Colors.blue,
              onBackgroundColor: Colors.blue,
              selectedOnBackgroundColor: Colors.white,
              weekDayTextStyle: const TextStyle(fontSize: 12),
              dayTextStyle: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
              monthTextStyle: const TextStyle(fontSize: 12),
              hasShadow: true,
              shadows: const [
                BoxShadow(
                  color: Colors.blue,
                  blurRadius: 25,
                  spreadRadius: -12,
                  offset: Offset(0, 16),
                ),
              ],
              onDateSelected: (date) {},
            ),
          ],
        ),
      ),
    );
  }
}
