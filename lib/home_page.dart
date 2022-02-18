import 'package:date_time_picker/nativo_date_time_picker_page.dart';
import 'package:date_time_picker/time_picker_spinner_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Date Time Picker'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
              child: const Text('TimePicker Package'),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const TimePickerSpinnerPage();
                }));
              },
            ),
            ElevatedButton(
              child: const Text('TimePicker Nativo'),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const NativoDateTimePickerPage();
                }));
              },
            ),
          ],
        ),
      ),
    );
  }
}
