import 'dart:async';

import 'package:dahiayguille/utils/animacion_agrandar.dart';
import 'package:dahiayguille/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Falta extends StatelessWidget {
  const Falta({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isMobile = constraints.maxWidth < 700;
        return Stack(
          alignment: Alignment.center,
          children: [
            Positioned.fill(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 100,
                  color: AppColors.background,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 140),
              child: SvgPicture.asset(
                "curvas01.svg",
                fit: BoxFit.fitWidth,
                width: MediaQuery.of(context).size.width,
              ),
            ),

            Image.asset("assets/falta_back2.png"),
            Column(
              children: [
                Text(
                  "Falta",
                  style: TextStyle(
                    fontSize: isMobile ? 40 : 60,
                    fontWeight: FontWeight.w600,
                    color: AppColors.orange,
                  ),
                ),
                const SizedBox(height: 20),
                Time(isMobile: isMobile),
                const SizedBox(height: 20),
                MyAnimation("assets/heart.png"),
              ],
            ),
          ],
        );
      },
    );
  }
}

class Time extends StatefulWidget {
  const Time({super.key, required this.isMobile});
  final bool isMobile;

  @override
  State<Time> createState() => _TimeState();
}

class _TimeState extends State<Time> {
  Duration timeLeft = Duration();
  final DateTime eventDate = DateTime(2025, 5, 10, 18, 30);

  @override
  void initState() {
    super.initState();
    Timer.periodic(Duration(seconds: 1), (timer) {
      final now = DateTime.now();
      setState(() {
        timeLeft = eventDate.difference(now);
      });
    });
  }

  String days(Duration d) {
    final days = d.inDays;
    return days.toString();
  }

  String hours(Duration d) {
    final hours = d.inHours % 24;
    return hours.toString();
  }

  String minutes(Duration d) {
    final minutes = d.inMinutes % 60;
    return minutes.toString();
  }

  String seconds(Duration d) {
    final seconds = d.inSeconds % 60;
    return seconds.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: 20,
      children: [
        TimeItem(
          value: days(timeLeft),
          label: "días",
          isMobile: widget.isMobile,
        ),
        const VerticalLine(),
        TimeItem(
          value: hours(timeLeft),
          label: "hs",
          isMobile: widget.isMobile,
        ),
        const VerticalLine(),
        TimeItem(
          value: minutes(timeLeft),
          label: "min",
          isMobile: widget.isMobile,
        ),
        const VerticalLine(),
        TimeItem(
          value: seconds(timeLeft),
          label: "seg",
          isMobile: widget.isMobile,
        ),
      ],
    );
  }
}

class VerticalLine extends StatelessWidget {
  const VerticalLine({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 2,
      height: 50,
      color: AppColors.textColor,
      margin: EdgeInsets.only(bottom: 20),
    );
  }
}

class TimeItem extends StatelessWidget {
  final String value;
  final String label;
  final bool isMobile;
  const TimeItem({
    super.key,
    required this.value,
    required this.label,
    required this.isMobile,
  });
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          value,
          style: TextStyle(
            fontSize: isMobile ? 25.0 : 55.0,
            fontWeight: FontWeight.w600,
            color: AppColors.textColor,
          ),
        ),
        Text(
          label,
          style: TextStyle(
            fontSize: isMobile ? 15.0 : 35.0,
            fontWeight: FontWeight.w500,
            color: AppColors.orange,
          ),
        ),
      ],
    );
  }
}
