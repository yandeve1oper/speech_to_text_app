extension DurationExtension on Duration {
  String _getTwoDigits(int n) => n.remainder(60).toString().padLeft(2, '0');

  String get durationString {
    final Duration(:inMinutes, :inSeconds, :inHours) = this;
    final minutes = _getTwoDigits(inMinutes);
    final seconds = _getTwoDigits(inSeconds);
    final value = '$minutes:$seconds';

    if (inHours > 0) {
      final hours = _getTwoDigits(inHours);

      return '$hours:$value';
    }

    return value;
  }
}
