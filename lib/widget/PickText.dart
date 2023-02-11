import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PickTimeView extends StatefulWidget {
  DateTime time = DateTime.now();
  Function(DateTime)? onTimeChanged;

  PickTimeView(this.time, this.onTimeChanged);

  @override
  State<PickTimeView> createState() =>
      _PickTimeViewState().newTime(time).onChanged(onTimeChanged);
}

class _PickTimeViewState extends State<PickTimeView> {
  DateTime time = DateTime.now();
  Function(DateTime)? onTimeChanged;

  _PickTimeViewState newTime(DateTime time) {
    this.time = time;
    return this;
  }

  _PickTimeViewState onChanged(Function(DateTime)? callback) {
    onTimeChanged = callback;
    return this;
  }

  String parseTime() {
    return "${time.day}/${time.month}/${time.year}";
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showDatePicker(
                context: context,
                initialDate: time,
                firstDate: DateTime(2000),
                lastDate: DateTime(2030))
            .then((time) {
          setState(() {
            this.time = time!;
            onTimeChanged != null ? (time) : null;
          });
        });
      },
      child: Text(parseTime()),
    );
  }
}
