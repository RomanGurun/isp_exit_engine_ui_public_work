import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:permission_handler/permission_handler.dart';

class Scanner extends StatefulWidget {
  const Scanner({super.key});

  @override
  State<Scanner> createState() => _ScannerState();
}

class _ScannerState extends State<Scanner> {
  // Controller is created ONLY after permission is granted to avoid race conditions
  MobileScannerController? _controller;

  bool _hasScanned = false;
  bool _permissionGranted = false;
  bool _permissionChecked = false;

  @override
  void initState() {
    super.initState();
    _requestCameraPermission();
  }

  Future<void> _requestCameraPermission() async {
    final status = await Permission.camera.request();
    if (!mounted) return;

    final granted = status.isGranted;

    setState(() {
      _permissionGranted = granted;
      _permissionChecked = true;
      if (granted) {
        // Create controller only now — autoStart defaults to true in v6
        _controller = MobileScannerController(
          detectionSpeed: DetectionSpeed.noDuplicates,
          facing: CameraFacing.back,
        );
      }
    });
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  void _onDetect(BarcodeCapture capture) {
    if (_hasScanned) return;
    final barcodes = capture.barcodes;
    if (barcodes.isEmpty) return;

    final String? rawValue = barcodes.first.rawValue;
    if (rawValue == null || rawValue.isEmpty) return;

    // Set flag directly — no setState to avoid triggering a rebuild
    // while the bottom sheet is about to be shown
    _hasScanned = true;
    _controller?.stop();
    HapticFeedback.mediumImpact();

    // Defer showing the sheet until after the current frame completes
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) _showResultSheet(rawValue);
    });
  }

  void _showResultSheet(String data) {
    showModalBottomSheet(
      context: context,
      isDismissible: true,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (ctx) => _ResultSheet(
        data: data,
        onScanAgain: () {
          Navigator.of(ctx).pop();
          _hasScanned = false;
          _controller?.start();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // ── Loading: waiting for permission dialog ──────────────────────────────
    if (!_permissionChecked) {
      return const Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: CircularProgressIndicator(color: Colors.blueAccent),
        ),
      );
    }

    // ── Permission denied ───────────────────────────────────────────────────
    if (!_permissionGranted) {
      return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          foregroundColor: Colors.white,
          title: const Text(
            'QR Scanner',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
          ),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(32),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 60),
                const Icon(
                  Icons.no_photography_rounded,
                  color: Colors.white38,
                  size: 80,
                ),
                const SizedBox(height: 24),
                const Text(
                  'Camera Permission Required',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 12),
                const Text(
                  'Please grant camera access to use the QR scanner.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white60,
                    fontSize: 14,
                    height: 1.5,
                  ),
                ),
                const SizedBox(height: 32),
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueAccent,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 28,
                      vertical: 14,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () async {
                    await openAppSettings();
                  },
                  icon: const Icon(Icons.settings_rounded),
                  label: const Text('Open Settings'),
                ),
                const SizedBox(height: 12),
                TextButton(
                  onPressed: _requestCameraPermission,
                  child: const Text(
                    'Try Again',
                    style: TextStyle(color: Colors.white60),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }

    // ── Permission granted — show scanner ───────────────────────────────────
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        title: const Text(
          'QR Scanner',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
        ),
        actions: [
          // Torch toggle
          ValueListenableBuilder(
            valueListenable: _controller!,
            builder: (context, value, child) {
              final torchIcon = value.torchState == TorchState.on
                  ? Icons.flash_on_rounded
                  : Icons.flash_off_rounded;
              return IconButton(
                icon: Icon(torchIcon, color: Colors.white),
                onPressed: () => _controller?.toggleTorch(),
              );
            },
          ),
          // Flip camera
          IconButton(
            icon: const Icon(
              Icons.flip_camera_ios_rounded,
              color: Colors.white,
            ),
            onPressed: () => _controller?.switchCamera(),
          ),
        ],
      ),
      body: Stack(
        children: [
          // ── Camera preview ────────────────────────────────────────────────
          MobileScanner(controller: _controller!, onDetect: _onDetect),

          // ── Dark overlay with scan cutout ─────────────────────────────────
          const _ScannerOverlay(),

          // ── Bottom hint label ─────────────────────────────────────────────
          Positioned(
            bottom: 60,
            left: 0,
            right: 0,
            child: Center(
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.55),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: const Text(
                  'Align QR code within the frame',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ─── Scan Result Bottom Sheet ────────────────────────────────────────────────

class _ResultSheet extends StatelessWidget {
  final String data;
  final VoidCallback onScanAgain;

  const _ResultSheet({required this.data, required this.onScanAgain});

  @override
  Widget build(BuildContext context) {
    final isUrl = Uri.tryParse(data)?.hasScheme ?? false;

    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Container(
        margin: const EdgeInsets.all(16),
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: const Color(0xFF1C1C1E),
          borderRadius: BorderRadius.circular(24),
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ── Header ────────────────────────────────────────────────────────
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.green.withOpacity(0.15),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.check_circle_rounded,
                      color: Colors.greenAccent,
                      size: 28,
                    ),
                  ),
                  const SizedBox(width: 12),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Scan Successful',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        'QR code detected',
                        style: TextStyle(color: Colors.grey, fontSize: 13),
                      ),
                    ],
                  ),
                ],
              ),

              const SizedBox(height: 20),
              const Divider(color: Colors.white12),
              const SizedBox(height: 16),

              // ── Label ─────────────────────────────────────────────────────────
              const Text(
                'SCANNED DATA',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 11,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 1.2,
                ),
              ),
              const SizedBox(height: 8),

              // ── Data box ──────────────────────────────────────────────────────
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.06),
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(color: Colors.white12),
                ),
                child: SelectableText(
                  data,
                  style: TextStyle(
                    color: isUrl ? Colors.blueAccent : Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    height: 1.5,
                    decoration: isUrl
                        ? TextDecoration.underline
                        : TextDecoration.none,
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // ── Action buttons ────────────────────────────────────────────────
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton.icon(
                      style: OutlinedButton.styleFrom(
                        foregroundColor: Colors.white,
                        side: const BorderSide(color: Colors.white24),
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onPressed: () {
                        Clipboard.setData(ClipboardData(text: data));
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Copied to clipboard'),
                            behavior: SnackBarBehavior.floating,
                            duration: Duration(seconds: 2),
                          ),
                        );
                      },
                      icon: const Icon(Icons.copy_rounded, size: 18),
                      label: const Text('Copy'),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onPressed: onScanAgain,
                      icon: const Icon(Icons.qr_code_scanner_rounded, size: 18),
                      label: const Text('Scan Again'),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
            ],
          ), // Column
        ), // SingleChildScrollView
      ), // Container
    ); // Padding
  }
}

