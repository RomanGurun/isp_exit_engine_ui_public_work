import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hand_signature/signature.dart';
import 'package:isp_exit_form_implementation/core/constants/app_text_styles.dart';

import '../exit_theme.dart';
import '../widgets/exit_widgets.dart';

// ─────────────────────────────────────────────────────────────────────────────
// ExitPageSignature
//
// Shows the acknowledgement + signature step.
// onSign  is called with the PNG Uint8List once the user confirms.
// signed  / signatureBytes drive the UI state (managed by ExitFormScreen).
// ─────────────────────────────────────────────────────────────────────────────
class ExitPageSignature extends StatefulWidget {
  final bool signed;
  final Uint8List? signatureBytes;
  final void Function(Uint8List bytes) onSign;
  final bool submitted;

  const ExitPageSignature({
    super.key,
    required this.signed,
    required this.onSign,
    this.signatureBytes,
    this.submitted = false,
  });

  @override
  State<ExitPageSignature> createState() => _ExitPageSignatureState();
}

class _ExitPageSignatureState extends State<ExitPageSignature> {
  // Opens the real hand_signature bottom-sheet pad.
  Future<void> _captureSignature() async {
    final control = HandSignatureControl(
      initialSetup: const SignaturePathSetup(
        threshold: 3.0,
        smoothRatio: 0.65,
        velocityRange: 2.0,
      ),
    );

    try {
      await showModalBottomSheet<void>(
        context: context,
        isScrollControlled: true,
        enableDrag: false, // prevents sheet-drag from swallowing drawing strokes
        backgroundColor: Colors.transparent,
        builder: (_) => _SignaturePadSheet(
          control: control,
          onConfirm: (bytes) {
            if (bytes != null) widget.onSign(bytes);
          },
        ),
      );
    } finally {
      control.dispose();
    }
  }

  @override
  Widget build(BuildContext context) {
    if (widget.submitted) {
      return ExitSuccessView(employeeName: dummyEmployee.name);
    }

    return SingleChildScrollView(
      padding: EdgeInsets.fromLTRB(16.w, 16.h, 16.w, 24.h),
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          ExitSectionHeader(badge: '✏', title: 'Acknowledgement & Signature'),
          ExitCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Employee Signature',
                  style: AppTextStyle.semiBold(11).copyWith(
                    letterSpacing: 0.4,
                    color: ExitColors.textMuted,
                  ),
                ),
                SizedBox(height: 5.h),

                // ── Signature preview / tap-to-sign area ──────────────────
                GestureDetector(
                  onTap: _captureSignature,
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    height: 100.h,
                    width: double.infinity,
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      color: widget.signed
                          ? ExitColors.greenLight
                          : ExitColors.bg,
                      borderRadius: BorderRadius.circular(10.r),
                      border: Border.all(
                        color: widget.signed
                            ? ExitColors.green
                            : ExitColors.borderMed,
                        width: 1.5,
                      ),
                    ),
                    child: widget.signatureBytes != null
                        // ── Show actual drawn signature ──────────────────
                        ? Stack(
                            fit: StackFit.expand,
                            children: [
                              Image.memory(
                                widget.signatureBytes!,
                                fit: BoxFit.contain,
                              ),
                              // Re-sign badge
                              Positioned(
                                top: 6.h,
                                right: 8.w,
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 8.w, vertical: 2.h),
                                  decoration: BoxDecoration(
                                    color: ExitColors.g8.withValues(alpha: 0.12),
                                    borderRadius: BorderRadius.circular(20.r),
                                    border: Border.all(
                                        color: ExitColors.g8, width: 1),
                                  ),
                                  child: Text(
                                    'Tap to re-sign',
                                    style: AppTextStyle.medium(10).copyWith(
                                      color: ExitColors.g8,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )
                        // ── Empty / prompt state ─────────────────────────
                        : Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('✍️',
                                  style: TextStyle(fontSize: 22.sp)),
                              SizedBox(height: 4.h),
                              Text(
                                'Tap to capture signature',
                                style: AppTextStyle.regular(13).copyWith(
                                  color: ExitColors.textHint,
                                ),
                              ),
                            ],
                          ),
                  ),
                ),

