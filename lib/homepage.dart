import 'package:flutter/material.dart';
import 'package:pinstagram/color.dart';
import 'package:pinstagram/icons.dart';
import 'package:pinstagram/strings.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'data.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var color = lightblue;
  var items;
  int _currindex = 0;
  _appbar(height, width) {
    return new Container(
      width: width,
      child: SafeArea(
        child: new Container(
          child: new AutoSizeText(appname,
              textAlign: TextAlign.center,
              minFontSize: 10.0,
              maxFontSize: 20.0,
              style: TextStyle(color: darkblue, fontFamily: "Amsterdam")),
        ),
      ),
    );
  }

  _like() {
    setState(() {
      likecolor = Colors.red;
    });
  }

  Color likecolor = lightblue;
  EdgeInsets iconmargin = EdgeInsets.only(top: 2.0, left: 5.0, right: 5.0);
  _body(height, width) {
    return new Container(
      child: new Column(
        children: <Widget>[
          new Expanded(
            flex: 1,
            child: new Container(
              margin: EdgeInsets.all(5.0),
              child: new ListView.builder(
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: stories.length,
                itemBuilder: (context, index) {
                  return Container(
                    child: Stack(
                      alignment: Alignment.center,
                      children: <Widget>[
                        new Container(
                          height: 50.0,
                          width: 50.0,
                          constraints:
                              BoxConstraints.loose(Size(width / 6, height)),
                          margin: EdgeInsets.only(right: 5.0, left: 5.0),
                          decoration: BoxDecoration(
                              border: Border.all(
                                  width: 3.0,
                                  color: (index == 0 || index == 1)
                                      ? Colors.white
                                      : storyactivecolor),
                              image: DecorationImage(
                                  image: AssetImage(stories[index]['image']),
                                  fit: BoxFit.cover),
                              shape: BoxShape.circle),
                        ),
                        index == 0
                            ? Positioned(
                                bottom: 5,
                                right: 5,
                                child: new Container(
                                  height: 20.0,
                                  width: 20.0,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                        // topLeft: Radius.circular(25.0),
                                        topRight: Radius.circular(25.0),
                                        bottomLeft: Radius.circular(25.0),
                                        bottomRight: Radius.circular(25.0),
                                      ),
                                      color: storyaddbuttoncolor),
                                  child: new Icon(
                                    Icons.add,
                                    size: 15.0,
                                    color: Colors.white,
                                  ),
                                ),
                              )
                            : new Container(),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
          new Expanded(
            flex: 7,
            child: new Container(
                child: new GridView.builder(
              physics: BouncingScrollPhysics(),
              itemCount: wall.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: ((width / 2) / (height / 2))),
              itemBuilder: (context, index) {
                return new Container(
                  margin: EdgeInsets.all(5.0),
                  child: new Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      new Container(
                        margin: EdgeInsets.only(bottom: 5.0, right: 5.0),
                        child: new Row(
                          children: <Widget>[
                            new CircleAvatar(
                              backgroundImage:
                                  AssetImage(wall[index]['profile_pic']),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: new AutoSizeText(
                                wall[index]['name'],
                                maxLines: 2,
                                style: TextStyle(
                                  fontFamily: "Montserrat",
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      new Container(
                        height: height / 3,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(wall[index]['pic']),
                                fit: BoxFit.cover),
                            borderRadius: BorderRadius.circular(10.0)),
                      ),
                      new Container(
                        child: new Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            new Row(
                              children: <Widget>[
                                Container(
                                  margin: iconmargin,
                                  child: InkWell(
                                    onTap: _like,
                                    child: new Icon(
                                      heart,
                                      size: 20.0,
                                      color: likecolor,
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: iconmargin,
                                  child: new Icon(
                                    comment,
                                    size: 20.0,
                                    color: lightblue,
                                  ),
                                ),
                                Container(
                                  margin: iconmargin,
                                  child: new Icon(
                                    share,
                                    size: 20.0,
                                    color: lightblue,
                                  ),
                                )
                              ],
                            ),
                            new Container(
                              margin: iconmargin,
                              child: new Icon(
                                menu,
                                size: 20.0,
                                color: lightblue,
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                );
              },
            )),
          )
        ],
      ),
    );
  }

  _bottomappbar(height, width) {
    return new Container(
        height: height / 15,
        width: width,
        child: new Align(
          alignment: Alignment.centerLeft,
          child: new Container(
            width: width / 1.3,
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                new IconButton(
                  icon: new Icon(
                    Icons.gradient,
                    color: _currindex == 0 ? blue : lightblue,
                  ),
                  onPressed: () {
                    setState(() {
                      _currindex = 0;
                    });
                  },
                ),
                new IconButton(
                  icon: new Icon(
                    Icons.search,
                    color: _currindex == 1 ? blue : lightblue,
                  ),
                  onPressed: () {
                    setState(() {
                      _currindex = 1;
                    });
                  },
                ),
                new IconButton(
                  icon: new Icon(
                    Icons.person,
                    color: _currindex == 2 ? blue : lightblue,
                  ),
                  onPressed: () {
                    setState(() {
                      _currindex = 2;
                    });
                  },
                ),
              ],
            ),
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    items = [
      _body(height, width),
      new Container(
        color: darkblue,
      ),
      new Container(
        color: lightblue,
      )
    ];
    return Scaffold(
      body: new Container(
        child: new Column(
          children: <Widget>[
            new Expanded(
              flex: 1,
              child: _appbar(height, width),
            ),
            new Expanded(
              flex: 8,
              child: items[_currindex],
            ),
          ],
        ),
      ),
      bottomNavigationBar: _bottomappbar(height, width),
      floatingActionButton: new Container(
        height: 50.0,
        width: 50.0,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25.0),
              topRight: Radius.circular(25.0),
              bottomLeft: Radius.circular(25.0),
            ),
            color: blue),
        child: new Icon(
          Icons.add_circle_outline,
          color: Colors.white,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
    );
  }
}
