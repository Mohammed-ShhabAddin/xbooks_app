import 'package:flutter/material.dart';

class CurvedShape extends StatelessWidget {
  final double height;
  final Color color;
  final double curveHeight;

  const CurvedShape({
    super.key,
    required this.height,
    required this.color,
    required this.curveHeight,
  });

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: CurveClipper(curveHeight),
      child: Container(
        height: height,
        color: color,
      ),
    );
  }
}

class CurveClipper extends CustomClipper<Path> {
  final double curveHeight;

  CurveClipper(this.curveHeight);

  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height - curveHeight);
    path.quadraticBezierTo(size.width / 2, size.height + curveHeight,
        size.width, size.height - curveHeight);
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
