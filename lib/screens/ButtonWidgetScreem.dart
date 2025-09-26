import 'package:flutter/material.dart';

// 3. Экран с демонстрацией кнопок
class ButtonWidgetScreen extends StatefulWidget {
  const ButtonWidgetScreen({super.key});

  @override
  State<ButtonWidgetScreen> createState() => _ButtonWidgetScreenState();
}

class _ButtonWidgetScreenState extends State<ButtonWidgetScreen> {
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Демонстрация кнопок:',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),

          // ElevatedButton с синим фоном
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue, // Цвет фона
              foregroundColor: Colors.white, // Цвет текста
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            ),
            onPressed: () {
              setState(() {
                _counter++;
              });
            },
            child: const Text('Elevated Button'),
          ),
          const SizedBox(height: 10),

          // TextButton с зелёным текстом и рамкой
          TextButton(
            style: TextButton.styleFrom(
              foregroundColor: Colors.green, // Цвет текста
              side: const BorderSide(color: Colors.green), // Рамка
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            ),
            onPressed: () {
              setState(() {
                _counter += 2;
              });
            },
            child: const Text('Text Button'),
          ),
          const SizedBox(height: 10),

          // OutlinedButton с фиолетовой рамкой
          OutlinedButton(
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.purple, // Цвет текста
              side: const BorderSide(color: Colors.purple), // Рамка
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            ),
            onPressed: () {
              setState(() {
                _counter += 3;
              });
            },
            child: const Text('Outlined Button'),
          ),
          const SizedBox(height: 20),

          // Текст со счётчиком
          Text(
            'Счетчик: $_counter',
            style: const TextStyle(fontSize: 18),
          ),
          const SizedBox(height: 20),

          // ElevatedButton с иконкой
          ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red, // Красный фон
              foregroundColor: Colors.white, // Белый текст
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            ),
            onPressed: () {
              setState(() {
                _counter = 0;
              });
            },
            icon: const Icon(Icons.refresh),
            label: const Text('Сбросить'),
          ),
        ],
      ),
    );
  }
}