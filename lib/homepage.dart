import 'dart:ffi';

import 'package:flutter/material.dart';

import 'video_player.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController controller = TextEditingController();
  String url =
      "https://www.youtube.com/watch?v=Ci4t-NkOY3I&list=PLjxrf2q8roU23XGwz3Km7sQZFTdB996iG";
  bool openvideo = false;
  bool islive = false;
  void changeTheUrl() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      url = controller.text.isEmpty ? url : controller.text;
      openvideo = !openvideo;
    });
  }

  void setlive() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      islive = !islive;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Youtube player Demo")),
        body: SingleChildScrollView(
          child: Column(
            children: [
              TextFormField(controller: controller),
              InkWell(
                onTap: () => changeTheUrl(),
                child: Container(
                    width: 100,
                    height: 50,
                    color: Colors.yellow,
                    child: Center(child: Text("Load Url"))),
              ),
              openvideo == true ? YoutubeVideo(url, islive) : Container(),
              ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 1,
                  itemBuilder: (ctx, i) {
                    return ListTile(
                      onTap: () => setlive(),
                      title: Text(
                        "Live",
                        style: TextStyle(
                            color: islive ? Colors.red : Colors.black),
                      ),
                    );
                  })
            ],
          ),
        ));
  }
}
