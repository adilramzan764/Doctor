import 'package:flutter/material.dart';

class YourWidget extends StatefulWidget {
  @override
  _YourWidgetState createState() => _YourWidgetState();
}

class _YourWidgetState extends State<YourWidget> {
  final List<String> days = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"];
  List<List<String>> appointments = List.generate(6, (_) => []);

  Future<void> _selectStartTime(int index) async {
    TimeOfDay? startTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (startTime != null) {
      TimeOfDay? endTime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay(hour: startTime.hour + 1, minute: startTime.minute),
      );

      if (endTime != null) {
        setState(() {
          appointments[index].add('${startTime.format(context)} - ${endTime.format(context)}');
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: days.length,
      itemBuilder: (context, index) {
        final day = days[index];
        final dayAppointments = appointments[index];

        return Container(
          child: Table(
            border: TableBorder.all(color: Colors.grey),
            children: [
              TableRow(
                children: [
                  TableCell(
                    child: Text(day),
                  ),
                  TableCell(child:
                    ElevatedButton(
                      onPressed: () {
                        _selectStartTime(index);
                      },
                      child: Text(
                        'Add Session Time',
                        style: TextStyle(fontSize: 14, decoration: TextDecoration.none), // Set decoration to none
                      ),
                    ),)
                ],
              ),
              TableRow(
                children: [
                  TableCell(child: SizedBox()),
                  TableCell(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: dayAppointments.map((appointment) {
                          return Text(
                            appointment,
                            style: TextStyle(fontSize: 14, decoration: TextDecoration.none), // Set decoration to none
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
