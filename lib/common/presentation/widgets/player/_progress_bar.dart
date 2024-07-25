part of 'player.dart';

class _ProgressBar extends StatelessWidget {
  final Duration position;
  final Duration duration;
  final void Function(double value)? seekTo;

  const _ProgressBar({
    required this.position,
    required this.duration,
    required this.seekTo,
  });

  double get _value {
    final position = this.position.inMilliseconds;
    final duration = this.duration.inMilliseconds;

    return duration > 0.0 ? position / duration : 0.0;
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Slider(value: _value, onChanged: seekTo),
      const SizedBox(height: 6),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(position.durationString),
          if (duration.inMilliseconds > 0) Text(duration.durationString),
        ],
      ),
    ]);
  }
}
