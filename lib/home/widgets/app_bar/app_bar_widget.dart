import 'package:devquiz/common/models/user_model.dart';
import 'package:devquiz/core/core.dart';
import 'package:devquiz/home/widgets/score_card/score_card_widget.dart';
import 'package:flutter/material.dart';

class AppBarWidget extends PreferredSize {
  final UserModel user;

  AppBarWidget({
    required this.user,
  }) : super(
          preferredSize: Size.fromHeight(200),
          child: Container(),
        );

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: Stack(
        children: [
          Container(
            height: 162,
            padding: EdgeInsets.symmetric(horizontal: 20),
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: AppGradients.linear,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text.rich(
                  TextSpan(
                    text: 'Hi, ',
                    style: AppTextStyles.title,
                    children: [
                      TextSpan(
                        text: '${user.name}!',
                        style: AppTextStyles.titleBold,
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 58,
                  height: 58,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: NetworkImage(
                        user.photoUrl,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Align(
            alignment: Alignment(0, 2),
            child: ScoreCardWidget(
              percent: user.score / 100,
            ),
          ),
        ],
      ),
    );
  }
}
