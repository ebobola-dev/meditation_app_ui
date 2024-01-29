import 'package:flutter/material.dart';

List<Widget> getConditionsData(TextStyle style, TextStyle linkStyle) {
  return [
    RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: 'I agree to ',
            style: style,
          ),
          TextSpan(
            text: 'Privacy Policy',
            style: linkStyle,
          ),
          TextSpan(
            text: ' and ',
            style: style,
          ),
          TextSpan(
            text: 'Terms of Use',
            style: linkStyle,
          ),
          TextSpan(
            text: '.',
            style: style,
          ),
        ],
      ),
    ),
    RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text:
                'I agree to processing of my personal health data for providing me Bellabeat app functions. See more in  ',
            style: style,
          ),
          TextSpan(
            text: 'Privacy Policy',
            style: linkStyle,
          ),
          TextSpan(
            text: '.',
            style: style,
          ),
        ],
      ),
    ),
    Text(
      'I agree that  may use my personal data to send me product or service offerings via app or email.*',
      style: style,
    ),
  ];
}
