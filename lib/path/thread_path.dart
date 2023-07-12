import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:thread_animation/extensions/path_ex.dart';

class ThreadPath extends AnimatedWidget {
  const ThreadPath({
    super.key,
    this.strokeWidth = 20.0,
    required this.colorGradient,
    required this.animation,
    required this.gradientStops,
    this.paintingStyle = PaintingStyle.stroke,
  }) : super(
          listenable: animation,
        );
  final double? strokeWidth;
  final List<Color> colorGradient;
  final Animation<double> animation;
  final PaintingStyle paintingStyle;
  final List<double> gradientStops;

  Animation<double> get curvedAnimation =>
      CurvedAnimation(parent: animation, curve: Curves.easeInOut);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: AnimatedPathPainter(
        curvedAnimation,
        colorGradient: colorGradient,
        gradientStops: gradientStops,
        paintingStyle: paintingStyle,
        strokeWidth: animation.value == 0.0 ? 0.0 : strokeWidth,
      ),
    );
  }
}

class AnimatedPathPainter extends CustomPainter {
  final Animation<double> _animation;
  final List<Color> colorGradient;
  final List<double> gradientStops;
  final double? strokeWidth;
  final PaintingStyle paintingStyle;
  AnimatedPathPainter(
    this._animation, {
    this.strokeWidth,
    required this.colorGradient,
    required this.gradientStops,
    required this.paintingStyle,
  }) : super(repaint: _animation);

