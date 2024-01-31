import 'package:elementary/elementary.dart';
import 'package:meditation_app_ui/assets/resources/resources.dart';
import 'package:meditation_app_ui/features/intro/models/promo_page_data.dart';

class PromoModel extends ElementaryModel {
  int _currentPage = 0;

  final _pagesData = [
    PromoPageData(
      imagePath: ImagePaths.greenImage,
      title: 'STRESS LESS.',
      description: 'Make mindfulness a daily habit\nand be kind to your mind.',
    ),
    PromoPageData(
      imagePath: ImagePaths.whiteImage,
      title: 'RELAX MORE.',
      description: 'Unwind and find serenity in a\nguided meditation sessions',
    ),
    PromoPageData(
      imagePath: ImagePaths.blueImage,
      title: 'SLEEP LONGER.',
      description: 'Calm racing mind and prepare\nyour body for deep sleep.',
    ),
    PromoPageData(
      imagePath: ImagePaths.aquaOrangeImage,
      title: 'LIVE BETTER.',
      description: 'Invest in personal sense of inner\npeace and balance.',
    ),
  ];

  int get currentPage => _currentPage;
  List<PromoPageData> get pagesData => _pagesData;

  int swipe(int newPage) {
    _currentPage = newPage;
    return _currentPage;
  }
}
