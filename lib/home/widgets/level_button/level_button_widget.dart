import 'package:devquiz/core/core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LevelButtonWidget extends StatelessWidget {
  final String label;

  LevelButtonWidget({
    Key? key,
    required this.label,
  })  : assert(['Easy', 'Medium', 'Hard', 'Expert'].contains(label)),
        super(key: key);

  final config = {
    'Easy': {
      'color': AppColors.levelButtonFacil,
      'borderColor': AppColors.levelButtonBorderFacil,
      'textColor': AppColors.levelButtonTextFacil,
    },
    'Medium': {
      'color': AppColors.levelButtonMedio,
      'borderColor': AppColors.levelButtonBorderMedio,
      'textColor': AppColors.levelButtonTextMedio,
    },
    'Hard': {
      'color': AppColors.levelButtonDificil,
      'borderColor': AppColors.levelButtonBorderDificil,
      'textColor': AppColors.levelButtonTextDificil,
    },
    'Expert': {
      'color': AppColors.levelButtonPerito,
      'borderColor': AppColors.levelButtonBorderPerito,
      'textColor': AppColors.levelButtonTextPerito,
    },
  };

  Color get color => config[label]!['color']!;
  Color get borderColor => config[label]!['borderColor']!;
  Color get textColor => config[label]!['textColor']!;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(28),
        color: color,
        border: Border.fromBorderSide(
          BorderSide(color: borderColor),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 18,
          vertical: 6,
        ),
        child: Text(
          label,
          style: GoogleFonts.notoSans(
            color: textColor,
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}
