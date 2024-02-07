import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class CustomChewie extends StatelessWidget {
  final VideoPlayerController videoPlayerController;

  const CustomChewie({Key? key, required this.videoPlayerController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Chewie(
        controller: ChewieController(
          videoPlayerController: videoPlayerController,
          aspectRatio: 1,
          allowMuting: true,
          allowPlaybackSpeedChanging: true,
          autoInitialize: true,
          autoPlay: true,
          looping: false,
          draggableProgressBar: true,
          allowFullScreen: true,
          useRootNavigator: true,
          allowedScreenSleep: true,
          showControls: true,
          showControlsOnInitialize: true,
          placeholder: Container(
            color: Colors.black,
            child: const Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              ),
            ),
          ),
          errorBuilder: (context, errorMessage) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.error,
                    size: 50,
                    color: Colors.red,
                  ),
                  Text(
                    'Error loading video',
                    style: TextStyle(color: Colors.red),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}