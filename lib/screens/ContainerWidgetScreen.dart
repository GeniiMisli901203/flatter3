import 'package:flutter/material.dart';

// 5. Экран с демонстрацией Container
class ContainerWidgetScreen extends StatelessWidget {
  const ContainerWidgetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Демонстрация Container:',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),

          // Простой контейнер
          const Text(
            'Простой контейнер с фоном:',
            style: TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 10),
          Container(
            color: Colors.blue,
            padding: const EdgeInsets.all(16.0),
            child: const Text(
              'Контейнер с синим фоном',
              style: TextStyle(color: Colors.white),
            ),
          ),
          const SizedBox(height: 20),

          // Контейнер с декорацией
          const Text(
            'Контейнер с BoxDecoration:',
            style: TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 10),
          Container(
            decoration: BoxDecoration(
              color: Colors.orange,
              borderRadius: const BorderRadius.all(Radius.circular(10.0)),
              border: Border.all(color: Colors.red, width: 2.0),
              boxShadow: const [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 5.0,
                  offset: Offset(2.0, 2.0),
                ),
              ],
            ),
            padding: const EdgeInsets.all(16.0),
            child: const Text(
              'Контейнер с декорацией',
              style: TextStyle(color: Colors.white),
            ),
          ),
          const SizedBox(height: 20),

          // Контейнер с трансформацией
          const Text(
            'Контейнер с трансформацией:',
            style: TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 10),
          Container(
            color: Colors.purple,
            padding: const EdgeInsets.all(16.0),
            transform: Matrix4.rotationZ(0.1),
            child: const Text(
              'Повернутый контейнер',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}