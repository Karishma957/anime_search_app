import 'package:flutter/material.dart';
import '../services/anime_info.dart';
import 'package:auto_size_text/auto_size_text.dart';

class InfoPage extends StatelessWidget {
  final AnimeInfo animeInfo;

  InfoPage({this.animeInfo});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    double textSize = 27;
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: height * 0.6,
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      SizedBox(
                        height: height * 0.07,
                      ),
                      Container(
                        height: height * 0.03,
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: IconButton(
                              padding: EdgeInsets.only(left: 5),
                              icon: Icon(
                                Icons.arrow_back,
                                color: Colors.white,
                              ),
                              onPressed: () {
                                Navigator.pop(context);
                              }),
                        ),
                      ),
                      Spacer(),
                      MoreInfoSmall(
                        width: width,
                        height: height,
                        textSize: textSize,
                        heading: 'Type :',
                        value: animeInfo.type,
                      ),
                      Spacer(),
                      MoreInfoSmall(
                        width: width,
                        height: height,
                        textSize: textSize,
                        heading: 'Score :',
                        value: animeInfo.score.toString(),
                      ),
                      Spacer(),
                      MoreInfoSmall(
                        width: width,
                        height: height,
                        textSize: textSize,
                        heading: 'Eps :',
                        value: animeInfo.episodes.toString(),
                      ),
                      Spacer(),
                    ],
                  ),
                ),
                Container(
                  height: height * 0.6,
                  width: width * 0.7,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(63),
                      ),
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 60,
                            color: Colors.pinkAccent.withOpacity(0.1)),
                      ],
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(animeInfo.imageUrl),
                        alignment: Alignment.centerLeft,
                      )),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 10, right: 10, top: 7, bottom: 5),
            height: height * 0.1,
            child: Center(
              child: AutoSizeText(
                animeInfo.title,
                maxLines: 2,
                style: TextStyle(
                    fontSize: textSize + 5,
                    fontWeight: FontWeight.w900,
                    color: Colors.white,
                    fontFamily: 'Lato',
                    letterSpacing: 2),
              ),
            ),
          ),
          Divider(
            color: Colors.white,
          ),
          SizedBox(
            height: height * 0.27,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    height: height * 0.05,
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    child: Row(
                      children: [
                        AutoSizeText(
                          'Rating :   ',
                          maxLines: 1,
                          style: TextStyle(
                              fontSize: textSize-3,
                              fontWeight: FontWeight.w300,
                              color: Colors.white70),
                        ),
                        AutoSizeText(
                          animeInfo.rating,
                          maxLines: 1,
                          style: TextStyle(
                              fontSize: textSize-3,
                              fontWeight: FontWeight.w600,
                              color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding:
                        EdgeInsets.only(left: 8, right: 8, top: 10, bottom: 2),
                    child: Text(
                      '${animeInfo.synopsis}',
                      style: TextStyle(
                          fontSize: textSize * 0.8,
                          fontWeight: FontWeight.w500,
                          color: Colors.white.withOpacity(0.8)),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MoreInfoSmall extends StatelessWidget {
  const MoreInfoSmall({
    Key key,
    @required this.width,
    @required this.height,
    @required this.textSize,
    @required this.heading,
    @required this.value,
  }) : super(key: key);

  final double width;
  final double height;
  final double textSize;
  final String heading;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width * 0.23,
      height: height * 0.14,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: height * 0.06 - 16,
              child: AutoSizeText(
                heading,
                maxLines: 1,
                style: TextStyle(
                    fontSize: textSize - 3,
                    fontWeight: FontWeight.w300,
                    color: Colors.white70),
              ),
            ),
            SizedBox(
              height: height * 0.06 - 16,
              child: AutoSizeText(
                value,
                maxLines: 1,
                style: TextStyle(
                    fontSize: textSize,
                    fontWeight: FontWeight.w600,
                    color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
