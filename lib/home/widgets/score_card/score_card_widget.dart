import 'package:flutter/material.dart';

import 'package:devquiz/core/core.dart';
import 'package:devquiz/home/widgets/chart/chart_widget.dart';

class ScoreCardWidget extends StatelessWidget {
  final double percent;

  const ScoreCardWidget({
    Key? key,
    required this.percent,
  }) : super(key: key);

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
              child: ChartWidget(
                percent: percent,
              ),
            ),
            Expanded(
              flex: 4,
              child: Padding(
                padding: EdgeInsets.only(left: 8, right: 24),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Bom resultado!',
                      style: AppTextStyles.heading,
                    ),
                    Text(
                      'Seu conhecimento está sendo aprimorado :)',
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
