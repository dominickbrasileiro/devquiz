import 'package:devquiz/common/models/quiz_model.dart';
import 'package:devquiz/common/widgets/progress_indicator/progress_indicator_widget.dart';
import 'package:devquiz/core/core.dart';
import 'package:flutter/material.dart';

class QuizCardWidget extends StatelessWidget {
  final QuizModel quiz;

  QuizCardWidget({
    required this.quiz,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.fromBorderSide(
          BorderSide(
            color: AppColors.border,
          ),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 40,
            height: 40,
            child: Image.asset('assets/images/${quiz.image}'),
          ),
          Text(
            quiz.title,
            style: AppTextStyles.heading15,
          ),
          Row(
            children: [
              Expanded(
                flex: 2,
                child: Text(
                  '${quiz.questionsAnswered} de ${quiz.questions.length}',
                  style: AppTextStyles.body11,
                ),
              ),
              Expanded(
                flex: 3,
                child: ProgressIndicatorWidget(
                  value: quiz.questionsAnswered / quiz.questions.length,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
