import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: 'https://nuzmjeulxjlxqxvcpxxh.supabase.co', 
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im51em1qZXVseGpseHF4dmNweHhoIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NjE3MTQzODcsImV4cCI6MjA3NzI5MDM4N30.DwphL5CA7TdfR8auPqrx-vp7rByWqqvM8WPN2G1gXW4',
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Лабораторная работа №1',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<dynamic> purchases = [];
  bool isLoading = true;

  // Поля формы
  String title = '';
  String description = '';
  String purpose = '';
  String priceStr = '';

  @override
  void initState() {
    super.initState();
  //  _initSupabase();
  }

  Future<void> _loadPurchases() async {
    try {
      final data = await Supabase.instance.client
          .from('Покупки')
          .select()
          .order('created_at', ascending: false);

      if (mounted) {
        setState(() {
          purchases = data as List<dynamic>;
          isLoading = false;
        });
      }
    } catch (e) {
      print('Ошибка загрузки: $e');
      if (mounted) {
        setState(() {
          isLoading = false;
        });
      }
    }
  }

  Future<void> _addPurchase() async {

    print('adding');
    if (title.isEmpty || description.isEmpty || purpose.isEmpty || priceStr.isEmpty) return;

    final price = double.tryParse(priceStr);
    if (price == null) return;
 print('trying');
    try {
      await Supabase.instance.client.from('Покупки').insert({
        'Название': title,
        'Описание': description,
        'Назначение': purpose,
        'Цена': price,
      });
print("after await");
      // Сброс полей
    /*  setState(() {
        title = '';
        description = '';
        purpose = '';
        priceStr = '';
      });
      */
     // await _loadPurchases(); // Обновить список
    } catch (e) {
      print('Ошибка добавления: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // === СОХРАНЁННЫЕ ЭЛЕМЕНТЫ ИЗ ОРИГИНАЛА ===
            Container(
              margin: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 60.0),
              width: 200,
              height: 100,
              color: const Color.fromARGB(255, 174, 105, 253),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                Text('Осипова'),
                Text('Полина'),
                Text('Алексеевна'),
              ],
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(20.0, 70.0, 20.0, 50.0),
              width: 800,
              height: 80,
              color: const Color.fromARGB(255, 198, 243, 33),
            ),

            // ФОРМА И СПИСОК ПОКУПОК
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Добавить покупку', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  TextField(
                    decoration: const InputDecoration(labelText: 'Название'),
                    onChanged: (v) => setState(() => title = v),
                  ),
                  TextField(
                    decoration: const InputDecoration(labelText: 'Описание'),
                    onChanged: (v) => setState(() => description = v),
                  ),
                  TextField(
                    decoration: const InputDecoration(labelText: 'Назначение'),
                    onChanged: (v) => setState(() => purpose = v),
                  ),
                  TextField(
                    decoration: const InputDecoration(labelText: 'Цена'),
                    keyboardType: TextInputType.number,
                    onChanged: (v) => setState(() => priceStr = v),
                  ),
                  const SizedBox(height: 12),
                  ElevatedButton(
                    onPressed: _addPurchase,
                    child: const Text('Добавить'),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // Список покупок
           /* if (isLoading)
              const Center(child: CircularProgressIndicator())
            else
              ...purchases.map((p) {
                return Card(
                  margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: ListTile(
                    title: Text(p['Название'] ?? 'Без названия'),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Описание: ${p['Описание'] ?? ''}'),
                        Text('Назначение: ${p['Назначение'] ?? ''}'),
                        Text('Цена: ${p['Цена']?.toString() ?? '0'}'),
                      ],
                    ),
                  ),
                );
              }).toList(),
*/
            // CircleAvatars из оригинала
           /* FutureBuilder(
              future:   _loadPurchases(), 
              builder: builder)
           */
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 90,
                  backgroundColor: const Color.fromARGB(255, 102, 191, 226),
                  child: const Text('Кружок'),
                ),
                const SizedBox(width: 20),
                CircleAvatar(
                  radius: 50,
                  backgroundImage: NetworkImage(
                    'https://avatars.mds.yandex.net/i?id=dba9ed35353666649375c50ec1edefc71642d080b4db2eef-12421437-images-thumbs&n=13',
                  ),
                ),
              ],
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),

      // FloatingActionButton сохранён
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print('Нажали кнопочку');
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}