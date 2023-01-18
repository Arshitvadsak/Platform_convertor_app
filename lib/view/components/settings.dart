import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  DateTime currentdateTime = DateTime.now();
 // String selectedDate = DateTime.now().toString();
  TimeOfDay currentTime = TimeOfDay.now();
  List<String> allmonths = [
    'January',
    'February',
    'March ',
    'April',
    'May ',
    'June ',
    'July ',
    'August',
    'September ',
    'October ',
    'november',
    'December',
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Container(
        child: Column(
          children: [
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
               const Text(
                  "Date",
                  style: TextStyle(fontSize: 18),
                ),
                Text(
                  "${currentdateTime.day},${allmonths[currentdateTime.month - 1]} ${currentdateTime.year}",
                  style: TextStyle(fontSize: 18),
                ),
              ],
            ),
            SizedBox(height: 10),
            Container(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () async {
                  DateTime? pickedDate = await showDatePicker(
                    errorFormatText: "Enter correct Date",
                    fieldLabelText: "Type Date",
                    context: context,
                    initialDate: currentdateTime,
                    firstDate: DateTime(2002),
                    lastDate: DateTime(2030),
                    builder: (context, child) {
                      return Theme(
                        data: Theme.of(context).copyWith(
                          colorScheme: const ColorScheme.light(
                            primary: Colors.teal, // theme
                            onPrimary: Colors.white, // Edit
                            onSurface: Colors.blueAccent, // Date
                          ),
                          textButtonTheme: TextButtonThemeData(
                            style: TextButton.styleFrom(
                           //   primary: Colors.red, // button text color
                            ),
                          ),
                        ),
                        child: child!,
                      );
                    },
                  );
                  setState(() {
                    if (pickedDate != null) {
                      currentdateTime = pickedDate;
                    }
                  });
                },
                child: Text(
                  "Change Date",
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.teal),
                ),
              ),
            ),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Time",
                  style: TextStyle(fontSize: 18),
                ),
                (currentTime.period.name == 'pm')
                ?(currentTime.hour == 12)?Text(
                  " 12 :${currentTime.minute} ${currentTime.period.name}",
                  style: TextStyle(fontSize: 18),
                ):Text(
                  "${currentTime.hour - 12}:${currentTime.minute} ${currentTime.period.name}",
                  style: TextStyle(fontSize: 18),
                )
                :Text(
                  "${currentTime.hour}:${currentTime.minute} ${currentTime.period.name}",
                  style: TextStyle(fontSize: 18),
                ),
              ],
            ),
            SizedBox(height: 10),
            Container(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () async {
                  TimeOfDay? pickedTime = await showTimePicker(
                    context: context,
                    initialTime: currentTime,
                    builder: (context, widget) {
                      return MediaQuery(data: MediaQuery.of(context).copyWith(
                        alwaysUse24HourFormat: false,
                      ), child: widget!,
                      );
                      // return
                      //   Theme(
                      //   data: Theme.of(context).copyWith(
                      //     // This uses the _timePickerTheme defined above
                      //     timePickerTheme: TimePickerThemeData(),
                      //     textButtonTheme: TextButtonThemeData(
                      //       style: ButtonStyle(
                      //         backgroundColor: MaterialStateColor.resolveWith((states) => Colors.red),
                      //         foregroundColor: MaterialStateColor.resolveWith((states) => Colors.white),
                      //         overlayColor: MaterialStateColor.resolveWith((states) => Colors.green),
                      //       ),
                      //     ),
                      //   ),
                      //   child: widget!,
                      // );
                    },
                  );
                  setState(() {
                    if (pickedTime != null) {
                      currentTime = pickedTime;
                    }
                  });
                },
                child: Text(
                  "Change Time",
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.teal),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
