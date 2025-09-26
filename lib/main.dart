import 'package:flatter3/screens/MainScreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Third Practice',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MainScreen(),
    );
  }
}


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

// 6. Экран с интерактивными элементами
class InteractiveWidgetScreen extends StatefulWidget {
  const InteractiveWidgetScreen({super.key});

  @override
  State<InteractiveWidgetScreen> createState() => _InteractiveWidgetScreenState();
}

class _InteractiveWidgetScreenState extends State<InteractiveWidgetScreen> {
  bool _isSwitched = false;
  double _sliderValue = 0.5;
  String _selectedOption = 'Опция 1';

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Интерактивные виджеты:',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),

          // Switch
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Переключатель:'),
              Switch(
                value: _isSwitched,
                onChanged: (value) {
                  setState(() {
                    _isSwitched = value;
                  });
                },
              ),
            ],
          ),
          const SizedBox(height: 20),

          // Slider
          const Text('Ползунок:'),
          Slider(
            value: _sliderValue,
            onChanged: (value) {
              setState(() {
                _sliderValue = value;
              });
            },
            min: 0,
            max: 1,
            divisions: 10,
            label: _sliderValue.toStringAsFixed(1),
          ),
          Text('Текущее значение: ${_sliderValue.toStringAsFixed(2)}'),
          const SizedBox(height: 20),

          // DropdownButton
          const Text('Выпадающий список:'),
          DropdownButton<String>(
            value: _selectedOption,
            onChanged: (String? newValue) {
              setState(() {
                _selectedOption = newValue!;
              });
            },
            items: <String>['Опция 1', 'Опция 2', 'Опция 3', 'Опция 4']
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
          const SizedBox(height: 20),

          // Интерактивный контейнер
          const Text('Интерактивный контейнер:'),
          const SizedBox(height: 10),
          GestureDetector(
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Контейнер нажат!')),
              );
            },
            child: Container(
              width: double.infinity,
              height: 100,
              color: Colors.lightBlue,
              alignment: Alignment.center,
              child: const Text(
                'Нажмите меня',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
