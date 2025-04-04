import 'package:dahiayguille/utils/card.dart';
import 'package:dahiayguille/utils/flex_row.dart';
import 'package:flutter/material.dart';

class Confirmar extends StatelessWidget {
  const Confirmar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/fondo.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        children: [
          const SizedBox(height: 10),
          Text(
            "Compartimos este día junto a vos",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 60,
              fontWeight: FontWeight.w600,
              fontFamily: "DancingScript",
            ),
          ),
          const SizedBox(height: 20),
          FlexRow(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MyCard(
                title: "Dress code",
                image: "assets/bow.png",
                subtitle: "Vestimenta formal",
              ),
              const SizedBox(width: 40, height: 20),
              MyCard(
                title: "Confirmar asistencia",
                image: "assets/memo.png",
                subtitle:
                    "Te pedimos que confirmes tu asistencia mediante el siguiente formulario",
                showLink: true,
              ),
            ],
          ),

          const SizedBox(height: 40),

          FlexRow(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Dahia',
                style: TextStyle(fontSize: 35, fontWeight: FontWeight.w600),
              ),
              SizedBox(width: 5),

              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Image.asset("assets/andand.png", height: 30, width: 30),
              ),
              SizedBox(width: 5),
              Text(
                'Guille',
                style: TextStyle(fontSize: 35, fontWeight: FontWeight.w600),
              ),
            ],
          ),
          const SizedBox(height: 40),
        ],
      ),
    );
  }
}
