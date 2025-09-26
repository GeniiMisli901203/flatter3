import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Widget Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MainScreen(),
    );
  }
}

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


// 2. Экран с демонстрацией Text виджета
class TextWidgetScreen extends StatelessWidget {
  const TextWidgetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Основной Text виджет',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),

          ),
          SizedBox(height: 20),
          Text(
            'Это обычный текст с выравниванием по левому краю. '
                'TextAlign.start используется по умолчанию.',
            textAlign: TextAlign.start,
          ),
          SizedBox(height: 20),
          Text(
            'Этот текст выровнен по центру и имеет другой стиль: цвет, размер шрифта и тень.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18,
              color: Colors.blue,
              shadows: [
                Shadow(
                  blurRadius: 2.0,
                  color: Colors.grey,
                  offset: Offset(1.0, 1.0),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          Text(
            'Текст с ограничением по ширине и переносом слов. '
                'Обратите внимание на параметр softWrap и overflow.',
            softWrap: true,
            overflow: TextOverflow.ellipsis,
            maxLines: 3,
          ),
        ],
      ),
    );
  }
}

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
