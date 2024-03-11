import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:tok_tik/config/helpers/human_formats.dart';
import 'package:tok_tik/domain/entities/video_post.dart';

class VideoButtons extends StatelessWidget {
  final VideoPost video;

  const VideoButtons({super.key, required this.video});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _customIconButton(
            value: video.likes,
            iconData: Icons.favorite,
            iconColor: Colors.red),
        _customIconButton(
            value: video.views, iconData: Icons.remove_red_eye_outlined)
      ],
    );
  }
}

class _customIconButton extends StatelessWidget {
  final int value;
  final IconData iconData;
  final Color? color;

  const _customIconButton(
      {required this.value, required this.iconData, iconColor})
      : color = iconColor ?? Colors.white;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(
          onPressed: () {},
          icon: Icon(
            iconData,
            color: color,
            size: 30,
          ),
        ),
        Text(HumanFormats.humanReadableNumber(value.toDouble()))
      ],
    );
  }
}
