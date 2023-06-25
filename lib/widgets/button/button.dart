import 'package:flutter/material.dart';
import 'package:mini_project/constants.dart';
import 'package:mini_project/widgets/text/cm_text.dart';

class CMButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final double height;
  final double width;
  final Color color;
  final Color textColor;
  final InteractiveInkFeatureFactory? factory;
  final double? borderRadius;
  final Color borderColor;
  final double borderWidth;
  final double elevation;
  final double textSize;
  final FontWeight fontWeight;

  const CMButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.height = 60,
    this.width = 200,
    this.factory,
    this.color = mySecondaryColor,
    this.textColor = Colors.white,
    this.borderRadius = 15,
    this.borderColor = Colors.transparent,
    this.borderWidth = 0,
    this.elevation = 0,
    this.textSize = 18,
    this.fontWeight = FontWeight.w400,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius!),
              side: BorderSide(
                color: borderColor,
                width: borderWidth,
              ),
            ),
          ),
          elevation: MaterialStatePropertyAll(elevation),
          splashFactory: factory,
          shadowColor: MaterialStateProperty.all<Color>(Colors.white),
          backgroundColor: MaterialStateProperty.all<Color>(color),
        ),
        child: CMText(
          text: text,
          fontSize: textSize,
          fontWeight: fontWeight,
          color: textColor,
        ),
      ),
    );
  }
}
