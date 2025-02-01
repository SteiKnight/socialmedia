import 'package:flutter/material.dart';

class DrawerTile extends StatelessWidget {
  void Function()? onTap;
  final IconData icon;
  final String title;

  DrawerTile({
    super.key,
    required this.onTap,
    required this.icon,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25),
      child: ListTile(
        leading: Icon(icon),
        title: Text(title),
        onTap: onTap,
      ),
    );
  }
}
