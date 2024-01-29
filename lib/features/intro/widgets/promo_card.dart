import 'package:flutter/material.dart';
import 'package:meditation_app_ui/features/intro/models/promo_page_data.dart';

class PromoCard extends StatelessWidget {
  final PromoPageData data;
  final TextStyle titleStyle;
  final TextStyle descriptionStyle;
  const PromoCard({
    super.key,
    required this.data,
    required this.titleStyle,
    required this.descriptionStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            data.imagePath,
          ),
          const SizedBox(height: 28.0),
          Text(data.title, style: titleStyle),
          const SizedBox(height: 12.0),
          Text(
            data.description,
            style: descriptionStyle,
            maxLines: 2,
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
