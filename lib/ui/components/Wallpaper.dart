import 'dart:math';

import 'package:flutter/material.dart';
import 'package:studybuddy/shared/costants.dart';
import 'dart:html' as html;
import 'package:studybuddy/ui/pages/Homepage.dart';
import 'package:video_player/video_player.dart';

class Wallpaper extends StatefulWidget {
  @override
  _WallpaperState createState() => _WallpaperState();
}

class _WallpaperState extends State<Wallpaper> {
  VideoPlayerController _controller;

  List<String> videos = [
    'https://firebasestorage.googleapis.com/v0/b/studybuddy-parthenope.appspot.com/o/background%2FSwitzerland%20in%208K%20ULTRA%20HD%20HDR%20-%20Heaven%20of%20Earth%20(60%20FPS)_Trim.mp4?alt=media&token=ff0c95f6-4d0d-4ee9-84ef-b2501878090c',
    'https://firebasestorage.googleapis.com/v0/b/studybuddy-parthenope.appspot.com/o/background%2Fprova.mp4?alt=media&token=033eeb35-98a3-4c22-a7cc-ae72bc89c53a',
    'https://firebasestorage.googleapis.com/v0/b/studybuddy-parthenope.appspot.com/o/background%2F2.mp4?alt=media&token=1b11be1b-92bc-419a-ba4a-2cf7e06f3b43',
    'https://firebasestorage.googleapis.com/v0/b/studybuddy-parthenope.appspot.com/o/background%2Fooo.mp4?alt=media&token=6d81c615-bdcc-42f7-b2d8-724ce8a0591b'
  ];

  String selectedVideo;

  @override
  void initState() {
    super.initState();
    var rand = Random().nextInt(4);
    selectedVideo = videos[rand];
    print(rand.toString());

    _controller = VideoPlayerController.network(selectedVideo)
      ..addListener(() => setState(() {
            videoPosition = _controller.value.position;
          }))
      ..initialize().then((_) => setState(() {
            videoLength = _controller.value.duration;
          }));
    _controller.setLooping(true);
    if (!_controller.value.isPlaying) _controller.play();
  }

  Duration videoLength;
  Duration videoPosition;
  double volume = 0.5;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            if (_controller.value.isInitialized) ...[
              AspectRatio(
                //TODO: fix
                aspectRatio: _controller.value.aspectRatio,
                child: VideoPlayer(_controller),
              ),
            ],
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Spacer(
            flex: 4,
          ),
          FloatingActionButton.extended(
            backgroundColor: primary,
            label: Text(_controller.value.isPlaying ? "Pause" : "Play"),
            icon: Icon(
                _controller.value.isPlaying ? Icons.pause : Icons.play_arrow),
            onPressed: () {
              setState(() {
                _controller.value.isPlaying
                    ? _controller.pause()
                    : _controller.play();
              });
            },
          ),
          SizedBox(
            width: 10,
          ),
          FloatingActionButton(
            backgroundColor: primary,
            child: Icon(_controller.value.volume > 0
                ? Icons.volume_up
                : Icons.volume_off),
            onPressed: () {
              setState(() {
                _controller.value.volume > 0
                    ? _controller.setVolume(0.0)
                    : _controller.setVolume(0.5);
              });
            },
          ),
          SizedBox(
            width: 10,
          ),
          FloatingActionButton(
            backgroundColor: primary,
            child: Icon(
              Icons.refresh,
              color: Colors.white,
            ),
            onPressed: () {
              setState(() {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => Homepage(),
                ));
              });
            },
          ),
          Spacer(
            flex: 2,
          )
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}

String convertToMinutesSeconds(Duration duration) {
  final parsedMinutes = duration.inMinutes < 10
      ? '0${duration.inMinutes}'
      : duration.inMinutes.toString();

  final seconds = duration.inSeconds % 60;

  final parsedSeconds =
      seconds < 10 ? '0${seconds % 60}' : (seconds % 60).toString();
  return '$parsedMinutes:$parsedSeconds';
}
