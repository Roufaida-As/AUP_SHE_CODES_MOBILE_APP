import 'package:flutter/material.dart';
import 'package:shecodes/theme/colors.dart';

class Button extends StatelessWidget {
  final Function()? onTap;
  final String buttonText;

  const Button({
    super.key,
    required this.onTap,
    required this.buttonText,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            color: AppColors.yellow, borderRadius: BorderRadius.circular(12)),
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
        margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
        child: Center(
          child: Text(
            buttonText,
            style: const TextStyle(
              fontSize: 24,
              fontFamily: 'Nunito',
              color: Colors.white,
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
      ),
    );
  }
}
