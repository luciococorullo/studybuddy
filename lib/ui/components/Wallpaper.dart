import 'package:flutter/material.dart';
import 'package:studybuddy/shared/costants.dart';
import 'package:video_player/video_player.dart';

class Wallpaper extends StatefulWidget {
  @override
  _WallpaperState createState() => _WallpaperState();
}

class _WallpaperState extends State<Wallpaper> {
  VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(
        'https://firebasestorage.googleapis.com/v0/b/drunktry.appspot.com/o/1%20A.M%20Study%20Session%20%F0%9F%93%9A%20-%20%5Blofi%20hip%20hop%20chill%20beats%5D.mp4?alt=media&token=d763e652-b15c-4370-a976-fe8624e4ecfc')
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
      backgroundColor: secondary,
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
            width: 20,
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