                // ── Disclaimer / confirmed banner ─────────────────────────
                if (!widget.signed) ...[
                  SizedBox(height: 12.h),
                  Text(
                    'By signing, you confirm that the information provided in '
                    'this exit interview is accurate and complete to the best '
                    'of your knowledge.',
                    style: AppTextStyle.regular(11).copyWith(
                      letterSpacing: 0.4,
                      color: ExitColors.textMuted,
                    ),
                  ),
                ],
                if (widget.signed) ...[
                  SizedBox(height: 12.h),
                  Container(
                    padding: EdgeInsets.all(12.w),
                    decoration: BoxDecoration(
                      color: ExitColors.greenLight,
                      borderRadius: BorderRadius.circular(10.r),
                      border: Border.all(
                          color: ExitColors.green.withValues(alpha: 0.3)),
                    ),
                    child: Row(
                      children: [
                        const Icon(Icons.verified_outlined,
                            color: ExitColors.green, size: 18),
                        SizedBox(width: 8.w),
                        Expanded(
                          child: Text(
                            'Signature recorded. You may now submit the form.',
                            style: AppTextStyle.medium(12).copyWith(
                              color: ExitColors.green,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Signature Pad Bottom Sheet
//
// Uses HandSignaturePaint + Listener (same approach as RC Rollback) to avoid
// the package's broken internal gesture detector.
// ─────────────────────────────────────────────────────────────────────────────
class _SignaturePadSheet extends StatefulWidget {
  final HandSignatureControl control;
  final void Function(Uint8List? bytes) onConfirm;

  const _SignaturePadSheet({
    required this.control,
    required this.onConfirm,
  });

  @override
  State<_SignaturePadSheet> createState() => _SignaturePadSheetState();
}

class _SignaturePadSheetState extends State<_SignaturePadSheet> {
  HandSignatureControl get control => widget.control;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.52,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24.r)),
      ),
      child: Column(
        children: [
          // ── Handle bar ────────────────────────────────────────────────
          Container(
            margin: EdgeInsets.only(top: 10.h, bottom: 4.h),
            width: 40.w,
            height: 4.h,
            decoration: BoxDecoration(
              color: ExitColors.borderMed,
              borderRadius: BorderRadius.circular(4.r),
            ),
          ),

          // ── Header ───────────────────────────────────────────────────
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
            child: Row(
              children: [
                Text(
                  'Employee Signature',
                  style: AppTextStyle.bold(15).copyWith(
                    color: ExitColors.text,
                  ),
                ),
                const Spacer(),
                TextButton.icon(
                  onPressed: () => control.clear(),
                  icon: Icon(Icons.refresh_rounded,
                      size: 18.sp, color: ExitColors.textMuted),
                  label: Text(
                    'Clear',
                    style: AppTextStyle.regular(13).copyWith(
                      color: ExitColors.textMuted,
                    ),
                  ),
                ),
              ],
            ),
          ),

          Divider(color: ExitColors.border, height: 1),

          // ── Drawing canvas ────────────────────────────────────────────
          Expanded(
            child: Container(
              margin: EdgeInsets.all(16.r),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12.r),
                border: Border.all(color: ExitColors.borderMed, width: 1.5),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(11.r),
                child: AnimatedBuilder(
                  animation: control,
                  builder: (context, _) => Listener(
                    behavior: HitTestBehavior.opaque,
                    onPointerDown: (e) {
                      if (!control.hasActivePath) {
                        control.startPath(e.localPosition,
                            pressure: e.pressure);
                      }
                    },
                    onPointerMove: (e) {
                      if (control.hasActivePath) {
                        control.alterPath(e.localPosition,
                            pressure: e.pressure);
                      }
                    },
                    onPointerUp: (e) {
                      if (control.hasActivePath) {
                        control.closePath(
                            point: e.localPosition, pressure: e.pressure);
                      }
                    },
                    onPointerCancel: (e) {
                      if (control.hasActivePath) {
                        control.closePath(pressure: e.pressure);
                      }
                    },
                    child: SizedBox.expand(
                      child: HandSignaturePaint(
                        control: control,
                        drawer: const ShapeSignatureDrawer(
                          color: Color(0xFF1A1A1A),
                          width: 1.5,
                          maxWidth: 3.5,
                        ),
                        onSize: control.notifyDimension,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),

          // ── Action buttons ────────────────────────────────────────────
          Padding(
            padding: EdgeInsets.fromLTRB(16.w, 8.h, 16.w, 24.h),
            child: Row(
              children: [
                // Cancel
                Expanded(
                  child: OutlinedButton(
                    onPressed: () => Navigator.of(context).pop(),
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(
                          color: ExitColors.borderMed, width: 1.5),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.r)),
                      padding: EdgeInsets.symmetric(vertical: 14.h),
                    ),
                    child: Text(
                      'Cancel',
                      style: AppTextStyle.semiBold(14).copyWith(
                        color: ExitColors.textMuted,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 12.w),
                // Confirm
                Expanded(
                  child: ElevatedButton(
                    onPressed: () async {
                      if (!control.isFilled) return; // nothing drawn
                      final byteData = await control.toImage(
                        width: 600,
                        height: 300,
                        background: Colors.white,
                        drawer: const ShapeSignatureDrawer(
                          color: Color(0xFF1A1A1A),
                          width: 1.5,
                          maxWidth: 3.5,
                        ),
                      );
                      final bytes = byteData?.buffer.asUint8List();
                      widget.onConfirm(bytes);
                      if (context.mounted) Navigator.of(context).pop();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: ExitColors.g8,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.r)),
                      padding: EdgeInsets.symmetric(vertical: 14.h),
                      elevation: 0,
                    ),
                    child: Text(
                      'Confirm',
                      style: AppTextStyle.semiBold(14).copyWith(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
