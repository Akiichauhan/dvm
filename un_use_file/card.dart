import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({
    super.key,
    this.elevation,
    this.color,
    this.prefixIcon,
    this.text,
    this.height,
    this.icon,
    this.width,
    this.style,
  });

  final double? elevation;

  final Color? color;
  final String? prefixIcon;
  final String? text;
  final double? height, width;
  final IconData? icon;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: elevation,
      child: Column(
        children: [
          Image.asset(prefixIcon!),
          Text(text!, style: style),
          SizedBox(height: height),
          Row(
            children: [
              InkWell(
                onTap: () {},
                child: Text(text!),
              ),
              SizedBox(
                width: width!,
              ),
              Icon(icon!),
              SizedBox(
                width: width!,
              ),
              SizedBox(
                width: width!,
              ),
              Icon(icon!),
              SizedBox(
                width: width!,
              ),
            ],
          ),
        ],
      ),
      //  color: color,
    );
  }
}
