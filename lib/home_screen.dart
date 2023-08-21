import 'dart:math';

import 'package:bmi_app/result_screen.dart';
import 'package:flutter/material.dart';
import 'colors.dart';
import 'package:bmi_app/info.dart';

class Home_screen extends StatefulWidget {
  const Home_screen({
    super.key,
  });

  @override
  State<Home_screen> createState() => _Home_screenState();
}

class _Home_screenState extends State<Home_screen> {
  bool isMale = true;
  int height = 170;
  Info info = Info(true, 170, 25, 90);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('BMI'),
          centerTitle: true,
          elevation: 0,
        ),
        backgroundColor: myprimary.shade400,
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () => setState(() {
                            info.isMale = true;
                          }),
                          child: gender(
                            context,
                            text: 'male',
                            male: info.isMale,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 24,
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () => setState(() {
                            info.isMale = false;
                          }),
                          child: gender(
                            context,
                            text: 'female',
                            male: info.isMale,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                Expanded(
                    child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Height is: ${info.height}',
                        style: const TextStyle(
                          color: myprimary,
                          fontSize: 32,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Slider(
                        thumbColor: myprimary,
                        value: info.height.toDouble(),
                        onChanged: (value) {
                          setState(() {
                            info.height = value.round();
                          });
                        },
                        max: 220,
                        min: 150,
                      ),
                    ],
                  ),
                )),
                const SizedBox(
                  height: 24,
                ),
                Expanded(
                  child: Row(children: [
                    Expanded(
                        child:
                            adjustValue(context, info: info, valueName: 'age')),
                    const SizedBox(
                      width: 24,
                    ),
                    Expanded(
                        child: adjustValue(context,
                            info: info, valueName: 'weight')),
                  ]),
                ),
                const SizedBox(
                  height: 24,
                ),
                MaterialButton(
                  color: Colors.white,
                  minWidth: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  onPressed: () {
                    setState(() {
                      info.result = (info.weight / pow(info.height / 100, 2))
                          .toStringAsFixed(1);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Result(info)));
                    });
                  },
                  textColor: myprimary,
                  child: const Text(
                    'Calculate',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  TextStyle normalTextStyle = const TextStyle(
    color: myprimary,
    fontSize: 40,
    fontWeight: FontWeight.bold,
  );
  TextStyle chosenTextStyle = const TextStyle(
    color: Colors.white,
    fontSize: 40,
    fontWeight: FontWeight.bold,
  );

  Widget gender(BuildContext context, {required text, required bool male}) {
    return Container(
      decoration: BoxDecoration(
          color: !((male) ^ (text == 'male')) ? myprimary : Colors.white,
          borderRadius: BorderRadius.circular(20)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            text == 'male' ? Icons.male : Icons.female,
            size: 80,
            color: !((male) ^ (text == 'male')) ? Colors.white : myprimary,
          ),
          Text(
            text,
            style: !((male) ^ (text == 'male'))
                ? chosenTextStyle
                : normalTextStyle,
          )
        ],
      ),
    );
  }

  Widget adjustValue(BuildContext context,
      {String? valueName, required Info info}) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(20)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            valueName!,
            style: normalTextStyle,
          ),
          Text(
            (valueName == 'age' ? info.age : info.weight).toString(),
            style: normalTextStyle,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FloatingActionButton(
                heroTag: 'Decreasing $valueName',
                onPressed: () {
                  setState(() => valueName == 'age'
                      ? info.age > 0
                          ? info.age--
                          : info.age = 0
                      : info.weight > 0
                          ? info.weight--
                          : info.weight = 0);
                },
                mini: true,
                child: const Icon(Icons.remove),
              ),
              FloatingActionButton(
                heroTag: 'Increasing $valueName',
                onPressed: () {
                  setState(
                      () => valueName == 'age' ? info.age++ : info.weight++);
                },
                mini: true,
                child: const Icon(Icons.add),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
