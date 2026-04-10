import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../exit_theme.dart';

// App Header (Navy Topbar)
class ExitAppHeader extends StatelessWidget {
  const ExitAppHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: ExitColors.g8,
      child: SafeArea(
        bottom: false,
        child: Padding(
          padding: EdgeInsetsGeometry.fromLTRB(20.w, 14.h, 20.w, 16.h),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'ISP Company',
                style: GoogleFonts.dmSans(
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 1.6,
                  // color: const Color(0xFF5B9BD5),
                  color: ExitColors.pureWhite,
                ),
              ),
              SizedBox(height: 3.h),
              Text(
                'Exit Interview Form',
                style: GoogleFonts.dmSans(
                  fontSize: 17.sp,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 2.h),
            ],
          ),
        ),
      ),
    );
  }
}

//============== Step Bar (Progress indicator ) =================

class ExitStepBar extends StatelessWidget {
  final int currentStep;
  final int totalSteps;
  final String stepLabel;

  const ExitStepBar({
    super.key,
    required this.currentStep,
    required this.stepLabel,
    required this.totalSteps,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(20.2, 12.h, 20.w, 10.h),
      decoration: BoxDecoration(
        color: ExitColors.surface,
        border: Border(bottom: BorderSide(color: ExitColors.g8)),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                stepLabel,
                style: GoogleFonts.dmSans(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                  color: ExitColors.text,
                ),
              ),

              Text(
                '${currentStep + 1} of $totalSteps',
                style: GoogleFonts.dmSans(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                  color: ExitColors.pureBlack,
                ),
              ),
            ],
          ),

          SizedBox(height: 10.h),
          Row(
            children: List.generate(totalSteps, (i) {
              final isDone = i < currentStep;
              final isActive = i == currentStep;
              return AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                width: isActive ? 23.w : 6.w,
                height: 7.h,
                margin: EdgeInsets.only(right: 6.w),
                decoration: BoxDecoration(
                  color: isDone
                      ? const Color(0xFF1D6FBF)
                      : isActive
                      ? ExitColors.g8
                      : ExitColors.border,
                  borderRadius: BorderRadius.circular(3.r),
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}

//============== Section Header (badge + title + line) ================

class ExitSectionHeader extends StatelessWidget {
  final String badge;
  final String title;

  const ExitSectionHeader({
    super.key,
    required this.badge,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 14.h),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 7.h),

            decoration: BoxDecoration(
              color: ExitColors.g8,
              borderRadius: BorderRadius.circular(4.r),
            ),
            child: Text(
              badge,
              style: GoogleFonts.dmSans(
                fontSize: 12.sp,
                fontWeight: FontWeight.w600,
                letterSpacing: 0.8,
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(width: 8.w),
          Text(
            title,
            style: GoogleFonts.dmSans(
              fontSize: 15.sp,
              fontWeight: FontWeight.w600,
              color: ExitColors.text,
            ),
          ),
          SizedBox(width: 8.w),
          Expanded(child: Container(height: 1, color: ExitColors.border)),
        ],
      ),
    );
  }
}

//============ CARD CONTAINER ======================
class ExitCard extends StatelessWidget {
  final Widget child;
  final EdgeInsets? padding;
  const ExitCard({super.key, required this.child, this.padding});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(bottom: 10.h),
      padding: padding ?? EdgeInsets.all(14.w),
      decoration: BoxDecoration(
        color: ExitColors.surface,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: ExitColors.border),
      ),
      child: child,
    );
  }
}

class ExitAutoFilledBadge extends StatelessWidget {
  const ExitAutoFilledBadge({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10.h),
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 2.h),
      decoration: BoxDecoration(
        color: ExitColors.pureWhite,
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(color: ExitColors.g8),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(
            Icons.check_circle_outline_rounded,
            size: 19,
            color: ExitColors.g8,
          ),
          SizedBox(width: 4.w),
          Text(
            'Auto-Filled from system',
            style: GoogleFonts.dmSans(
              fontSize: 12.5.sp,
              fontWeight: FontWeight.w600,
              letterSpacing: 0.5,
              color: ExitColors.g8,
            ),
          ),
        ],
      ),
    );
  }
}

//============== Read Only Field (Auto filled from System) =========================

