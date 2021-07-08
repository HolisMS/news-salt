import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../models/news.dart';

class DetailPage extends StatelessWidget {
  final Article article;
  const DetailPage(this.article, {Key? key}) : super(key: key);

  _launchUrl() async {
    final web =
        'https://www.washingtonpost.com/national-security/ransomware-biden-russia/2021/07/06/ff52a9de-de72-11eb-b507-697762d090dd_story.html';
    var url = article.url ?? web;
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw Exception('ERROR get URL');
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail News'),
      ),
      body: ListView(
        padding: EdgeInsets.only(bottom: 8),
        physics: BouncingScrollPhysics(),
        children: [
          Hero(
            tag: article.urlImg ?? 'no data',
            child: FadeInImage(
              width: size.width,
              height: size.height * 0.4,
              placeholder: AssetImage('assets/images/holder.png'),
              image: NetworkImage(article.urlImg ??
                  'https://pertaniansehat.com/v01/wp-content/uploads/2015/08/default-placeholder.png'),
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            child: _buildDetail(context),
          ),
        ],
      ),
    );
  }

  Widget _buildDetail(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          article.title ?? 'title not yet available',
          style: Theme.of(context)
              .textTheme
              .headline6!
              .copyWith(fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 8,
        ),
        RichText(
          text: TextSpan(
              text: 'author : ',
              style: Theme.of(context).textTheme.bodyText1!.copyWith(),
              children: [
                TextSpan(
                  text: article.author ?? 'author not yet available',
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1!
                      .copyWith(fontWeight: FontWeight.bold),
                )
              ]),
        ),
        SizedBox(
          height: 8,
        ),
        RichText(
          text: TextSpan(
              text: 'published : ',
              style: Theme.of(context).textTheme.bodyText1!.copyWith(),
              children: [
                TextSpan(
                  text: article.publishAt ?? 'publish date not yet available',
                  style: Theme.of(context).textTheme.bodyText1!,
                )
              ]),
        ),
        SizedBox(
          height: 8,
        ),
        Text(
          article.desc ?? 'decsription not yet available',
          style: Theme.of(context).textTheme.subtitle1!,
        ),
        SizedBox(
          height: 8,
        ),
        Text(
          article.content ?? 'content not yet available',
          style: Theme.of(context).textTheme.subtitle1!,
        ),
        SizedBox(
          height: 8,
        ),
        InkWell(
          onTap: _launchUrl,
          child: Text('more...',
              style: Theme.of(context)
                  .textTheme
                  .subtitle1!
                  .copyWith(color: Colors.orange, fontWeight: FontWeight.bold)),
        ),
      ],
    );
  }
}
