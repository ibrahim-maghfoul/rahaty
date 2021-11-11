import 'package:flutter/foundation.dart';
import 'package:rahaty/models/audio.dart';

class Jalssa {
  final String id;
  final String title;
  final String icon;
  final int jalassatCount;
  final List<AudioSound> jalassatSounds;
  final String bgImage;
  final double progress;

  const Jalssa({
    @required this.title,
    @required this.icon,
    @required this.jalassatSounds,
    @required this.id,
    @required this.jalassatCount,
    @required this.bgImage,
    @required this.progress,
  });
}