class ExitReadOnlyField extends StatelessWidget {
  final String label;
  final String value;

  const ExitReadOnlyField({
    super.key,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          label.toUpperCase(),
          style: GoogleFonts.dmSans(
            fontSize: 12.sp,
            fontWeight: FontWeight.w700,
            letterSpacing: 0.4,
            color: ExitColors.pureBlack,
          ),
        ),
        SizedBox(height: 5.h),
        Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 11.w, vertical: 9.h),
          decoration: BoxDecoration(
            color: ExitColors.bg,
            borderRadius: BorderRadius.circular(10.r),
            border: Border.all(color: ExitColors.border),
          ),
          child: Text(
            value,
            style: GoogleFonts.dmSans(
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
              color: ExitColors.pureBlack,
            ),
          ),
        ),
      ],
    );
  }
}

// NAV FOOTER (Back + Next/Submit)
enum ExitNavButtonStyle { normal, submit, success }

class ExitNavFooter extends StatelessWidget {
  final bool showBack;
  final VoidCallback onBack;
  final VoidCallback onNext;
  final ExitNavButtonStyle nextStyle;
  final bool loading;

  const ExitNavFooter({
    super.key,
    required this.showBack,
    required this.onBack,
    required this.onNext,
    this.nextStyle = ExitNavButtonStyle.normal,
    this.loading = false,
  });

  @override
  Widget build(BuildContext context) {
    String nextLabel;
    Color nextColor;
    switch (nextStyle) {
      case ExitNavButtonStyle.submit:
        nextLabel = 'Submit Form';
        nextColor = ExitColors.blue;
        break;

      case ExitNavButtonStyle.success:
        nextLabel = "✓ Done ";
        nextColor = ExitColors.green;
        break;
      case ExitNavButtonStyle.normal:
        nextLabel = loading ? 'Submitting...' : 'Next →';
        nextColor = ExitColors.g8;
        break;
    }

    return Container(
      padding: EdgeInsets.fromLTRB(
        16.w,
        12.h,
        16.w,
        12.h + MediaQuery.of(context).padding.bottom,
      ),
      decoration: BoxDecoration(
        color: ExitColors.surface,
        border: Border(top: BorderSide(color: ExitColors.border)),
      ),
      child: Row(
        children: [
          if (showBack) ...[
            Expanded(
              child: GestureDetector(
                onTap: onBack,
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 13.h),
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(16.r),
                    border: Border.all(color: ExitColors.borderMed),
                  ),
                  child: Center(
                    child: Text(
                      '← Back',
                      style: GoogleFonts.dmSans(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                        color: ExitColors.pureBlack,
                      ),
                    ),
                  ),
                ),
              ),
            ),

            SizedBox(width: 10.w),
          ],
          Expanded(
            flex: 2,
            child: GestureDetector(
              onTap: loading
                  ? null
                  : onNext,
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 13.h),
                decoration: BoxDecoration(
                  color: nextColor,
                  borderRadius: BorderRadius.circular(16.r),
                ),
                child: Center(
                  child: loading
                      ? SizedBox(
                          height: 18.w,
                          width: 18.w,
                          child: const CircularProgressIndicator(
                            color: Colors.white,
                            strokeWidth: 2,
                          ),
                        )
                      : Text(
                          nextLabel,
                          style: GoogleFonts.dmSans(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
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

//================= Text Input Filed =========================

class ExitTextField extends StatelessWidget {
  final String label;
  final TextEditingController? controller;
  final String? hint;
  final TextInputType? keyboardType;
  final int maxLines;

  const ExitTextField({
    super.key,
    required this.label,
    this.controller,
    this.hint,
    this.keyboardType,
    this.maxLines = 1,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label.toUpperCase(),
          style: GoogleFonts.dmSans(
            fontSize: 12.sp,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.4,
            color: ExitColors.textMuted,
          ),
        ),
        SizedBox(height: 5.h),
        TextFormField(
          controller: controller,
          keyboardType: keyboardType,
          maxLines: maxLines,
          autofocus: false,
          style: GoogleFonts.dmSans(fontSize: 14, color: ExitColors.text),
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: GoogleFonts.dmSans(
              fontSize: 14.sp,
              color: ExitColors.textMuted,
            ),
            filled: true,
            fillColor: ExitColors.bg,
            contentPadding: EdgeInsets.symmetric(
              horizontal: 11.w,
              vertical: 9.h,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.r),
              borderSide: BorderSide(color: ExitColors.border),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.r),
              borderSide: BorderSide(color: ExitColors.border),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.r),
              borderSide: BorderSide(color: ExitColors.blue),
            ),
          ),
        ),
      ],
    );
  }
}

