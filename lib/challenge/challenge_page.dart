import 'package:flutter/material.dart';

import 'package:devquiz/challenge/challenge_controller.dart';
import 'package:devquiz/challenge/widgets/next_button/next_button_widget.dart';
import 'package:devquiz/challenge/widgets/question_indicator/question_indicator_widget.dart';
import 'package:devquiz/challenge/widgets/quiz/quiz_widget.dart';
import 'package:devquiz/common/models/question_model.dart';
import 'package:devquiz/result/result_page.dart';

class ChallengePage extends StatefulWidget {
  final List<QuestionModel> questions;
  final String title;

  const ChallengePage({
    Key? key,
    required this.questions,
    required this.title,
  }) : super(key: key);

  @override
  _ChallengePageState createState() => _ChallengePageState();
}

class _ChallengePageState extends State<ChallengePage> {
  final controller = ChallengeController();
  final pageController = PageController();

  @override
  void initState() {
    pageController.addListener(() {
      controller.currentIndex = pageController.page!.toInt();
    });
    super.initState();
  }

  void nextPage() {
    if (controller.currentIndex + 1 < widget.questions.length) {
      pageController.nextPage(
        duration: Duration(milliseconds: 200),
        curve: Curves.easeOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(92),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                icon: Icon(Icons.close),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              ValueListenableBuilder<int>(
                valueListenable: controller.currentIndexNotifier,
                builder: (ctx, value, _) => QuestionIndicatorWidget(
                  currentQuestion: value + 1,
                  maxQuestions: widget.questions.length,
                ),
              ),
            ],
          ),
        ),
      ),
      body: PageView(
        controller: pageController,
        physics: NeverScrollableScrollPhysics(),
        children: widget.questions
            .map(
              (question) => QuizWidget(
                question: question,
                onChange: nextPage,
                onScore: () {
                  controller.score++;
                },
              ),
            )
            .toList(),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
          child: ValueListenableBuilder<int>(
            valueListenable: controller.currentIndexNotifier,
            builder: (ctx, value, _) => Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                if (value < widget.questions.length - 1)
                  Expanded(
                    child: NextButtonWidget.white(
                      label: 'Pular',
                      onPressed: nextPage,
                    ),
                  ),
                if (value == widget.questions.length - 1)
                  Expanded(
                    child: NextButtonWidget.green(
                      label: 'Confirmar',
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (ctx) => ResultPage(
                            title: widget.title,
                            questionsNumber: widget.questions.length,
                            score: controller.score,
                          ),
                        ));
                      },
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
