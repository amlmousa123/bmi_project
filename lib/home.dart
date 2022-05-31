import 'package:bmi_project/result.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isMale = true;
  double height = 170.0;
  int weight = 50;
  int age = 22;
  double result = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Body Mass Index'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
                child: Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                children: [
                  GenderBox(context, 'male'),
                  const SizedBox(width: 15),
                  GenderBox(context, 'female')
                ],
              ),
            )),
            Expanded(
                child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.blueGrey),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Height',
                      style: Theme.of(context).textTheme.headline2,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      //crossAxisAlignment: CrossAxisAlignment.baseline,
                      children: [
                        Text(height.toStringAsFixed(1),
                            style: Theme.of(context).textTheme.headline1),
                        Text('CM', style: Theme.of(context).textTheme.bodyText1)
                      ],
                    ),
                    Slider(
                      value: height,
                      onChanged: (value) {
                        setState(() {
                          height = value;
                        });
                      },
                      min: 90,
                      max: 220,
                    )
                  ],
                ),
              ),
            )),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: [
                    m2Expanded(context, 'weight'),
                    SizedBox(width: 15),
                    m2Expanded(context, 'age')
                  ],
                ),
              ),
            ),
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height / 16,
              color: Colors.teal,
              child: TextButton(
                onPressed: () {
                  setState(() {
                    result = weight / pow(height / 100, 2);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ResultScreen(
                                isMale: isMale, result: result, age: age)));
                  });
                },
                child: Text('calcuate',
                    style: TextStyle(fontSize: 25, color: Colors.white)),
              ),
            )
          ],
        ),
      ),
    );
  }

  Expanded GenderBox(BuildContext context, String type) {
    return Expanded(
        child: GestureDetector(
      onTap: () {
        setState(() {
          isMale = (type == 'male') ? true : false;
        });
      },
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: type == 'male' ? Colors.teal : Colors.blueGrey),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(type == 'male' ? Icons.male : Icons.female, size: 90),
            Text(
              type == 'male' ? 'Male' : 'Female',
              style: Theme.of(context).textTheme.headline2,
            )
          ],
        ),
      ),
    ));
  }

  Expanded m2Expanded(BuildContext context, String type) {
    return Expanded(
        child: Container(
      decoration: BoxDecoration(
        color: Colors.blueGrey,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            type == 'weight' ? 'Weight' : 'Age',
            style: Theme.of(context).textTheme.headline2,
          ),
          Text(type == 'weight' ? '$weight' : '$age',
              style: Theme.of(context).textTheme.headline1),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FloatingActionButton(
                child: Icon(Icons.remove),
                heroTag: type == 'age' ? 'age--' : 'weight--',
                onPressed: () {
                  setState(() {
                    type == 'weight' ? weight-- : age--;
                  });
                },
                mini: true,
              ),
              SizedBox(width: 8),
              FloatingActionButton(
                child: Icon(Icons.add),
                heroTag: type == 'age' ? 'age++' : 'weight++',
                onPressed: () {
                  setState(() {
                    type == 'weight' ? weight++ : age++;
                  });
                },
                mini: true,
              ),
            ],
          )
        ],
      ),
    ));
  }
}
