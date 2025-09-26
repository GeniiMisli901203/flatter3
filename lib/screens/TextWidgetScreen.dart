import 'package:flutter/material.dart';

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
