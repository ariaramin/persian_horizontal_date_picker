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
                datePickerHeight: 112,
                contentPadding: const EdgeInsets.all(8),
                width: 84,
                radius: 56,
                backgroundColor: const Color(0xFFBBDEFB),
                selectedBackgroundColor: Colors.blue,
                textColor: Colors.blue,
                selectedTextColor: Colors.white,
                hasSelectedItemShadow: true,
                markedDotColor: Colors.blue,
                selectedMarkedDotColor: Colors.white,
                onDateSelected: (date) {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
