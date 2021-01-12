import 'dart:math';

import 'package:flutter/material.dart';
import 'package:widget_slidebarr/ui/widgets/movie_box.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  double currentPageView = 0;
  PageController controller =
      PageController(initialPage: 0, viewportFraction: 0.6);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.addListener(() {
      setState(() {
        currentPageView = controller.page;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    List<String> urls = [
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQKExYg6fE4i2NiVgGEA7e8p1VDM9GvoKa8hw&usqp=CAU",
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQbRLF0KcwPKSN8ulEXkD942gtSQJSvRf_Ixg&usqp=CAU",
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSnYYLNECOhipAh-AsP3MMjL-BRQH9k9VBLHw&usqp=CAU",
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRp7hzSEZcdPTO4IfO2MDRpSySuHJB6oO6qJQ&usqp=CAU",
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("WidgetSlider"),
      ),
      body: PageView.builder(
        controller: controller,
        itemCount: urls.length,
        itemBuilder: (context, index) {
          double defference = index - currentPageView;
          if(defference < 0 ) {
            defference *= -1;
          }
          defference = min(1, defference);
          return Center(
            child: MovieBox(urls[index], scale:  1 - (defference * 0.3),),
          );
        },
      ),
      // PageView(
      //   onPageChanged: (index) {
      //     print("halaman " + index.toString());
      //   },
      //   children: <Widget>[
      //     Container(color: Colors.red,),
      //     Container(color: Colors.green,),
      //     Container(color: Colors.blue,),
      //     Container(color: Colors.yellow,),
      //   ],
      // ),
    );
  }
}
