import 'package:devquiz/common/models/answer_model.dart';
import 'package:devquiz/core/core.dart';
import 'package:flutter/material.dart';

class AnswerWidget extends StatelessWidget {
  final AnswerModel answer;
  final bool isSelected;
  final bool disabled;
  final VoidCallback onTap;

  const AnswerWidget({
    Key? key,
    required this.answer,
    required this.onTap,
    this.isSelected = false,
    this.disabled = false,
  }) : super(key: key);

  Color get color => answer.isCorrect ? AppColors.darkGreen : AppColors.darkRed;

  Color get borderColor =>
      answer.isCorrect ? AppColors.lightGreen : AppColors.lightRed;

  Color get cardColor =>
      answer.isCorrect ? AppColors.lightGreen : AppColors.lightRed;

  Color get cardBorderColor =>
      answer.isCorrect ? AppColors.green : AppColors.red;

  TextStyle get textStyle => answer.isCorrect
      ? AppTextStyles.bodyDarkGreen
      : AppTextStyles.bodyDarkRed;

  IconData get icon => answer.isCorrect ? Icons.check : Icons.close;

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: disabled,
      child: GestureDetector(
        onTap: onTap,
        child: Padding(
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
                    answer.title,
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
                      BorderSide(
                          color: isSelected ? borderColor : AppColors.white),
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
        ),
      ),
    );
  }
}
