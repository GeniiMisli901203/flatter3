import 'package:flutter/material.dart';

import '../main.dart';
import 'ButtonWidgetScreem.dart';
import 'LayoutWidgetScreen.dart';
import 'TextWidgetScreen.dart';

// 1. Главный экран с навигацией
class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  // Список экранов для навигации
  final List<Widget> _screens = [
    const TextWidgetScreen(),
    const ButtonWidgetScreen(),
    const LayoutWidgetScreen(),
    const ContainerWidgetScreen(),
    const InteractiveWidgetScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Widget Demo'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed, // Фиксированный тип для равномерного распределения кнопок
        selectedItemColor: Colors.blue, // Цвет выбранного элемента
        unselectedItemColor: Colors.grey, // Цвет невыбранных элементов
        backgroundColor: Colors.white, // Фон панели навигации
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.text_fields),
            activeIcon: Icon(Icons.text_fields, color: Colors.blue), // Цвет активной иконки
            label: 'Text',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.smart_button),
            activeIcon: Icon(Icons.smart_button, color: Colors.blue),
            label: 'Button',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.grid_view),
            activeIcon: Icon(Icons.grid_view, color: Colors.blue),
            label: 'Layouts',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.inventory),
            activeIcon: Icon(Icons.inventory, color: Colors.blue),
            label: 'Container',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.touch_app),
            activeIcon: Icon(Icons.touch_app, color: Colors.blue),
            label: 'Interactive',
          ),
        ],
      ),
    );
  }
}