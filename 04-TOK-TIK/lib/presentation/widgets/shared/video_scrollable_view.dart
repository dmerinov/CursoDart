import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tok_tik/presentation/widgets/shared/video_player/video_buttons.dart';
import 'package:tok_tik/presentation/widgets/video/fullscreen_player.dart';

import '../../../domain/entities/video_post.dart';

class VideoScrollableView extends StatelessWidget {
  final List<VideoPost> videos;

  const VideoScrollableView({super.key, required this.videos});

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      scrollDirection: Axis.vertical,
      physics: const BouncingScrollPhysics(),
      itemCount: videos.length,
      itemBuilder: (context, index) {
        final videoPost = videos[index];
        return Stack(
          children: [
            //videoPlayer + gradiente
            SizedBox.expand(
                child: FullScreenPlayer(
              videoUrl: videoPost.videoUrl,
              caption: videoPost.caption,
            )),
            Positioned(
                bottom: 40, right: 20, child: VideoButtons(video: videoPost))
            //Botones
          ],
        );
      },
    );
  }
}