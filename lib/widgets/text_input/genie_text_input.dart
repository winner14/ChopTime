import 'package:flutter/material.dart';
import 'package:mini_project/constants.dart';

class GenieTextInput extends StatelessWidget {
  final String? email;
  final String? hint;
  final String? label;
  final String? password;
  final TextEditingController? emailController;
  final TextEditingController? passwordController;
  final VoidCallback? onChange;
  final Icon? icon;
  final double? width;
  final double? height;
  final double borderRadius;
  final Color borderColor;
  final double borderWidth;

  const GenieTextInput({
    Key? key,
    this.email,
    this.password,
    this.emailController,
    this.hint,
    this.label,
    this.passwordController,
    this.onChange,
    this.icon,
    this.width,
    this.height = 50,
    this.borderRadius = 10,
    this.borderColor = Colors.transparent,
    this.borderWidth = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: TextField(
        controller: emailController,
        keyboardType: TextInputType.emailAddress,
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(horizontal: 15),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.horizontal(
              right: Radius.circular(borderRadius),
              left: Radius.circular(borderRadius),
            ),
            borderSide: BorderSide(color: borderColor, width: borderWidth),
          ),
          iconColor: kSecondaryColor,
          labelText: label,
          hintText: hint,
          prefixIcon: icon,
          suffixIcon: emailController?.text.isEmpty ?? true
              ? const SizedBox(
                  width: 0,
                )
              : IconButton(
                  onPressed: () {
                    emailController?.clear();
                  },
                  icon: const Icon(Icons.close),
                ),
        ),
        onChanged: (value) {
          onChange?.call();
        },
      ),
    );
  }
}
