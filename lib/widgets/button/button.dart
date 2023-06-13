import 'package:flutter/material.dart';
import 'package:mini_project/constants.dart';
import 'package:mini_project/widgets/text/choptime_text.dart';

class ChopTimeButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final double height;
  final double width;
  final Color color;
  final Color textColor;
  final InteractiveInkFeatureFactory? factory;
  final double? borderRadius;

  const ChopTimeButton(
      {Key? key,
      required this.text,
      required this.onPressed,
      this.height = 50,
      this.width = 200,
      this.factory,
      this.color = kSecondaryColor,
      this.textColor = Colors.white,
      this.borderRadius = 30})
      : super(key: key);

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
              // side: const BorderSide(color: Colors.blue),
            ),
          ),
          splashFactory: factory,
          shadowColor: MaterialStateProperty.all<Color>(Colors.white),
          backgroundColor: MaterialStateProperty.all<Color>(color),
        ),
        child: ChopTimeText(
          text: text,
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
