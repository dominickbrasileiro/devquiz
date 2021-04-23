import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:devquiz/core/core.dart';

class NextButtonWidget extends StatelessWidget {
  final String label;
  final Color backgroundColor;
  final Color textColor;
  final Color borderColor;
  final VoidCallback onPressed;

  const NextButtonWidget({
    Key? key,
    required this.label,
    required this.backgroundColor,
    required this.textColor,
    required this.borderColor,
    required this.onPressed,
  }) : super(key: key);

  NextButtonWidget.green({
    required this.label,
    required this.onPressed,
  })  : this.backgroundColor = AppColors.darkGreen,
        this.textColor = AppColors.white,
        this.borderColor = AppColors.green;

  NextButtonWidget.white({
    required this.label,
    required this.onPressed,
  })  : this.backgroundColor = AppColors.border,
        this.textColor = AppColors.grey,
        this.borderColor = AppColors.border;

  NextButtonWidget.purple({
    required this.label,
    required this.onPressed,
  })  : this.backgroundColor = AppColors.purple,
        this.textColor = AppColors.white,
        this.borderColor = AppColors.border;

  NextButtonWidget.transparent({
    required this.label,
    required this.onPressed,
  })  : this.backgroundColor = Colors.transparent,
        this.textColor = AppColors.grey,
        this.borderColor = Colors.transparent;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          elevation: MaterialStateProperty.all(0),
          backgroundColor: MaterialStateProperty.all(backgroundColor),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          side: MaterialStateProperty.all(
            BorderSide(
              color: borderColor,
            ),
          ),
        ),
        child: Text(
          label,
          style: GoogleFonts.notoSans(
            fontWeight: FontWeight.w600,
            fontSize: 14,
            color: textColor,
          ),
        ),
      ),
    );
  }
}
