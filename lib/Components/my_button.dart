import 'package:flutter/material.dart';

class Mybutton extends StatelessWidget {
  final String title;
  final Color colors;
  final VoidCallback onpress;
  final double heights;
  final double fontSize;

  const Mybutton({
    Key? key,
    required this.title,
    this.colors = const Color(0xffa5a5a5),
    required this.onpress,
    this.heights = 60,
    this.fontSize = 18,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 6),
        child: InkWell(
          onTap: onpress,
          child: Container(
            height: heights,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: colors,
            ),
            child: Center(
              child: Text(
                title,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: fontSize,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
