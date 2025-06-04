import 'package:flutter/material.dart';

class CustomBackButton extends StatelessWidget {
  final VoidCallback? onTap;
  const CustomBackButton({Key? key, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: const Color(0xFF0099FF),
      shape: const CircleBorder(),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: onTap ?? () => Navigator.of(context).maybePop(),
        child: const SizedBox(
          width: 40,
          height: 40,
          child: Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Colors.white,
            size: 22,
          ),
        ),
      ),
    );
  }
}
