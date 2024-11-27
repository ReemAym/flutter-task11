import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class InactiveIcon extends StatelessWidget {
  const InactiveIcon({super.key, required this.icon});

  final String icon;
  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(icon);
  }
}
