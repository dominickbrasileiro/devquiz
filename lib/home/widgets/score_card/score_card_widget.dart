import 'package:devquiz/core/core.dart';
import 'package:devquiz/home/widgets/chart/chart_widget.dart';
import 'package:flutter/material.dart';

class ScoreCardWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        height: 136,
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 2,
              child: ChartWidget(),
            ),
            Expanded(
              flex: 4,
              child: Padding(
                padding: EdgeInsets.only(left: 8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Vamos começar',
                      style: AppTextStyles.heading,
                    ),
                    Text(
                      'Complete os desafios e avance em conhecimento',
                      style: AppTextStyles.body,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
