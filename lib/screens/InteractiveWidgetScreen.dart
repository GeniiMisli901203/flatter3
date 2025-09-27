import 'package:flutter/material.dart';

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


