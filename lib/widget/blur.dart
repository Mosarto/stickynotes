import 'dart:ui';

import 'package:flutter/material.dart';

class Blur extends StatefulWidget {
  final double blurlevel;
  const Blur({
    Key? key,
    required this.blurlevel,
  }) : super(key: key);

  @override
  State<Blur> createState() => _BlurState();
}

class _BlurState extends State<Blur> {
  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter:
          ImageFilter.blur(sigmaX: widget.blurlevel, sigmaY: widget.blurlevel),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(
            0.0,
          ),
        ),
      ),
    );
  }
}
