import 'package:flutter/material.dart';
import 'package:snatch_calorie_counter/models/food.dart';
import 'package:vector_math/vector_math_64.dart' as math;

class RadialProgress extends StatefulWidget {
  final int addCalorie;
  RadialProgress(this.addCalorie);
  @override
  _RadialProgressState createState() => _RadialProgressState();
}

class _RadialProgressState extends State<RadialProgress>
    with SingleTickerProviderStateMixin {
  AnimationController _radialProgressAnimationController;
  Animation<double> _progressAnimation;
  final Duration fadeInDuration = Duration(milliseconds: 500);
  final Duration fillDuration = Duration(seconds: 2);
  double goalCompleted = 0.0;
  int totalCalorie = 400;
  int calorieLeft = 0;
  int totalGoal = 2340;
  double progressDegrees = 0;

  @override
  @override
  void initState() {
    super.initState();
    _radialProgressAnimationController =
        AnimationController(vsync: this, duration: fillDuration);
    _progressAnimation = Tween(begin: 0.0, end: 360.0).animate(CurvedAnimation(
        parent: _radialProgressAnimationController, curve: Curves.easeIn))
      ..addListener(() {
        setState(() {
          calorieLeft = totalGoal - totalCalorie;
          goalCompleted = totalCalorie / totalGoal;
          progressDegrees = goalCompleted * _progressAnimation.value;
          UserData(
              totalCalorie: totalCalorie,
              totalGoal: totalGoal,
              calorieLeft: calorieLeft);
        });
      });

    _radialProgressAnimationController.forward();
  }

  @override
  void dispose() {
    _radialProgressAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
          height: 200,
          width: 200,
          child: CustomPaint(
            child: Container(
              height: 200.0,
              width: 200.0,
              padding: EdgeInsets.symmetric(vertical: 40.0),
              child: AnimatedOpacity(
                opacity: progressDegrees > 30 ? 1.0 : 0.0,
                duration: fadeInDuration,
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 25.0,
                    ),
                    progressDegrees < 1.0
                        ? Text(
                            'Completed',
                            style: TextStyle(
                                fontSize: 35.0, fontWeight: FontWeight.bold),
                          )
                        : Column(
                            children: <Widget>[
                              Text(
                                '$calorieLeft',
                                style: TextStyle(
                                    fontSize: 40.0,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                'kCal Left',
                                style: TextStyle(
                                    fontSize: 14.0,
                                    color: Colors.red[900],
                                    letterSpacing: 1.5),
                              ),
                            ],
                          ),
                  ],
                ),
              ),
            ),
            painter: RadialPainter(progressDegrees),
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'GOAL',
              style: TextStyle(fontSize: 9),
            ),
            Container(
              height: 5.0,
              width: 80.0,
              decoration: BoxDecoration(
                  color: Colors.red[600],
                  borderRadius: BorderRadius.all(Radius.circular(4.0))),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              '$totalGoal',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'CALORIE TAKEN',
              style: TextStyle(fontSize: 9),
            ),
            Container(
              height: 5.0,
              width: 90.0,
              decoration: BoxDecoration(
                  color: Colors.blueAccent,
                  borderRadius: BorderRadius.all(Radius.circular(4.0))),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              '$totalCalorie',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        )
      ],
    );
  }
}

class RadialPainter extends CustomPainter {
  double progressInDegrees;

  RadialPainter(this.progressInDegrees);

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.black12
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = 8.0;

    Offset center = Offset(size.width / 2, size.height / 2);
    canvas.drawCircle(center, size.width / 2, paint);

    Paint progressPaint = Paint()
      ..shader = LinearGradient(
              colors: [Colors.red[100], Colors.orange[900], Colors.red[500]])
          .createShader(Rect.fromCircle(center: center, radius: size.width / 2))
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = 8.0;

    canvas.drawArc(
        Rect.fromCircle(center: center, radius: size.width / 2),
        math.radians(-90),
        math.radians(progressInDegrees),
        false,
        progressPaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
