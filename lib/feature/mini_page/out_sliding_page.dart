import 'dart:async';
import 'package:flutter/material.dart';

// void main() => runApp(const MyApp());

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Sliding Page UI',
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(fontFamily: 'serif'),
//       home: const SlidingPageUI(),
//     );
//   }
// }

// ─── Slide Data ───────────────────────────────────────────────────────────────

class SlideData {
  final String tag;
  final String title;
  final String titleItalic;
  final String body;
  final String cta;
  final String ghost;
  final Color bgText;
  final Color bgVisual;
  final Widget visual;

  const SlideData({
    required this.tag,
    required this.title,
    required this.titleItalic,
    required this.body,
    required this.cta,
    required this.ghost,
    required this.bgText,
    required this.bgVisual,
    required this.visual,
  });
}

// ─── Main Screen ──────────────────────────────────────────────────────────────

class SlidingPageUI extends StatefulWidget {
  const SlidingPageUI({super.key});

  @override
  State<SlidingPageUI> createState() => _SlidingPageUIState();
}

class _SlidingPageUIState extends State<SlidingPageUI> {
  final PageController _controller = PageController();
  int _currentPage = 0;
  Timer? _timer;

  final List<SlideData> slides = [
    SlideData(
      tag: 'DESIGN & MOTION',
      title: 'Create ',
      titleItalic: 'spaces\nthat breathe',
      body:
          'Where intentional whitespace meets purposeful motion — every pixel earns its place on the canvas.',
      cta: 'Explore work',
      ghost: 'View process',
      bgText: const Color(0xFF1a1060),
      bgVisual: const Color(0xFF110b4d),
      visual: const OrbVisual(),
    ),
    SlideData(
      tag: 'BRAND SYSTEMS',
      title: 'Built from\n',
      titleItalic: 'earth up',
      body:
          'Identities rooted in strategy — visual languages that grow more resonant the longer they\'re used.',
      cta: 'See case studies',
      ghost: 'Our approach',
      bgText: const Color(0xFF3d1a0f),
      bgVisual: const Color(0xFF2a1008),
      visual: const GeoVisual(),
    ),
    SlideData(
      tag: 'DATA & ANALYTICS',
      title: 'Numbers\ntell ',
      titleItalic: 'stories',
      body:
          'Turn raw metrics into visual narratives your team can act on — dashboards built for clarity, not complexity.',
      cta: 'Start free trial',
      ghost: 'Live demo',
      bgText: const Color(0xFF0b2e2b),
      bgVisual: const Color(0xFF061c1a),
      visual: const WaveVisual(),
    ),
    SlideData(
      tag: 'AI & GENERATIVE',
      title: '',
      titleItalic: 'Intelligence\nwoven in',
      body:
          'AI that disappears into the workflow — subtle, responsive, never in the way. Augment, don\'t override.',
      cta: 'Request access',
      ghost: 'Read manifesto',
      bgText: const Color(0xFF2a1228),
      bgVisual: const Color(0xFF1a0b18),
      visual: const DotsVisual(),
    ),
  ];

  @override
  void initState() {
    super.initState();
    _startAutoPlay();
  }

