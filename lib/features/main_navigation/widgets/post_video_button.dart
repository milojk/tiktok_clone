import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/sizes.dart';

class PostVideoButton extends StatelessWidget {
  const PostVideoButton(
      {super.key, required this.isSelected, required this.inverted});

  final bool isSelected;
  final bool inverted;

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: isSelected ? 1 : 0.7,
      duration: const Duration(milliseconds: 200),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            right: 20,
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: Sizes.size8,
              ),
              height: 30,
              width: 25,
              decoration: BoxDecoration(
                color: const Color(0xff61D4F0),
                borderRadius: BorderRadius.circular(Sizes.size8),
              ),
            ),
          ),
          Positioned(
            left: 20,
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: Sizes.size8,
              ),
              height: 30,
              width: 25,
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(
                  Sizes.size8,
                ),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: Sizes.size12,
            ),
            height: 30,
            //width: 25,
            decoration: BoxDecoration(
              color: inverted ? Colors.black : Colors.white,
              borderRadius: BorderRadius.circular(
                Sizes.size6,
              ),
            ),
            child: Center(
              child: FaIcon(
                FontAwesomeIcons.plus,
                color: inverted ? Colors.white : Colors.black,
                size: isSelected ? 18 : 16,
              ),
            ),
          )
        ],
      ),
    );
  }
}
