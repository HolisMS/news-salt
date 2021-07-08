import 'package:dio/dio.dart';
import '../models/news.dart';

class NewsService {
  var dio = Dio();
  var _apiKey = '5c84c2607dff4fe292a1dc8b6159ac9f';

  Future<List<Article>> getArticle() async {
    var response = await dio
        .get('https://newsapi.org/v2/top-headlines?country=us&apiKey=$_apiKey');
    if (response.statusCode == 200) {
      var res = response.data;
      Iterable it = res['articles'];
      return it.map((e) => Article.fromMap(e)).toList();
    } else {
      throw Exception('ERROR get data');
    }
  }
}
