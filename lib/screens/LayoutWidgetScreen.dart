import 'package:flutter/material.dart';

// 4. Экран с демонстрацией компоновки
class LayoutWidgetScreen extends StatelessWidget {
  const LayoutWidgetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Демонстрация компоновки:',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),

          // Пример Column
          const Text(
            'Column виджет:',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          Container(
            color: Colors.grey[200],
            padding: const EdgeInsets.all(8.0),
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text('Элемент 1'),
                Text('Элемент 2'),
                Text('Элемент 3'),
              ],
            ),
          ),
          const SizedBox(height: 20),

          // Пример Row
          const Text(
            'Row виджет:',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          Container(
            color: Colors.grey[200],
            padding: const EdgeInsets.all(8.0),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(Icons.star, color: Colors.amber),
                Text('Рейтинг'),
                Icon(Icons.star_half, color: Colors.amber),
                Icon(Icons.star_border),
              ],
            ),
          ),
          const SizedBox(height: 20),

          // Пример с Padding
          const Text(
            'Padding виджет:',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30.0, right: 10.0),
            child: Container(
              color: Colors.blue[100],
              child: const Text(
                'Текст с отступами слева (30) и справа (10)',
                textAlign: TextAlign.center,
              ),
            ),
          ),
          const SizedBox(height: 20),

          // Пример с SizedBox
          const Text(
            'SizedBox виджет:',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          SizedBox(
            width: 200,
            height: 100,
            child: Container(
              color: Colors.green[100],
              alignment: Alignment.center,
              child: const Text('Фиксированный размер 200x100'),
            ),
          ),
        ],
      ),
    );
  }
}
