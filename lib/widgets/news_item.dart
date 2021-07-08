import 'package:flutter/material.dart';

class NewsItem extends StatelessWidget {
  final String author;
  final String title;
  final String? img;
  final String tag;
  final Function() onTap;

  const NewsItem(
      {Key? key,
      required this.author,
      required this.title,
      this.img,
      required this.tag,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.only(top: 10),
      child: Material(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        clipBehavior: Clip.antiAlias,
        elevation: 3,
        child: InkWell(
          onTap: onTap,
          child: Container(
              width: size.width,
              height: 280,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Hero(
                    tag: tag,
                    child: FadeInImage(
                      width: size.width,
                      height: size.height * 0.3,
                      placeholder: AssetImage('assets/images/holder.png'),
                      image: NetworkImage(img ??
                          'https://pertaniansehat.com/v01/wp-content/uploads/2015/08/default-placeholder.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 6),
                    child: Text(
                      author,
                      style: Theme.of(context)
                          .textTheme
                          .headline6!
                          .copyWith(fontWeight: FontWeight.bold),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 6),
                    child: Text(
                      title,
                      style: Theme.of(context).textTheme.bodyText1!.copyWith(),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
