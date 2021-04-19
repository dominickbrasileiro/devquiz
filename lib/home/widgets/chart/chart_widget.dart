import 'package:devquiz/core/core.dart';
import 'package:flutter/material.dart';

class ChartWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 64,
      height: 64,
      child: Stack(
        children: [
          Center(
            child: Container(
              width: 64,
              height: 64,
              child: CircularProgressIndicator(
                backgroundColor: AppColors.chartSecondary,
                valueColor:
                    AlwaysStoppedAnimation<Color>(AppColors.chartPrimary),
                strokeWidth: 8,
                value: 0.75,
              ),
            ),
          ),
          Center(
            child: Text(
              '75%',
              style: AppTextStyles.heading,
            ),
          )
        ],
      ),
    );
  }
}
