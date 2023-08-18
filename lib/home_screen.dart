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
            padding: const EdgeInsets.only(top: 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                )),
                Expanded(child: Row()),
                Expanded(child: Row()),
                MaterialButton(
                  color: Colors.white,
                  minWidth: double.infinity,
                  padding: EdgeInsets.symmetric(vertical: 20),
                  onPressed: () {},
                  child: Text(
                    'Calculate',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  textColor: myprimary,
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
      margin: const EdgeInsets.all(10),
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
}