//======== Check Item (Reason for leaving)=============
class ExitCheckItem extends StatefulWidget {
  final String label;
  final bool selected;
  final ValueChanged<bool> onToggled;

  const ExitCheckItem({
    super.key,
    required this.label,
    required this.selected,
    required this.onToggled,
  });

  @override
  _ExitCheckItemState createState() => _ExitCheckItemState();
}

class _ExitCheckItemState extends State<ExitCheckItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => widget.onToggled(!widget.selected),
      child: AnimatedContainer(
        duration: const Duration(microseconds: 150),
        margin: EdgeInsets.symmetric(horizontal: 11.w, vertical: 10.h),
        decoration: BoxDecoration(
          color: widget.selected ? ExitColors.blueLight : ExitColors.surface,
          borderRadius: BorderRadius.circular(10.r),
          border: Border.all(
            color: widget.selected ? ExitColors.blue : ExitColors.border,
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ====================Self Created Checkbox ===========================
            AnimatedContainer(
              duration: Duration(milliseconds: 150),
              width: 20.w,
              height: 20.w,
              margin: EdgeInsets.only(top: 1.h),
              decoration: BoxDecoration(
                color: widget.selected ? ExitColors.blue : Colors.white,
                borderRadius: BorderRadius.circular(5.r),
                border: Border.all(
                  color: widget.selected
                      ? ExitColors.blue
                      : ExitColors.borderMed,
                  width: 1.5,
                ),
              ),
              child: widget.selected
                  ? Icon(Icons.check_rounded, size: 13.sp, color: Colors.white)
                  : null,
            ),

            SizedBox(width: 10.w),
            Expanded(
              child: Text(
                widget.label,
                style: GoogleFonts.dmSans(
                  fontSize: 13.sp,
                  color: ExitColors.text,
                  height: 1.35,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//================= Start Rating Row ===========================
class ExitStartRatingRow extends StatefulWidget {
  final String aspect;
  final int rating;
  final ValueChanged<int> onRated;
  final bool isLast;
  const ExitStartRatingRow({
    super.key,
    required this.aspect,
    required this.rating,
    required this.onRated,
    this.isLast = false,
  });

  @override
  _ExitStartRatingRowState createState() => _ExitStartRatingRowState();
}

class _ExitStartRatingRowState extends State<ExitStartRatingRow> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8.h),
      decoration: BoxDecoration(
        border: widget.isLast
            ? null
            : Border(bottom: BorderSide(color: ExitColors.border)),
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              widget.aspect,
              style: GoogleFonts.dmSans(
                fontSize: 12.5.sp,
                color: ExitColors.text,
                height: 1.3,
              ),
            ),
          ),

          SizedBox(width: 8.w),
          Row(
            children: List.generate(5, (i) {
              final filled = i < widget.rating;
              return GestureDetector(
                onTap: () => widget.onRated(i + 1),
                child: Padding(
                  padding: EdgeInsetsGeometry.symmetric(horizontal: 1.w),
                  child: Icon(
                    Icons.star_rounded,
                    key: ValueKey(filled),
                    size: 22.sp,
                    color: filled ? ExitColors.amber : ExitColors.borderMed,
                  ),
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}

//================== FeedBack Tex Area Block ===================================
class ExitFeedBackBlock extends StatelessWidget {
  final int number;
  final String question;
  final TextEditingController controller;

  const ExitFeedBackBlock({
    super.key,
    required this.number,
    required this.question,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 14.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 20.w,
                height: 20.w,
                decoration: BoxDecoration(
                  color: ExitColors.navy,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Text(
                    '$number',
                    style: GoogleFonts.dmSans(
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(width: 8.w),

              Expanded(
                child: Text(
                  question,
                  style: GoogleFonts.dmSans(
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w500,
                    color: ExitColors.text,
                    height: 1.4,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 7.h),

          TextFormField(
            controller: controller,
            maxLines: 3,

            style: GoogleFonts.dmSans(fontSize: 14.sp, color: ExitColors.text),
            decoration: InputDecoration(
              hintText: 'Your response...',
              hintStyle: GoogleFonts.dmSans(
                fontSize: 14.sp,
                color: ExitColors.textHint,
              ),
              filled: true,
              fillColor: ExitColors.bg,

              contentPadding: EdgeInsets.symmetric(
                horizontal: 11.w,
                vertical: 9.h,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.r),
                borderSide: BorderSide(color: ExitColors.border),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.r),
                borderSide: BorderSide(color: ExitColors.border),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.r),
                borderSide: const BorderSide(color: ExitColors.blue),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ExitSuccessView extends StatelessWidget {
  final String employeeName;
  const ExitSuccessView({super.key, required this.employeeName});

  // =============SUCCESS WIDGET (Final Page)========================  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 40.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
            Container(
              width: 60.w,
              height: 60.w,
              decoration: BoxDecoration(
                color: ExitColors.greenLight,
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Text(
                  '✓',
                  style: TextStyle(
                    fontSize: 26.sp,
                    fontWeight: FontWeight.w700,
                    color: ExitColors.green,
                  ),
                ),
              ),
            ),

            // SizedBox(height: 18.h,),
            // Text('Form Submitted',
            // style:GoogleFonts.dmSans(
            //   fontSize: 18.sp,
            //   fontWeight: FontWeight.w600,
            //   color:ExitColors.text,
            // )),

            // SizedBox(height: 8.h,),
            // Text('The exit interview for $employeeName has been'
            // 'recorded successfully.HR will follow up as needed.',
            // style:GoogleFonts.dmSans(
            //   fontSize: 13.sp,
            //   color:ExitColors.textMuted,
            //   height: 1.6
            // ),
            // ),
          ],
        ),
      ),
    );
  }
}

//============ SIGNATURE AREA ===================

class ExitSignatureArea extends StatelessWidget {
  final bool signed;
  final VoidCallback onTap;

  const ExitSignatureArea({
    super.key,
    required this.signed,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: signed ? null : onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        height: 72.h,
        width: double.infinity,
        decoration: BoxDecoration(
          color: signed ? ExitColors.greenLight : ExitColors.bg,
          borderRadius: BorderRadius.circular(10.r),
          border: Border.all(
            color: signed ? ExitColors.green : ExitColors.borderMed,
            width: signed ? 1.5 : 1.5,
            style: signed ? BorderStyle.solid : BorderStyle.solid,
          ),
        ),
        child: Center(
          child: Text(
            signed ? '✓  Signed' : 'Tap to sign',
            style: GoogleFonts.dmSans(
              fontSize: 13.sp,
              fontWeight: signed ? FontWeight.w600 : FontWeight.w400,
              color: signed ? ExitColors.green : ExitColors.textHint,
            ),
          ),
        ),
      ),
    );
  }
}

//================== Toast Notfiaction =========================TOAST NOTIFICATION =============
class ExitToast extends StatefulWidget {
  final String message;
  final bool visible;

  const ExitToast({super.key, required this.message, required this.visible});

  @override
  _ExitToastState createState() => _ExitToastState();
}

class _ExitToastState extends State<ExitToast>
    with SingleTickerProviderStateMixin {
  late AnimationController _ctrl;
  late Animation<double> _opacity;
  late Animation<Offset> _slide;
  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 250),
    );
    _opacity = CurvedAnimation(parent: _ctrl, curve: Curves.easeOut);
    _slide = Tween<Offset>(
      begin: const Offset(0, 0.3),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _ctrl, curve: Curves.easeOut));
  }

  @override
  void didUpdateWidget(ExitToast oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.visible) {
      _ctrl.forward();
    } else {
      _ctrl.reverse();
    }
  }
  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 80.h,
      left: 0,
      right: 0,
      child: Center(
        child: FadeTransition(
          opacity: _opacity,
          child: SlideTransition(
            position: _slide,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 10.h),

              child: Text(
                widget.message,
                style: GoogleFonts.dmSans(
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
