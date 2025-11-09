import 'package:crud/utils/app_colors.dart';
import 'package:flutter/material.dart';

class TickBox extends StatefulWidget {
  const TickBox({super.key});

  @override
  State<TickBox> createState() => _TickBoxState();
}

class _TickBoxState extends State<TickBox> {
  bool isTicked = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isTicked = !isTicked;
        });
      },
      child: Container(
        width: 24,
        height: 24,
        decoration: BoxDecoration(
          color: isTicked ? AppColors.primaryColor : Colors.transparent,
          border: Border.all(color: AppColors.black),
          borderRadius: BorderRadius.circular(6),
        ),
        child: isTicked
            ? Icon(Icons.check, size: 18, color: Colors.white)
            : null,
      ),
    );
  }
}
