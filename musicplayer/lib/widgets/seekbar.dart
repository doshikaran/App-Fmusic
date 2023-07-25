import 'dart:math';

import 'package:flutter/material.dart';

class SeekBarData {
  final Duration position;
  final Duration duration;

  SeekBarData(this.position, this.duration);
}

class SeekBar extends StatefulWidget {
  final Duration position;
  final Duration duration;
  final ValueChanged<Duration>? onChanged;
  final ValueChanged<Duration>? onChangeEnd;

  const SeekBar(
      {super.key,
      required this.position,
      required this.duration,
      this.onChanged,
      this.onChangeEnd});

  @override
  State<SeekBar> createState() => _SeekBarState();
}

class _SeekBarState extends State<SeekBar> {
  double? _dragvalue;
  String _formatDuration(Duration? duration) {
    if (duration == null) {
      return '--:--';
    } else {
      String minutes = duration.inMinutes.toString().padLeft(2, '0');
      String seconds =
          duration.inSeconds.remainder(60).toString().padLeft(2, '0');
      return '$minutes:$seconds';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(_formatDuration(widget.position)),
        Expanded(
          child: SliderTheme(
              data: SliderTheme.of(context).copyWith(
                  trackHeight: 3,
                  thumbShape: const RoundSliderThumbShape(
                      disabledThumbRadius: 3, enabledThumbRadius: 3),
                  overlayShape:
                      const RoundSliderOverlayShape(overlayRadius: 10),
                  activeTrackColor: Colors.white.withOpacity(0.2),
                  inactiveTrackColor: Colors.white,
                  thumbColor: Colors.white,
                  overlayColor: Colors.white),
              child: Slider(
                min: 0.0,
                max: widget.duration.inMilliseconds.toDouble(),
                value: min(
                    _dragvalue ?? widget.position.inMilliseconds.toDouble(),
                    widget.duration.inMilliseconds.toDouble()),
                onChanged: (value) {
                  setState(() {
                    _dragvalue = value;
                  });
                  if (widget.onChanged != null) {
                    widget.onChanged!(Duration(milliseconds: value.round()));
                  }
                },
                onChangeEnd: (value) {
                  if (widget.onChangeEnd != null) {
                    widget.onChangeEnd!(Duration(milliseconds: value.round()));
                  }
                  _dragvalue = null;
                },
              )),
        ),
        Text(_formatDuration(widget.duration)),
      ],
    );
  }
}