  Path _createThreadsLogo(Size size) {
    Path path = Path();
    path.moveTo(size.width * 0.7240573, size.height * 0.4575266);
    path.cubicTo(
        size.width * 0.7328646,
        size.height * 0.4614161,
        size.width * 0.7284896,
        size.height * 0.4594292,
        size.width * 0.7240573,
        size.height * 0.4575266);
    path.cubicTo(
        size.width * 0.7163385,
        size.height * 0.3153031,
        size.width * 0.6386250,
        size.height * 0.2338802,
        size.width * 0.5081349,
        size.height * 0.2330469);
    path.cubicTo(
        size.width * 0.5075438,
        size.height * 0.2330432,
        size.width * 0.5069557,
        size.height * 0.2330432,
        size.width * 0.5063646,
        size.height * 0.2330432);
    path.cubicTo(
        size.width * 0.4283146,
        size.height * 0.2330432,
        size.width * 0.3634016,
        size.height * 0.2663589,
        size.width * 0.3234479,
        size.height * 0.3269828);
    path.lineTo(size.width * 0.3952135, size.height * 0.3762125);
    path.cubicTo(
        size.width * 0.4250604,
        size.height * 0.3309286,
        size.width * 0.4719021,
        size.height * 0.3212750,
        size.width * 0.5063990,
        size.height * 0.3212750);
    path.cubicTo(
        size.width * 0.5067974,
        size.height * 0.3212750,
        size.width * 0.5071974,
        size.height * 0.3212750,
        size.width * 0.5075917,
        size.height * 0.3212786);
    path.cubicTo(
        size.width * 0.5505573,
        size.height * 0.3215526,
        size.width * 0.5829792,
        size.height * 0.3340448,
        size.width * 0.6039635,
        size.height * 0.3584062);
    path.cubicTo(
        size.width * 0.6192344,
        size.height * 0.3761422,
        size.width * 0.6294479,
        size.height * 0.4006510,
        size.width * 0.6345052,
        size.height * 0.4315823);
    path.cubicTo(
        size.width * 0.5964115,
        size.height * 0.4251078,
        size.width * 0.5552135,
        size.height * 0.4231172,
        size.width * 0.5111719,
        size.height * 0.4256422);
    path.cubicTo(
        size.width * 0.3871078,
        size.height * 0.4327885,
        size.width * 0.3073495,
        size.height * 0.5051453,
        size.width * 0.3127063,
        size.height * 0.6056875);
    path.cubicTo(
        size.width * 0.3154245,
        size.height * 0.6566875,
        size.width * 0.3408318,
        size.height * 0.7005625,
        size.width * 0.3842448,
        size.height * 0.7292240);
    path.cubicTo(
        size.width * 0.4209500,
        size.height * 0.7534531,
        size.width * 0.4682240,
        size.height * 0.7653021,
        size.width * 0.5173557,
        size.height * 0.7626198);
    path.cubicTo(
        size.width * 0.5822396,
        size.height * 0.7590625,
        size.width * 0.6331406,
        size.height * 0.7343073,
        size.width * 0.6686510,
        size.height * 0.6890417);
    path.cubicTo(
        size.width * 0.6956198,
        size.height * 0.6546667,
        size.width * 0.7126771,
        size.height * 0.6101198,
        size.width * 0.7202083,
        size.height * 0.5539896);
    path.cubicTo(
        size.width * 0.7511302,
        size.height * 0.5726510,
        size.width * 0.7740469,
        size.height * 0.5972083,
        size.width * 0.7867031,
        size.height * 0.6267292);
    path.cubicTo(
        size.width * 0.8082240,
        size.height * 0.6769115,
        size.width * 0.8094792,
        size.height * 0.7593750,
        size.width * 0.7421927,
        size.height * 0.8266042);
    path.cubicTo(
        size.width * 0.6832396,
        size.height * 0.8855000,
        size.width * 0.6123750,
        size.height * 0.9109792,
        size.width * 0.5052786,
        size.height * 0.9117656);
    path.cubicTo(
        size.width * 0.3864802,
        size.height * 0.9108854,
        size.width * 0.2966344,
        size.height * 0.8727865,
        size.width * 0.2382193,
        size.height * 0.7985260);
    path.cubicTo(
        size.width * 0.1835182,
        size.height * 0.7289896,
        size.width * 0.1552484,
        size.height * 0.6285521,
        size.width * 0.1541937,
        size.height * 0.5000000);
    path.cubicTo(
        size.width * 0.1552484,
        size.height * 0.3714469,
        size.width * 0.1835182,
        size.height * 0.2710083,
        size.width * 0.2382193,
        size.height * 0.2014724);
    path.cubicTo(
        size.width * 0.2966344,
        size.height * 0.1272130,
        size.width * 0.3864786,
        size.height * 0.08911458,
        size.width * 0.5052771,
        size.height * 0.08823177);
    path.cubicTo(
        size.width * 0.6249375,
        size.height * 0.08912135,
        size.width * 0.7163490,
        size.height * 0.1274031,
        size.width * 0.7770000,
        size.height * 0.2020208);
    path.cubicTo(
        size.width * 0.8067396,
        size.height * 0.2386125,
        size.width * 0.8291615,
        size.height * 0.2846292,
        size.width * 0.8439427,
        size.height * 0.3382828);
    path.lineTo(size.width * 0.9280417, size.height * 0.3158448);
    path.cubicTo(
        size.width * 0.9101250,
        size.height * 0.2498031,
        size.width * 0.8819323,
        size.height * 0.1928943,
        size.width * 0.8435677,
        size.height * 0.1456979);
    path.cubicTo(
        size.width * 0.7658125,
        size.height * 0.05003479,
        size.width * 0.6520938,
        size.height * 0.001016396,
        size.width * 0.5055703,
        0);
    path.lineTo(size.width * 0.5049839, 0);
    path.cubicTo(
        size.width * 0.3587583,
        size.height * 0.001012865,
        size.width * 0.2463130,
        size.height * 0.05021771,
        size.width * 0.1707724,
        size.height * 0.1462464);
    path.cubicTo(
        size.width * 0.1035516,
        size.height * 0.2317000,
        size.width * 0.06887708,
        size.height * 0.3506026,
        size.width * 0.06771198,
        size.height * 0.4996484);
    path.lineTo(size.width * 0.06770833, size.height * 0.5000000);
    path.lineTo(size.width * 0.06771198, size.height * 0.5003516);
    path.cubicTo(
        size.width * 0.06887708,
        size.height * 0.6493958,
        size.width * 0.1035516,
        size.height * 0.7683021,
        size.width * 0.1707724,
        size.height * 0.8537552);
    path.cubicTo(
        size.width * 0.2463130,
        size.height * 0.9497813,
        size.width * 0.3587583,
        size.height * 0.9989896,
        size.width * 0.5049839,
        size.height);
    path.lineTo(size.width * 0.5055703, size.height);
    path.cubicTo(
        size.width * 0.6355729,
        size.height * 0.9990990,
        size.width * 0.7272083,
        size.height * 0.9650625,
        size.width * 0.8026979,
        size.height * 0.8896406);
    path.cubicTo(
        size.width * 0.9014635,
        size.height * 0.7909688,
        size.width * 0.8984896,
        size.height * 0.6672865,
        size.width * 0.8659375,
        size.height * 0.5913594);
    path.cubicTo(
        size.width * 0.8425833,
        size.height * 0.5369115,
        size.width * 0.7980573,
        size.height * 0.4926885,
        size.width * 0.7371719,
        size.height * 0.4634807);
    path.close();
    path.moveTo(size.width * 0.5127109, size.height * 0.6745156);
    path.cubicTo(
        size.width * 0.4583359,
        size.height * 0.6775781,
        size.width * 0.4018458,
        size.height * 0.6531719,
        size.width * 0.3990604,
        size.height * 0.6008958);
    path.cubicTo(
        size.width * 0.3969958,
        size.height * 0.5621354,
        size.width * 0.4266448,
        size.height * 0.5188854,
        size.width * 0.5160479,
        size.height * 0.5137333);
    path.cubicTo(
        size.width * 0.5262865,
        size.height * 0.5131427,
        size.width * 0.5363333,
        size.height * 0.5128542,
        size.width * 0.5462031,
        size.height * 0.5128542);
    path.cubicTo(
        size.width * 0.5786771,
        size.height * 0.5128542,
        size.width * 0.6090573,
        size.height * 0.5160089,
        size.width * 0.6366771,
        size.height * 0.5220469);
    path.cubicTo(
        size.width * 0.6263750,
        size.height * 0.6507031,
        size.width * 0.5659479,
        size.height * 0.6715937,
        size.width * 0.5127109,
        size.height * 0.6745156);

    return path;
  }

  @override
  void paint(Canvas canvas, Size size) {
    final animationPercent = _animation.value;
    final path = _createThreadsLogo(size).createAnimatedPath(animationPercent);

    Paint paint = Paint()..style = paintingStyle;

    paint.strokeWidth = strokeWidth!;
    paint.isAntiAlias = true;
    paint.strokeJoin = StrokeJoin.round;
    paint.strokeCap = StrokeCap.round;
    paint.shader = ui.Gradient.linear(
      size.bottomCenter(Offset.zero),
      size.topCenter(Offset.zero),
      colorGradient,
      gradientStops,
    );

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(AnimatedPathPainter oldDelegate) => true;
}
