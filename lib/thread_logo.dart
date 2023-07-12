import 'package:atlas_icons/atlas_icons.dart';
import 'package:flutter/material.dart';

import 'path/thread_path.dart';
import 'shapes/custom_track.dart';

class ThreadLogo extends StatefulWidget {
  const ThreadLogo({super.key});

  @override
  State<ThreadLogo> createState() => _ThreadLogoState();
}

class _ThreadLogoState extends State<ThreadLogo>
    with SingleTickerProviderStateMixin {
  late AnimationController _animation;
  PaintingStyle paintingStyle = PaintingStyle.stroke;
  bool isAnimating = true;
  double _sliderValue = 6.0;
  final colors = const [
    Color(0xffFFD600),
    Color(0xffFF7A00),
    Color(0xffFF0069),
    Color(0xffD300C5),
    Color(0xff7638FA),
  ];
  final List<double> stops = const [0.1, 0.4, 0.6, 0.8, 1];
  @override
  void initState() {
    super.initState();

    _animation = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 5000),
    )
      ..forward()
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed ||
            status == AnimationStatus.dismissed) {
          setState(() {
            isAnimating = false;
          });
        } else if (status == AnimationStatus.forward ||
            status == AnimationStatus.reverse) {
          setState(() {
            isAnimating = true;
          });
        }
      });
  }

  @override
  void dispose() {
    _animation.dispose();
    super.dispose();
  }

  void changePaintingStyle() {
    setState(() {
      if (paintingStyle == PaintingStyle.stroke) {
        paintingStyle = PaintingStyle.fill;
      } else {
        paintingStyle = PaintingStyle.stroke;
      }
    });
  }

  Widget get slider => ShaderMask(
        shaderCallback: (Rect bounds) {
          return LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: colors,
            stops: stops,
          ).createShader(bounds);
        },
        child: SliderTheme(
          data: SliderThemeData(
            trackHeight: 10,
            trackShape: CustomTrackShape(),
            activeTrackColor: Colors.white,
            inactiveTrackColor: Colors.white.withOpacity(0.3),
            thumbColor: Colors.white,
            overlayColor: Colors.white,
          ),
          child: Slider(
            value: _sliderValue,
            max: 30,
            label: _sliderValue.round().toString(),
            divisions: 30,
            min: 1,
            onChanged: (double newValue) {
              setState(() {
                _sliderValue = newValue;
              });
            },
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ShaderMask(
            shaderCallback: (bounds) => LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: colors,
              stops: stops,
            ).createShader(bounds),
            child: const Text(
              'THREAD',
              style: TextStyle(
                fontSize: 50.0,
                fontWeight: FontWeight.w700,
                letterSpacing: 10,
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.6,
            height: MediaQuery.of(context).size.height * 0.3,
            child: ThreadPath(
              animation: _animation.view,
              colorGradient: colors,
              paintingStyle: paintingStyle,
              gradientStops: stops,
              strokeWidth: _sliderValue,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CustomButton(
                colors: colors,
                onPressed: () {
                  _animation.reverse();
                },
                stops: stops,
                icon: Atlas.backward,
              ),
              CustomButton(
                colors: colors,
                onPressed: () {
                  _animation.forward();
                },
                stops: stops,
                icon: Atlas.fast_forward,
              ),
              CustomButton(
                colors: colors,
                onPressed: () {
                  if (_animation.isAnimating) {
                    _animation.stop();
                  } else {
                    _animation.repeat(reverse: true);
                  }
                },
                stops: stops,
                icon: _animation.isAnimating
                    ? Atlas.pause
                    : Atlas.rotating_arrows_right,
              ),
              CustomButton(
                colors: colors,
                stops: stops,
                onPressed: changePaintingStyle,
                icon: Atlas.roller_brush,
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 40,
            ),
            child: slider,
          ),
        ],
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      required this.colors,
      required this.onPressed,
      required this.stops,
      required this.icon});
  final List<Color> colors;
  final List<double> stops;
  final VoidCallback onPressed;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: colors,
              stops: stops)),
      child: IconButton(
        onPressed: onPressed,
        icon: Icon(
          icon,
          color: Colors.white,
        ),
      ),
    );
  }
}
