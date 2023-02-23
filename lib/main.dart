import 'package:flutter/material.dart';
import 'package:medial_booster_carousel_slider/global.dart';
import 'package:medial_booster_carousel_slider/screen.dart';
void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => home(),
        'screen': (context) => screen(),
      },
    ),
  );
}

class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Imgae You Like"), centerTitle: true),
      body: ListView.builder(
          itemCount: global.all_image.length,
          itemBuilder: (context, i) => Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: Stack(
                  alignment: Alignment(-0.9, 1),
                  children: [
                    InkWell(
                      onTap: () {
                        setState(() {
                          Navigator.of(context).pushNamed('screen',
                              arguments: global.all_image[i]);
                        });
                      },
                      child:
                      Image.network("${global.all_image[i]['image']}"),
                    ),
                    Text(
                      "${global.all_image[i]['name']}",
                      style: TextStyle(
                          fontSize: 30,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              )
            ],
          )),
    );
  }
}