import 'package:devquiz/common/widgets/progress_indicator/progress_indicator_widget.dart';
import 'package:devquiz/core/app_text_styles.dart';
import 'package:flutter/material.dart';

class QuestionIndicatorWidget extends StatelessWidget {
  final int currentQuestion;
  final int maxQuestions;

  const QuestionIndicatorWidget({
    Key? key,
    required this.currentQuestion,
    required this.maxQuestions,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Questão ${currentQuestion.toString().padLeft(2, '0')}',
                style: AppTextStyles.body,
              ),
              Text(
                'de ${maxQuestions.toString().padLeft(2, '0')}',
                style: AppTextStyles.body,
              ),
            ],
          ),
          SizedBox(height: 12),
          ProgressIndicatorWidget(value: currentQuestion / maxQuestions),
        ],
      ),
    );
  }
}
