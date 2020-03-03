import "package:flutter/material.dart";

class AlbumPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final sizeX = MediaQuery.of(context).size.width;
    final sizeY = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        width: sizeX,
        height: sizeY,
        child: GridView.count(
          scrollDirection: Axis.vertical,
          crossAxisCount: 2,
          children: createGallery(50),
          mainAxisSpacing: 5.0,
          crossAxisSpacing: 5.0,
          padding: EdgeInsets.all(5),
        ),
      ),
    );
  }

  List<Widget> createGallery(int numImages) {
    List<Widget> images = List<Widget>();
    List<String> urls = List<String>();
    urls.add("http://bit.ly/gv_car_1");
    urls.add("http://bit.ly/gv_car_2");
    urls.add("http://bit.ly/gv_car_3");
    urls.add("http://bit.ly/gv_car_4");
    urls.add("http://bit.ly/gv_car_5");

    Widget image;
    int i = 0;
    while (i < numImages) {
      image = Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(urls[i % 5]),
        )),
      );
      images.add(image);
      i++;
    }
    return images;
  }
}
