import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main()  async {
    await Supabase.initialize(
    url: 'https://supabase.com/dashboard/project/nuzmjeulxjlxqxvcpxxh',
    anonKey: 'https://supabase.com/dashboard/project/nuzmjeulxjlxqxvcpxxh/editor/17452?schema=public',
  );
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
            margin: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 60.0),
            width: 200, // Задаём ширину
            height: 100, // Задаём  высоту
            color: const Color.fromARGB(255, 174, 105, 253), // Задаём цвет фона
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

          // Второй Container
          Container(
            margin: EdgeInsets.fromLTRB(20.0, 70.0, 20.0, 50.0),
            width: 800, // Другая ширина
            height: 80,  // Другая высота
            color: const Color.fromARGB(255, 198, 243, 33), // Другой цвет
          ),

          Expanded(
            // Виджет Expanded позволяет занять оставшееся пространство
            child: Row(
              // Размещаем внутри Expanded виджет Row
              mainAxisAlignment: MainAxisAlignment.center, // Центрируем
              children: [
                // Первый CircleAvatar — с обычным цветом
                CircleAvatar(
                  radius: 90, // Задаём радиус
                  backgroundColor: const Color.fromARGB(255, 102, 191, 226),
                  child: Text('Кружок'), 
                ),

                // Второй CircleAvatar — с изображением из интернета
                CircleAvatar(
                  radius: 50, // радиус
                  backgroundImage: NetworkImage(
                    'https://avatars.mds.yandex.net/i?id=dba9ed35353666649375c50ec1edefc71642d080b4db2eef-12421437-images-thumbs&n=13', // Ссылка на любое изображение из интернета
                  ),
                ),
              ],
            ),
          ),
        ],
      ),

      // Добавляем FloatingActionButton в свойство floatingActionButton Scaffold
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Обработчик нажатия: выводим сообщение в консоль
          print('Нажали кнопочку');
        },
        child: Icon(Icons.add), // Иконка кнопки
      ),
    );
  }
}