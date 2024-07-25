part of 'player.dart';

class _PlayPauseButton extends StatelessWidget {
  const _PlayPauseButton({
    required this.animation,
    required this.pause,
    required this.play,
  });

  final AnimationController animation;
  final VoidCallback play;
  final VoidCallback pause;

  void _onPressed() {
    if (animation.isCompleted) {
      animation.reverse();
      return pause();
    }

    animation.forward();
    play();
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.play_pause,
        progress: animation,
        size: 38.sp,
        color: AppColors.blue,
      ),
      onPressed: _onPressed,
    );
  }
}
