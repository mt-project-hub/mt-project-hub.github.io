import 'package:dahiayguille/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Regalos extends StatelessWidget {
  const Regalos({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Regalos",
          style: TextStyle(fontSize: 60, fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 20),
        const Text(
          "Si deseas regalarnos algo más que tu hermosa presencia...",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: AppColors.orange,
            fontFamily: 'DancingScript',
          ),
        ),
        const SizedBox(height: 30),
        Lottie.asset(
          "assets/regalojson.json",
          height: 80,
          width: 80,
          fit: BoxFit.cover,
        ),
        const SizedBox(height: 20),

        Cuenta(
          banco: "BROU",
          numeroPesos: "001370948-00001",
          numeroUSD: "001370948-00003",
        ),
      ],
    );
  }
}

class Cuenta extends StatelessWidget {
  final String numeroUSD;
  final String numeroPesos;
  final String banco;
  final String nombre;
  const Cuenta({
    super.key,
    required this.numeroUSD,
    required this.numeroPesos,
    required this.banco,
    this.nombre = "Dahiana Castelli",
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          nombre,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w600,
            fontFamily: "DancingScript",
          ),
        ),
        const SizedBox(height: 10),
        Text(
          banco,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            fontFamily: "DancingScript",
          ),
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "\$",
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w900,
                fontFamily: "DancingScript",
              ),
            ),
            const SizedBox(width: 10),
            SelectableText(
              numeroPesos,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                fontFamily: "DancingScript",
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "USD",
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w900,
                fontFamily: "DancingScript",
              ),
            ),
            const SizedBox(width: 10),
            SelectableText(
              numeroUSD,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                fontFamily: "DancingScript",
              ),
            ),
          ],
        ),
      ],
    );
  }
}
