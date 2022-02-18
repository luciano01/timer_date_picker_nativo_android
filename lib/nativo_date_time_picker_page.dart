import 'package:flutter/material.dart';

class NativoDateTimePickerPage extends StatefulWidget {
  const NativoDateTimePickerPage({Key? key}) : super(key: key);

  @override
  State<NativoDateTimePickerPage> createState() =>
      _NativoDateTimePickerPageState();
}

class _NativoDateTimePickerPageState extends State<NativoDateTimePickerPage> {
  var completeTime = '';
  var completeDate = '';
  var valueTime = TextEditingController();
  var valueDate = TextEditingController();
  var valueDateRange = TextEditingController();

  var selectedHour = '';

  bool is24Hour = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nativo Date and Time Picker'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Center(
              child: Row(
                children: [
                  Checkbox(
                    value: is24Hour,
                    onChanged: (value) {
                      setState(() {
                        is24Hour = !is24Hour;
                      });
                    },
                  ),
                  const Text('Is 24 hour?'),
                ],
              ),
            ),
            TextFormField(
              controller: valueTime,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                label: Text('Time'),
              ),
              enableInteractiveSelection: false,
              focusNode: AlwaysDisabledFocusNode(),
              onTap: () async {
                TimeOfDay? picked = await showTimePicker(
                  context: context,
                  initialTime: TimeOfDay.now(),
                  builder: (context, child) {
                    return MediaQuery(
                      data: MediaQuery.of(context).copyWith(
                        alwaysUse24HourFormat: is24Hour,
                      ),
                      child: child!,
                    );
                  },
                );
                if (picked != null) {
                  setState(() {
                    selectedHour = picked.format(context);
                    valueTime.text = picked.format(context);
                  });
                }
              },
            ),
            const SizedBox(height: 30),
            TextFormField(
              controller: valueDate,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                label: Text('Date'),
              ),
              enableInteractiveSelection: false,
              focusNode: AlwaysDisabledFocusNode(),
              onTap: () async {
                DateTime? picked = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime.now(),
                  lastDate: DateTime(2030),
                  builder: (context, child) {
                    return child!;
                  },
                );
                if (picked != null) {
                  setState(() {
                    var tempDay = picked.day;
                    var tempMonth = picked.month;
                    var tempYear = picked.year;
                    completeDate = '$tempDay/$tempMonth/$tempYear';
                    valueDate.text = completeDate;
                  });
                }
              },
            ),
            const SizedBox(height: 30),
            TextFormField(
              controller: valueDateRange,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                label: Text('Date com Range'),
              ),
              enableInteractiveSelection: false,
              focusNode: AlwaysDisabledFocusNode(),
              onTap: () async {
                DateTime? picked = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime.now(),
                  lastDate: DateTime(2030),
                  builder: (context, child) {
                    return child!;
                  },
                );
                if (picked != null) {
                  setState(() {
                    var tempDay = picked.day;
                    var tempMonth = picked.month;
                    var tempYear = picked.year;
                    completeDate = '$tempDay/$tempMonth/$tempYear';
                    valueDate.text = completeDate;
                  });
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

class AlwaysDisabledFocusNode extends FocusNode {
  @override
  bool get hasFocus => false;
}
