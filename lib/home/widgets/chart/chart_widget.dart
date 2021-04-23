import 'package:flutter/material.dart';

import 'package:devquiz/core/core.dart';

class ChartWidget extends StatefulWidget {
  final double percent;

  const ChartWidget({
    Key? key,
    required this.percent,
  }) : super(key: key);

  @override
  _ChartWidgetState createState() => _ChartWidgetState();
}

class _ChartWidgetState extends State<ChartWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  void initAnimation() {
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1500),
    );

    _animation = Tween<double>(begin: 0, end: widget.percent)
        .animate(_animationController);

    _animationController.forward();
  }

  @override
  void initState() {
    initAnimation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 64,
      height: 64,
      child: AnimatedBuilder(
        animation: _animation,
        builder: (ctx, _) => Stack(
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
                  value: _animation.value,
                ),
              ),
            ),
            Center(
              child: Text(
                '${(_animation.value * 100).toInt()}%',
                style: AppTextStyles.heading,
              ),
            )
          ],
        ),
      ),
    );
  }
}
