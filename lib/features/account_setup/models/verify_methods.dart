import 'package:meditation_app_ui/assets/resources/resources.dart';

enum VerifyMethods {
  email(
    icon: IconPaths.mail,
    title: 'Email Address',
    subtitle: 'Verify with your email',
    description: "We're going to send you an email with a login link.",
  ),
  phoneNumber(
    icon: IconPaths.phone,
    title: 'Phone Number',
    subtitle: 'Verify with your phone numbe',
    description: "We're going to send you a verification code.",
  );

  final String icon;
  final String title;
  final String subtitle;
  final String description;

  const VerifyMethods({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.description,
  });
}
