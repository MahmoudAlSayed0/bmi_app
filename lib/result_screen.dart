import 'package:flutter/material.dart';
import 'package:bmi_app/info.dart';
import 'colors.dart';

class Result extends StatelessWidget {
  Info info;
  Result(this.info);
  TextStyle normalTextStyle = const TextStyle(
    color: myprimary,
    fontSize: 40,
    fontWeight: FontWeight.bold,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Result'),
        centerTitle: true,
        elevation: 0,
      ),
      backgroundColor: myprimary.shade400,
      body: Center(
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          child: DefaultTextStyle(
            style: normalTextStyle,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 24),
                Text('Result is ${info.result}'),
                Text('Age ${info.age}'),
                Text('Weight ${info.weight}'),
                Text('Height ${info.height}'),
                Text('Gender ${info.isMale ? 'male' : 'female'}'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
