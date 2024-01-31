import 'package:flutter/material.dart';

class SignDiviver extends StatelessWidget {
  final String text;
  const SignDiviver({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 1,
            decoration: BoxDecoration(
              color: Theme.of(context).dividerColor,
              borderRadius: BorderRadius.circular(50.0),
            ),
          ),
        ),
        const SizedBox(width: 12.0),
        Text(
          'Or sign up with email',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        const SizedBox(width: 12.0),
        Expanded(
          child: Container(
            height: 1,
            decoration: BoxDecoration(
              color: Theme.of(context).dividerColor,
              borderRadius: BorderRadius.circular(50.0),
            ),
          ),
        ),
      ],
    );
  }
}
