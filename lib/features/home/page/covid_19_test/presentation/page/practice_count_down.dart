import 'package:Tellme/features/home/page/covid_19_test/providers/count_down_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PracticeCountDown extends StatefulWidget {
  const PracticeCountDown({super.key});

  @override
  State<PracticeCountDown> createState() => _PracticeCountDownState();
}

class _PracticeCountDownState extends State<PracticeCountDown> {
  @override
  Widget build(BuildContext context) {
    final countdownProvider = Provider.of<CountdownProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Prueba counter"),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.restore)),
        ],
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.alarm, size: 70),
            SizedBox(width: 20),
            Text(
              context.select(
                  (CountdownProvider countdown) => countdown.timeLeftString),
              style: TextStyle(fontSize: 40),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(
              countdownProvider.isRunning
                  ? Icons.pause
                  : Icons.play_arrow_rounded,
              size: 30),
          onPressed: () {
            countdownProvider.startStopTimer();
          }),
    );
  }
}