// ─── Scanner Overlay with corner brackets ────────────────────────────────────

class _ScannerOverlay extends StatelessWidget {
  const _ScannerOverlay();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    const cutoutSize = 260.0;
    final cutoutLeft = (size.width - cutoutSize) / 2;
    final cutoutTop = (size.height - cutoutSize) / 2 - 40;

    return Stack(
      children: [
        // Dark dim overlay with transparent cutout
        ColorFiltered(
          colorFilter: ColorFilter.mode(
            Colors.black.withOpacity(0.65),
            BlendMode.srcOut,
          ),
          child: Stack(
            children: [
              Container(
                decoration: const BoxDecoration(
                  color: Colors.black,
                  backgroundBlendMode: BlendMode.dstOut,
                ),
              ),
              Positioned(
                left: cutoutLeft,
                top: cutoutTop,
                width: cutoutSize,
                height: cutoutSize,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.green.withOpacity(0.25),
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
              ),
            ],
          ),
        ),

        // Corner bracket indicators
        Positioned(
          left: cutoutLeft,
          top: cutoutTop,
          width: cutoutSize,
          height: cutoutSize,
          child: CustomPaint(painter: _CornerPainter()),
        ),
      ],
    );
  }
}

class _CornerPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.green
      ..strokeWidth = 4
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    const cornerLength = 32.0;
    const radius = 16.0;
    final path = Path();

    // Top-left
    path.moveTo(0, cornerLength);
    path.lineTo(0, radius);
    path.arcToPoint(
      const Offset(radius, 0),
      radius: const Radius.circular(radius),
    );
    path.lineTo(cornerLength, 0);

    // Top-right
    path.moveTo(size.width - cornerLength, 0);
    path.lineTo(size.width - radius, 0);
    path.arcToPoint(
      Offset(size.width, radius),
      radius: const Radius.circular(radius),
    );
    path.lineTo(size.width, cornerLength);

    // Bottom-right
    path.moveTo(size.width, size.height - cornerLength);
    path.lineTo(size.width, size.height - radius);
    path.arcToPoint(
      Offset(size.width - radius, size.height),
      radius: const Radius.circular(radius),
    );
    path.lineTo(size.width - cornerLength, size.height);

    // Bottom-left
    path.moveTo(cornerLength, size.height);
    path.lineTo(radius, size.height);
    path.arcToPoint(
      Offset(0, size.height - radius),
      radius: const Radius.circular(radius),
    );
    path.lineTo(0, size.height - cornerLength);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
