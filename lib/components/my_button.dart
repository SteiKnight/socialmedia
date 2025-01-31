import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String text;
  void Function()? onTap;

  MyButton({super.key, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 25.0),
        padding: EdgeInsets.all(25),
        decoration: BoxDecoration(
          color: theme.colorScheme.primary,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Center(
          child: Text(
            text,
          ),
        ),
      ),
    );
  }
}
