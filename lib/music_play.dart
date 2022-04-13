import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MusicPlay extends StatelessWidget {
   MusicPlay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: _MusicStateful(),
    );
  }
}

class _MusicStateful extends StatefulWidget {
  const _MusicStateful({Key? key}) : super(key: key);

  @override
  State<_MusicStateful> createState() => _MusicStatefulState();
}

class _MusicStatefulState extends State<_MusicStateful> {
  late Image img;
  Color color=Colors.blue;
  String _title='';
  Image image_play=Image.asset('assets/projectim/playim.jpeg',height: 100,width: 100);
  Image image_pause=Image.asset('assets/projectim/pause_button.png',height: 100,width: 100);
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    img=image_play;
    _title='Showing play button';
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color,
      appBar: AppBar(
        title: Text(_title),

      ),
/*
body: Container(
  alignment: Alignment.center,
  child: Image.asset('assets/projectim/pause_button.png',height: 100,width: 100,),
),
*/
      body: Center(

        child: new GestureDetector(
          child: img,
          onTapDown: (tap){
            setState(() {
              img=image_pause;
              _title='Showing pause button';
              color=Colors.red;
            });
          },
          onTapUp: (tap){
            setState(() {
              img=image_play;
              _title='Showing play button';
              color=Colors.blue;
            });
          },
        ),
      ),
    );
  }
}

