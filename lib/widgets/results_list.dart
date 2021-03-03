import 'package:flutter/material.dart';
import './result_tile.dart';
import '../services/anime_info.dart';

class ResultsList extends StatelessWidget {
  final double width;
  final List<AnimeInfo> results;

  ResultsList({this.results, this.width});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: GridView.builder(
        padding: EdgeInsets.symmetric(horizontal: 10),
        scrollDirection: Axis.horizontal,
        itemCount: results.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1,
            childAspectRatio:1.5,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10),
        itemBuilder: (ctx, i) => ResultTile(
          item: results[i],
        ),
      ), /* RotatedBox(
        quarterTurns: 5,
        child:ListWheelScrollView.useDelegate(
          squeeze: 1,
          childDelegate: ListWheelChildLoopingListDelegate(
            children: [
              ...results.map((e) {
                return ResultTile(item: e,);
              }).toList()
            ],
          ),
          itemExtent: width*0.6,
        ),
      ),*/
    );
  }
}
