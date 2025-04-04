import 'package:dahiayguille/confirmar.dart';
import 'package:dahiayguille/cuando.dart';
import 'package:dahiayguille/falta.dart';
import 'package:dahiayguille/fotos.dart';
import 'package:dahiayguille/header.dart';
import 'package:dahiayguille/regalos.dart';
import 'package:dahiayguille/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

void main() {
  runApp(BodaDeNicoYFlorApp());
}

class BodaDeNicoYFlorApp extends StatelessWidget {
  const BodaDeNicoYFlorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Boda de Dahia y Guille',
      theme: ThemeData(
        fontFamily: 'PlayfairDisplay',
        scaffoldBackgroundColor: AppColors.background,
        primaryColor: AppColors.textColor,
        textTheme: TextTheme(
          bodyLarge: TextStyle(color: AppColors.textColor),
          bodyMedium: TextStyle(color: AppColors.textColor),
          bodySmall: TextStyle(color: AppColors.textColor),
          titleLarge: TextStyle(color: AppColors.textColor),
          titleMedium: TextStyle(color: AppColors.textColor),
          titleSmall: TextStyle(color: AppColors.textColor),
        ),
        appBarTheme: AppBarTheme(
          color: AppColors.textColor,
          titleTextStyle: TextStyle(
            color: AppColors.textColor,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      home: PortadaPage(),
    );
  }
}

class PortadaPage extends StatelessWidget {
  const PortadaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/fondo.png"),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                children: [Header(), SizedBox(height: 40), Falta()],
              ),
            ),
            SizedBox(height: 80),
            Cuando(),
            SizedBox(height: 120),
            SvgPicture.asset(
              "assets/curvas02.svg",
              fit: BoxFit.fitWidth,
              width: MediaQuery.of(context).size.width,
            ),
            FotosPage(),
            Regalos(),
            SizedBox(height: 120),
            Confirmar(),
          ],
        ),
      ),
    );
  }
}
