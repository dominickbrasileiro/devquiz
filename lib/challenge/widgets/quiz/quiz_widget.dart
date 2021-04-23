import 'package:devquiz/common/models/answer_model.dart';
import 'package:flutter/material.dart';

import 'package:devquiz/challenge/widgets/answer/answer_widget.dart';
import 'package:devquiz/common/models/question_model.dart';
import 'package:devquiz/core/app_text_styles.dart';

class QuizWidget extends StatefulWidget {
  final QuestionModel question;
  final VoidCallback onChange;
  final VoidCallback onScore;

  const QuizWidget({
    Key? key,
    required this.question,
    required this.onChange,
    required this.onScore,
  }) : super(key: key);

  @override
  _QuizWidgetState createState() => _QuizWidgetState();
}

class _QuizWidgetState extends State<QuizWidget> {
  int selectedIndex = -1;

  AnswerModel getAnswerByIndex(int index) => widget.question.answers[index];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          SizedBox(height: 32),
          Text(
            widget.question.title,
            style: AppTextStyles.heading,
          ),
          SizedBox(height: 24),
          for (var i = 0; i < widget.question.answers.length; i++)
            AnswerWidget(
              answer: getAnswerByIndex(i),
              isSelected: i == selectedIndex,
              disabled: selectedIndex >= 0,
              onTap: () {
                if (getAnswerByIndex(i).isCorrect) {
                  widget.onScore();
                }

                setState(() {
                  selectedIndex = i;
                });

                Future.delayed(Duration(seconds: 1))
                    .then((_) => widget.onChange());
              },
            ),
        ],
      ),
    );
  }
}
