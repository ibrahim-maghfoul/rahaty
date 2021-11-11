import 'package:flutter/foundation.dart';

class AudioSound {
  final String title;
  final String audio;
  final bool isListned;
  final String id;

  const AudioSound({
    @required this.title,
    @required this.audio,
    @required this.isListned,
    @required this.id,
  });
}
