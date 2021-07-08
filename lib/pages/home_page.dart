import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../pages/detail_page.dart';
import '../widgets/news_item.dart';
import '../controllers/news_controller.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('News USA'),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
        height: size.height,
        width: size.width,
        child: Obx(() {
          if (NewsController.to.isLoading.value) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return ListView.builder(
                itemCount: NewsController.to.news.length,
                itemBuilder: (context, index) {
                  final list = NewsController.to.news[index];
                  return NewsItem(
                    author: list.author ?? 'author not yet available',
                    title: list.title ?? 'title not yet available',
                    img: list.urlImg,
                    tag: list.urlImg ?? 'no data',
                    onTap: () => Get.to(() => DetailPage(list)),
                  );
                });
          }
        }),
      ),
    );
  }
}