  void _startAutoPlay() {
    _timer = Timer.periodic(const Duration(seconds: 4), (_) {
      final next = (_currentPage + 1) % slides.length;
      _controller.animateToPage(
        next,
        duration: const Duration(milliseconds: 700),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF111111),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: SizedBox(
              height: 520,
              child: Stack(
                children: [
                  PageView.builder(
                    controller: _controller,
                    itemCount: slides.length,
                    onPageChanged: (i) => setState(() => _currentPage = i),
                    itemBuilder: (_, i) => _SlideView(
                      data: slides[i],
                      index: i,
                      total: slides.length,
                    ),
                  ),

                  // ── Pagination dots ──────────────────────────────────────
                  Positioned(
                    bottom: 20,
                    left: 0,
                    right: 0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(slides.length, (i) {
                        final active = i == _currentPage;
                        return AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          margin: const EdgeInsets.symmetric(horizontal: 4),
                          width: active ? 24 : 6,
                          height: 6,
                          decoration: BoxDecoration(
                            color: active
                                ? Colors.white
                                : Colors.white.withOpacity(0.3),
                            borderRadius: BorderRadius.circular(4),
                          ),
                        );
                      }),
                    ),
                  ),

                  // ── Arrow: previous ──────────────────────────────────────
                  Positioned(
                    left: 16,
                    top: 0,
                    bottom: 0,
                    child: Center(
                      child: _ArrowButton(
                        icon: Icons.chevron_left,
                        onTap: () {
                          _timer?.cancel();
                          _controller.previousPage(
                            duration: const Duration(milliseconds: 700),
                            curve: Curves.easeInOut,
                          );
                          _startAutoPlay();
                        },
                      ),
                    ),
                  ),

                  // ── Arrow: next ──────────────────────────────────────────
                  Positioned(
                    right: 16,
                    top: 0,
                    bottom: 0,
                    child: Center(
                      child: _ArrowButton(
                        icon: Icons.chevron_right,
                        onTap: () {
                          _timer?.cancel();
                          _controller.nextPage(
                            duration: const Duration(milliseconds: 700),
                            curve: Curves.easeInOut,
                          );
                          _startAutoPlay();
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// ─── Single Slide ─────────────────────────────────────────────────────────────

class _SlideView extends StatelessWidget {
  final SlideData data;
  final int index;
  final int total;

  const _SlideView({
    required this.data,
    required this.index,
    required this.total,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Left: text panel
        Expanded(
          child: Container(
            color: data.bgText,
            padding: const EdgeInsets.all(48),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          data.tag,
                          style: const TextStyle(
                            fontSize: 11,
                            letterSpacing: 2.5,
                            color: Colors.white60,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          '0${index + 1} / 0$total',
                          style: const TextStyle(
                            fontSize: 11,
                            letterSpacing: 2,
                            color: Colors.white38,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 28),
                    RichText(
                      text: TextSpan(
                        style: const TextStyle(
                          fontSize: 38,
                          height: 1.15,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                        children: [
                          TextSpan(text: data.title),
                          TextSpan(
                            text: data.titleItalic,
                            style: const TextStyle(
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      data.body,
                      style: const TextStyle(
                        fontSize: 13,
                        height: 1.75,
                        color: Colors.white54,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    const SizedBox(height: 28),
                    Row(
                      children: [
                        _CtaButton(label: data.cta),
                        const SizedBox(width: 20),
                        Text(
                          data.ghost,
                          style: const TextStyle(
                            fontSize: 13,
                            color: Colors.white38,
                            decoration: TextDecoration.underline,
                            decorationColor: Colors.white24,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),

        // Right: visual panel
        Expanded(
          child: Container(
            color: data.bgVisual,
            child: Center(child: data.visual),
          ),
        ),
      ],
    );
  }
}

// ─── Arrow Button ─────────────────────────────────────────────────────────────

class _ArrowButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const _ArrowButton({required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.08),
          shape: BoxShape.circle,
        ),
        child: Icon(icon, color: Colors.white, size: 20),
      ),
    );
  }
}

// ─── CTA Button ───────────────────────────────────────────────────────────────

class _CtaButton extends StatelessWidget {
  final String label;
  const _CtaButton({required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(100),
      ),
      child: Text(
        '$label →',
        style: const TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w500,
          color: Color(0xFF0a0a0a),
        ),
      ),
    );
  }
}

// ─── Visual Widgets ───────────────────────────────────────────────────────────

/// Slide 1 — Animated glowing orb
class OrbVisual extends StatefulWidget {
  const OrbVisual({super.key});

  @override
  State<OrbVisual> createState() => _OrbVisualState();
}

class _OrbVisualState extends State<OrbVisual>
    with SingleTickerProviderStateMixin {
  late AnimationController _ctrl;
  late Animation<double> _anim;

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    )..repeat(reverse: true);
    _anim = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(CurvedAnimation(parent: _ctrl, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _anim,
      builder: (_, __) {
        final dy = -14 * _anim.value;
        final scale = 1.0 + 0.04 * _anim.value;
        return Transform.translate(
          offset: Offset(0, dy),
          child: Transform.scale(
            scale: scale,
            child: Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: const RadialGradient(
                  center: Alignment(-0.3, -0.3),
                  colors: [Color(0xFFa78bfa), Color(0xFF4c1d95)],
                ),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFF8b5cf6).withOpacity(0.35),
                    blurRadius: 80,
                    spreadRadius: 10,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

/// Slide 2 — Pulsing 2×2 grid
class GeoVisual extends StatefulWidget {
  const GeoVisual({super.key});

  @override
  State<GeoVisual> createState() => _GeoVisualState();
}

class _GeoVisualState extends State<GeoVisual>
    with SingleTickerProviderStateMixin {
  late AnimationController _ctrl;

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2800),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colors = [
      const Color(0xFFc0632a),
      const Color(0xFFe07846),
      const Color(0xFFe07846),
      const Color(0xFFf0a882),
    ];
    final delays = [0.0, 0.15, 0.08, 0.25];

    return SizedBox(
      width: 180,
      height: 180,
      child: GridView.count(
        crossAxisCount: 2,
        mainAxisSpacing: 12,
        crossAxisSpacing: 12,
        physics: const NeverScrollableScrollPhysics(),
        children: List.generate(4, (i) {
          return AnimatedBuilder(
            animation: _ctrl,
            builder: (_, __) {
              final t = (((_ctrl.value + delays[i]) % 1.0));
              final scale = 0.9 + 0.1 * (1 - (t - 0.5).abs() * 2).clamp(0, 1);
              final opacity = 0.7 + 0.3 * (1 - (t - 0.5).abs() * 2).clamp(0, 1);
              return Transform.scale(
                scale: scale,
                child: Opacity(
                  opacity: opacity,
                  child: Container(
                    decoration: BoxDecoration(
                      color: colors[i],
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              );
            },
          );
        }),
      ),
    );
  }
}

/// Slide 3 — Wave chart
class WaveVisual extends StatelessWidget {
  const WaveVisual({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(size: const Size(240, 160), painter: _WavePainter());
  }
}

class _WavePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    const teal = Color(0xFF2dd4bf);

    final primaryPaint = Paint()
      ..color = teal
      ..strokeWidth = 2.5
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;

    final secondaryPaint = Paint()
      ..color = teal.withOpacity(0.3)
      ..strokeWidth = 1.5
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;

    final dashPaint = Paint()
      ..color = teal.withOpacity(0.15)
      ..strokeWidth = 1;

    final dotPaint = Paint()
      ..color = teal
      ..style = PaintingStyle.fill;

    // Primary line points
    final pts = [
      Offset(0, 120),
      Offset(40, 90),
      Offset(80, 110),
      Offset(120, 60),
      Offset(160, 80),
      Offset(200, 30),
      Offset(240, 50),
    ];

    // Secondary line points
    final pts2 = [
      Offset(0, 140),
      Offset(40, 125),
      Offset(80, 135),
      Offset(120, 100),
      Offset(160, 115),
      Offset(200, 80),
      Offset(240, 90),
    ];

    final path1 = Path()..moveTo(pts[0].dx, pts[0].dy);
    for (final p in pts.skip(1)) path1.lineTo(p.dx, p.dy);

    final path2 = Path()..moveTo(pts2[0].dx, pts2[0].dy);
    for (final p in pts2.skip(1)) path2.lineTo(p.dx, p.dy);

    canvas.drawPath(path2, secondaryPaint);
    canvas.drawPath(path1, primaryPaint);

    // Highlight dots at peaks
    for (final p in [pts[3], pts[5]]) {
      // vertical dashed line
      double y = p.dy;
      while (y < size.height) {
        canvas.drawLine(Offset(p.dx, y), Offset(p.dx, y + 3), dashPaint);
        y += 6;
      }
      canvas.drawCircle(p, 5, dotPaint);
    }

    // Labels
    final tp = TextPainter(textDirection: TextDirection.ltr);
    void drawLabel(String text, Offset pos) {
      tp.text = TextSpan(
        text: text,
        style: const TextStyle(color: teal, fontSize: 10),
      );
      tp.layout();
      tp.paint(canvas, pos);
    }

    drawLabel('+42%', Offset(pts[3].dx - 12, pts[3].dy - 14));
    drawLabel('+78%', Offset(pts[5].dx - 12, pts[5].dy - 14));
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

/// Slide 4 — Blinking dot grid
class DotsVisual extends StatefulWidget {
  const DotsVisual({super.key});

  @override
  State<DotsVisual> createState() => _DotsVisualState();
}

class _DotsVisualState extends State<DotsVisual>
    with SingleTickerProviderStateMixin {
  late AnimationController _ctrl;

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat();
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const color = Color(0xFFc084fc);
    const cols = 6;
    const rows = 3;

    return AnimatedBuilder(
      animation: _ctrl,
      builder: (_, __) {
        return SizedBox(
          width: 160,
          height: 80,
          child: GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: cols,
              mainAxisSpacing: 14,
              crossAxisSpacing: 14,
            ),
            itemCount: cols * rows,
            itemBuilder: (_, i) {
              final delay = i * 0.15;
              final t = ((_ctrl.value + delay) % 1.0);
              final opacity = 0.2 + 0.8 * (1 - (t - 0.5).abs() * 2).clamp(0, 1);
              return Opacity(
                opacity: opacity,
                child: Container(
                  decoration: const BoxDecoration(
                    color: color,
                    shape: BoxShape.circle,
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
