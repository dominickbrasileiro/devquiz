import 'package:devquiz/challenge/widgets/answer/answer_widget.dart';
import 'package:devquiz/core/app_text_styles.dart';
import 'package:flutter/material.dart';

class QuizWidget extends StatelessWidget {
  final String title;

  const QuizWidget({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          SizedBox(height: 10),
          Text(
            title,
            style: AppTextStyles.heading,
          ),
          SizedBox(height: 24),
          AnswerWidget(
            isSelected: true,
            title: 'Kit de desenvolvimento de interface do usuário',
          ),
          AnswerWidget(
            isSelected: true,
            title:
                'Possibilita a criação de aplicativos compilados nativamente',
          ),
          AnswerWidget(
            isSelected: true,
            title: 'Acho que é uma marca de café do Himalaia',
            isCorrect: true,
          ),
          AnswerWidget(
            isSelected: true,
            title: 'Possibilita a criação de desktops que são muito incríveis',
          ),
        ],
      ),
    );
  }
}
