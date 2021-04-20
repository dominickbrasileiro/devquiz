import 'package:devquiz/core/core.dart';
import 'package:flutter/material.dart';

class AnswerWidget extends StatelessWidget {
  final String title;
  final bool isCorrect;
  final bool isSelected;

  const AnswerWidget({
    Key? key,
    required this.title,
    this.isCorrect = false,
    this.isSelected = false,
  }) : super(key: key);

  Color get color => isCorrect ? AppColors.darkGreen : AppColors.darkRed;

  Color get borderColor =>
      isCorrect ? AppColors.lightGreen : AppColors.lightRed;

  Color get cardColor => isCorrect ? AppColors.lightGreen : AppColors.lightRed;

  Color get cardBorderColor => isCorrect ? AppColors.green : AppColors.red;

  TextStyle get textStyle =>
      isCorrect ? AppTextStyles.bodyDarkGreen : AppTextStyles.bodyDarkRed;

  IconData get icon => isCorrect ? Icons.check : Icons.close;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 6),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        decoration: BoxDecoration(
          color: isSelected ? cardColor : AppColors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.fromBorderSide(
            BorderSide(
              color: isSelected ? cardBorderColor : AppColors.border,
            ),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                title,
                style: isSelected ? textStyle : AppTextStyles.body,
              ),
            ),
            Container(
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                color: isSelected ? color : AppColors.white,
                borderRadius: BorderRadius.circular(24),
                border: Border.fromBorderSide(
                  BorderSide(color: isSelected ? borderColor : AppColors.white),
                ),
              ),
              child: Icon(
                icon,
                size: 16,
                color: AppColors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
