import 'package:flutter/material.dart';

import 'package:devquiz/challenge/widgets/next_button/next_button_widget.dart';
import 'package:devquiz/core/app_text_styles.dart';
import 'package:devquiz/core/core.dart';
import 'package:devquiz/home/home_page.dart';
import 'package:share_plus/share_plus.dart';

class ResultPage extends StatelessWidget {
  final String title;
  final int score;
  final int questionsNumber;

  const ResultPage({
    Key? key,
    required this.title,
    required this.score,
    required this.questionsNumber,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(AppImages.trophy),
            Column(
              children: [
                Text(
                  'Congratulations!',
                  style: AppTextStyles.heading40,
                ),
                SizedBox(height: 10),
                Text.rich(
                  TextSpan(
                    text: 'You finished',
                    style: AppTextStyles.body,
                    children: [
                      TextSpan(
                        text: '\n$title\n',
                        style: AppTextStyles.bodyBold,
                      ),
                      TextSpan(
                        text: 'with $score of $questionsNumber marks.',
                        style: AppTextStyles.body,
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 68),
                  child: Row(
                    children: [
                      Expanded(
                        child: NextButtonWidget.purple(
                          label: 'Share',
                          onPressed: () {
                            Share.share(
                              'DevQuiz! https://github.com/dominickbrasileiro/devquiz',
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 68),
                  child: Row(
                    children: [
                      Expanded(
                        child: NextButtonWidget.transparent(
                          label: 'Back to Home',
                          onPressed: () {
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                builder: (ctx) => HomePage(),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
