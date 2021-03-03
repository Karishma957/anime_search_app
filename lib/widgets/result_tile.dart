import 'package:flutter/material.dart';
import '../screens/info_page.dart';
import '../services/anime_info.dart';

class ResultTile extends StatelessWidget {
  final AnimeInfo item;

  ResultTile({this.item});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal:6.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: GridTile(
          child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => InfoPage(
                      animeInfo: item,
                    ),
                  ),
                );
              },
              child: Image.network(item.imageUrl, fit: BoxFit.cover)),
          footer: GridTileBar(
            backgroundColor: Colors.black54,
            title: Text(
              item.title,
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.white70,
                  fontWeight: FontWeight.w700,
                  fontSize: 22),
            ),
          ),
        ),
      ),
    );
  }
}
