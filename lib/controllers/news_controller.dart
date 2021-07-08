import 'package:get/get.dart';
import '../models/news.dart';
import '../services/news_services.dart';

class NewsController extends GetxController {
  static NewsController get to => Get.find();

  final news = <Article>[].obs;
  final _services = NewsService();
  var isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    _fetchNews();
  }

  void _fetchNews() async {
    isLoading(true);
    try {
      var list = await _services.getArticle();
      news.assignAll(list);
    } finally {
      isLoading(false);
    }
  }
}
