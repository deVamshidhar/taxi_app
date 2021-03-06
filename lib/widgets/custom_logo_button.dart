import 'package:flutter/material.dart';

class CustomLogoButton extends StatelessWidget {
  final IconData icon;
  final Color color;
  const CustomLogoButton({this.icon, this.color});
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 50,
        child: Card(
          child: Icon(
            icon,
            size: 30,
            color: color,
          ),
        ),
      ),
    );
  }
}
