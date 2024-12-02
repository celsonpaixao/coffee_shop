import 'package:flutter/material.dart';

class AppGlobalVericalSpacing extends StatelessWidget {
  final double? value;
  const AppGlobalVericalSpacing({super.key, this.value});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: value ?? 8,
      width: double.maxFinite,
    );
  }
}

class AppGlobalHorizontalSpacing extends StatelessWidget {
  final double? value;
  const AppGlobalHorizontalSpacing({super.key, this.value});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: value ?? 8,
      height: double.maxFinite,
    );
  }
}
