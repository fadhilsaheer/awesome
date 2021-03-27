import 'package:flutter/material.dart';
import 'package:flutter_youtube_ui/data.dart';
import 'package:timeago/timeago.dart' as timeago;

class VideoInfo extends StatelessWidget {
  final Video video;

  const VideoInfo({required this.video});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            video.title,
            style:
                Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 15.0),
          ),
          const SizedBox(height: 8.0),
          Text(
            '${video.viewCount} Views • ${timeago.format(video.timestamp)}',
            style:
                Theme.of(context).textTheme.caption!.copyWith(fontSize: 14.0),
          ),
          const Divider(),
          const Divider(),
        ],
      ),
    );
  }
}

class _ActionsRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
