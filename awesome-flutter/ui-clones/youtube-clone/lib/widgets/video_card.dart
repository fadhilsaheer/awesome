import 'package:flutter/material.dart';
import 'package:flutter_youtube_ui/data.dart';

class VideoCard extends StatelessWidget {
  final Video video;

  const VideoCard({
    Key? key,
    required this.video,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.network(
          video.thumbnailUrl,
          height: 220.0,
          width: double.infinity,
          fit: BoxFit.cover,
        )
      ],
    );
  }
}
