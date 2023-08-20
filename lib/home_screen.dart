import 'package:flutter/material.dart';
import 'colors.dart';

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
                            isMale = true;
                          }),
                          child: gender(
                            context,
                            text: 'male',
                            male: isMale,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 24,
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () => setState(() {
                            isMale = false;
                          }),
                          child: gender(
                            context,
                            text: 'female',
                            male: isMale,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
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
                        'Height is: $height',
                        style: const TextStyle(
                          color: myprimary,
                          fontSize: 32,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Slider(
                        value: height.toDouble(),
                        onChanged: (value) {
                          setState(() {
                            height = value.round();
                          });
                        },
                        max: 220,
                        min: 150,
                      ),
                    ],
                  ),
                )),
                SizedBox(
                  height: 24,
                ),
                Expanded(
                  child: Row(children: [
                    Expanded(
                        child:
                            adjustValue(context, info: info, valueName: 'age')),
                    SizedBox(
                      width: 24,
                    ),
                    Expanded(
                        child: adjustValue(context,
                            info: info, valueName: 'weight')),
                  ]),
                ),
                SizedBox(
                  height: 24,
                ),
                MaterialButton(
                  color: Colors.white,
                  minWidth: double.infinity,
                  padding: EdgeInsets.symmetric(vertical: 20),
                  onPressed: () {},
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
                onPressed: () {
                  setState(
                      () => valueName == 'age' ? info.age-- : info.weight--);
                },
                mini: true,
                child: Icon(Icons.remove),
              ),
              FloatingActionButton(
                onPressed: () {
                  setState(
                      () => valueName == 'age' ? info.age++ : info.weight++);
                },
                mini: true,
                child: Icon(Icons.add),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class Info {
  bool isMale;
  int height;
  int age;
  int weight;
  Info(this.isMale, this.height, this.age, this.weight);
}
