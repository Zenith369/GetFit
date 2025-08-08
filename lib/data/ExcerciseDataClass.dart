import 'dart:ui';

enum ExerciseType{PushUps, Squats, PlankDownwardDog, JumpingJack}
class ExcerciseDataClass{
  String title;
  String image;
  Color color;
  ExerciseType type;
  ExcerciseDataClass(this.title, this.image, this.color, this.type);
}