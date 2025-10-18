import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Лабораторная работа №1',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Используем виджет Scaffold (основной каркас экрана)
      body: Column(
        // Размещаем внутри body виджет Column для вертикального расположения элементов
        children: [
          // Первый Container
          Container(
            width: 200, // Задаём ширину
            height: 100, // Задаём высоту
            color: Colors.red, // Задаём цвет фона
          ),

          // Row с тремя текстовыми элементами
          Row(
            // mainAxisAlignment: MainAxisAlignment.spaceEvenly
            // чтобы равномерно распределить тексты по ширине экрана
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text('Осипова'),
              Text('Полина'),
              Text('Алексеевна'),
            ],
          ),

          // Второй Container — ещё один с другими параметрами
          Container(
            width: 300, // ширина
            height: 80,  //высота
            color: const Color.fromARGB(255, 201, 33, 243), // Другой цвет
          ),
        ],
      ),
    );
  }
}