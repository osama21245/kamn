import 'package:flutter/material.dart';

class CustomGradiantText extends StatelessWidget {
  const CustomGradiantText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 5,
      children: [
        const Text("👋"),
        ShaderMask(
          shaderCallback: (bounds) => const LinearGradient(
            colors: [
              Color(0xFF429B88),
              Color(0xFF1962FF),
              Color(0xFF781BFB),
              Color(0xFFAF37E6),
            ],
          ).createShader(bounds),
          child: const Row(
            children: [
              Text(
                "GOOD EVENING",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
