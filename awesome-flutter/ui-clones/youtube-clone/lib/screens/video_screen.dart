import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_youtube_ui/screens/nav_screen.dart';
import 'package:flutter_youtube_ui/widgets/widgets.dart';
import 'package:miniplayer/miniplayer.dart';
import 'package:flutter/widgets.dart';

class VideoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Theme.of(context).scaffoldBackgroundColor,
        child: CustomScrollView(
          shrinkWrap: true,
          slivers: [
            SliverToBoxAdapter(
              child: Consumer(builder: (context, watch, _) {
                final selectedVideo = watch(selectVideoProvider).state;
                return SafeArea(
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          Image.network(
                            selectedVideo!.thumbnailUrl,
                            height: 220.0,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                          IconButton(
                            icon: const Icon(Icons.keyboard_arrow_down),
                            iconSize: 30.0,
                            onPressed: () {
                              context
                                  .read(miniPlayerControllerProvider)
                                  .state
                                  .animateToHeight(state: PanelState.MIN);
                            },
                          )
                        ],
                      ),
                      const LinearProgressIndicator(
                        value: 0.4,
                        valueColor: AlwaysStoppedAnimation<Color>(
                          Colors.red,
                        ),
                      ),
                      VideoInfo(video: selectedVideo),
                    ],
                  ),
                );
              }),
            )
          ],
        ),
      ),
    );
  }
}
