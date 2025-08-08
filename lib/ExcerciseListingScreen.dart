import 'package:flutter/material.dart';
import 'package:pose_detection_realtime/ExcerciseDetectionScreen.dart';
import 'package:pose_detection_realtime/data/ExcerciseDataClass.dart';

class ExcerciseListingScreen extends StatefulWidget {
  const ExcerciseListingScreen({super.key});

  @override
  State<ExcerciseListingScreen> createState() => _ExcerciseListingScreenState();
}

class _ExcerciseListingScreenState extends State<ExcerciseListingScreen> {
  List<ExcerciseDataClass> exercisesList = [];

  loadData() {
    exercisesList.add(
      ExcerciseDataClass(
        "Push Ups",
        "pushup.gif",
        Color(0xff1755E3),
        ExerciseType.PushUps,
      ),
    );
    exercisesList.add(
      ExcerciseDataClass(
        "Squats",
        "squat.gif",
        Color(0xff9E2BF0),
        ExerciseType.Squats,
      ),
    );
    exercisesList.add(
      ExcerciseDataClass(
        "Plank to Downward Dog",
        "plank.gif",
        Color(0xffFAE139),
        ExerciseType.PlankDownwardDog,
      ),
    );
    exercisesList.add(
      ExcerciseDataClass(
        "Jumping Jack",
        "jumping.gif",
        Color(0xff141010),
        ExerciseType.JumpingJack,
      ),
    );
    setState(() {
      exercisesList;
    });
  }

  @override
  void initState() {
    super.initState();
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('AI Workout')),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder:
                      (context) => ExcerciseDetectionScreen(
                        exercisesList: exercisesList[index],
                      ),
                ),
              );
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: exercisesList[index].color,
              ),
              height: 150,
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(10),
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      exercisesList[index].title,
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        shadows: <Shadow>[
                          Shadow(blurRadius: 3.0, offset: Offset(1.0, 0.0)),
                        ],
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Image.asset('assets/${exercisesList[index].image}'),
                  ),
                ],
              ),
            ),
          );
        },
        itemCount: exercisesList.length,
      ),
    );
  }
}
