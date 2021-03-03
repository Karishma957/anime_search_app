import 'package:flutter/material.dart';
import '../widgets/parallax_widget.dart';
import '../widgets/parallax_animation_widget.dart';
import 'package:auto_size_text/auto_size_text.dart';
import '../services/getAnime.dart';
import '../widgets/results_list.dart';
import '../services/anime_info.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class ParallaxScreen extends StatefulWidget {
  @override
  _ParallaxScreenState createState() => _ParallaxScreenState();
}

class _ParallaxScreenState extends State<ParallaxScreen> {
  GetAnime inputInfo;
  final animeController = TextEditingController();
  String enteredName = 'Looking for something?';
  List<AnimeInfo> resultsList;
  bool isScrollable=true;

  double rate1 = 0;
  double rate2 = 0;
  double rate3 = 0;
  double rate4 = 0;
  double rate5 = 0;
  double rate6 = 0;
  double rate7 = 0;
  double rate8 = 0;
  double rate9 = 0;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    void trial(String inputName) async {
      if(inputName.length>2){
        inputInfo = GetAnime(name: inputName);
        await inputInfo.getAnime();
        if (!inputInfo.errorStatus) {
          setState(() {
            enteredName = 'Search Results for \'$inputName\'';
            resultsList = inputInfo.results;
            isScrollable=false;
          });
          animeController.clear();
        } else {
          setState(() {
            enteredName = 'Something went wrong!';
          });
        }
      }else{
        Alert(
            context: context,
            title: 'Invalid input',
            desc:
            '\nInsert more than 2 characters\n',
            buttons: [
              DialogButton(
                color: Color.fromRGBO(63, 26, 84, 1),
                child: Text('Ok',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                    )),
                onPressed: () => Navigator.pop(context),
              ),
            ]).show();
      }

    }

    return Scaffold(
      body: NotificationListener(
        onNotification: (v) {
          if (v is ScrollUpdateNotification) {
            setState(() {
              rate9 -= v.scrollDelta / 4;
              rate8 -= v.scrollDelta / 4.5;
              rate7 -= v.scrollDelta / 5.5;
              rate6 -= v.scrollDelta / 5;
              rate5 -= v.scrollDelta / 6.5;
              rate4 -= v.scrollDelta / 6;
              rate3 -= v.scrollDelta / 7.5;
              rate2 -= v.scrollDelta / 7;
              rate1 -= v.scrollDelta / 8;
            });
          }
          return true;
        },
        child: Stack(
          children: [
            ParallaxWidget(
              imgUrl: '9',
              top: rate9,
              width: width,
            ),
            ParallaxAnimationWidget(
              animationUrl: 'japan8',
              animationName: '8',
              top: rate8,
              width: width,
            ),
            ParallaxWidget(
              imgUrl: '7',
              top: rate7,
              width: width,
            ),
            ParallaxWidget(
              imgUrl: '6',
              top: rate6,
              width: width,
            ),
            ParallaxWidget(
              imgUrl: '5',
              top: rate5,
              width: width,
            ),
            ParallaxWidget(
              imgUrl: '4',
              top: rate4,
              width: width,
            ),
            ParallaxWidget(
              imgUrl: '3',
              top: rate3,
              width: width,
            ),
            ParallaxWidget(
              imgUrl: '2',
              top: rate2,
              width: width,
            ),
            ParallaxAnimationWidget(
              animationUrl: 'japan1',
              animationName: '1',
              top: rate1,
              width: width,
            ),
            Positioned(
              top: rate1,
              child: Container(
                padding: EdgeInsets.only(top: 75, left: 50),
                height: height / 2,
                width: width,
                child: AutoSizeText(
                  'Find\nYour\nAnime',
                  maxLines: 3,
                  style: TextStyle(
                    fontFamily: 'Lato',
                    color: Colors.white,
                    fontWeight: FontWeight.w900,
                    fontSize: 65,
                    letterSpacing: 7,
                  ),
                ),
              ),
            ),
            ListView(
              physics: isScrollable? const AlwaysScrollableScrollPhysics(): const NeverScrollableScrollPhysics(),
              children: [
                Container(
                  height: width * 3,
                  color: Colors.transparent,
                ),
                Container(
                  height: height,
                  color: Color.fromRGBO(63, 26, 84, 1),
                  child: Column(
                    children: [
                      SizedBox(
                        height: height * 0.1,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 7.0),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white54,
                              borderRadius: BorderRadius.circular(30)),
                          child: TextField(
                            autocorrect: true,
                            controller: animeController,
                            onSubmitted: (String input) {
                              trial(input);
                            },
                            style: TextStyle(
                                fontSize: height * 0.03,
                                color: Colors.black,
                                fontWeight: FontWeight.w500),
                            decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.search,
                                color: Colors.black87,
                              ),
                              contentPadding: EdgeInsets.all(height * 0.02),
                              border: InputBorder.none,
                              hintText: 'Search for an Anime',
                              hintStyle: TextStyle(
                                  fontSize: height * 0.03,
                                  color: Colors.black87,
                                  fontWeight: FontWeight.w500),
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.transparent),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30)),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: height * 0.1,
                        padding: EdgeInsets.only(
                            bottom: 8, left: 13, right: 13, top: 20),
                        child: AutoSizeText(
                          enteredName,
                          style: TextStyle(
                              color: Colors.white70,
                              fontWeight: FontWeight.bold,
                              fontSize: height * 0.05),
                          maxLines: 2,
                          overflow: TextOverflow.clip,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(height * 0.005),
                        height: height * 0.56,
                        child: resultsList == null
                            ? Container(
                                height: height * 0.55,
                                child: Image.asset(
                                  'assets/images/animeGirl.png',
                                  fit: BoxFit.cover,
                                ),
                              )
                            : ResultsList(
                                width: width,
                                results: resultsList,
                              ),
                      ),
                      Container(
                        height: height * 0.15,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 30, right: 20),
                              child: Image.asset(
                                'assets/images/end.png',
                                fit: BoxFit.cover,
                              ),
                            ),
                            Expanded(
                              child: Container(
                                padding: const EdgeInsets.all(8.0),
                                child: AutoSizeText.rich(
                                  TextSpan(text: 'Stay Home, Stay Safe\nMade with  💜  by  🐼',),
                                  maxLines: 2,
                                  style: TextStyle(
                                      color: Colors.white70,
                                      fontWeight: FontWeight.w900,
                                      fontSize: 22,
                                      fontFamily: 'Lato'),
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}