import 'package:flutter/material.dart';
import 'package:flutter_time_picker_spinner/flutter_time_picker_spinner.dart';

class TimePickerSpinnerPage extends StatefulWidget {
  const TimePickerSpinnerPage({Key? key}) : super(key: key);

  @override
  State<TimePickerSpinnerPage> createState() => _TimePickerSpinnerPageState();
}

class _TimePickerSpinnerPageState extends State<TimePickerSpinnerPage> {
  DateTime _dateTime = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Time Picker Spinner'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextFormField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                label: Text('Time'),
              ),
            ),
            ElevatedButton(
              child: const Text('Get Time'),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      content: hourMinute24H(),
                    );
                  },
                );
              },
            ),
            Text(
              _dateTime.hour.toString().padLeft(2, '0') +
                  ':' +
                  _dateTime.minute.toString().padLeft(2, '0'),
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget hourMinute12H() {
    return TimePickerSpinner(
      is24HourMode: false,
      onTimeChange: (time) {
        setState(() {
          _dateTime = time;
        });
      },
    );
  }

  Widget hourMinute24H() {
    return TimePickerSpinner(
      is24HourMode: true,
      onTimeChange: (time) {
        setState(() {
          _dateTime = time;
        });
      },
    );
  }

  Widget hourMinute12HCustomStyle() {
    return TimePickerSpinner(
      is24HourMode: false,
      normalTextStyle: const TextStyle(
        fontSize: 24,
        color: Colors.deepOrange,
      ),
      highlightedTextStyle: const TextStyle(
        fontSize: 24,
        color: Colors.yellow,
      ),
      spacing: 20,
      itemHeight: 80,
      isForce2Digits: true,
      minutesInterval: 5,
      onTimeChange: (time) {
        setState(() {
          _dateTime = time;
        });
      },
    );
  }

  Widget hourMinute24HCustomStyle() {
    return TimePickerSpinner(
      is24HourMode: true,
      normalTextStyle: const TextStyle(
        fontSize: 24,
        color: Colors.deepOrange,
      ),
      highlightedTextStyle: const TextStyle(
        fontSize: 24,
        color: Colors.yellow,
      ),
      spacing: 20,
      itemHeight: 80,
      isForce2Digits: true,
      minutesInterval: 5,
      onTimeChange: (time) {
        setState(() {
          _dateTime = time;
        });
      },
    );
  }
}
