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
      color: ExitColors.navy,
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
                  fontSize: 10.sp,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 1.6,
                  color: const Color(0xFF5B9BD5),
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
        border: Border(bottom: BorderSide(color: ExitColors.border)),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                stepLabel,
                style: GoogleFonts.dmSans(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w600,
                  color: ExitColors.text,
                ),
              ),

              Text(
                '${currentStep + 1} of $totalSteps',
                style: GoogleFonts.dmSans(
                  fontSize: 11.sp,
                  color: ExitColors.textMuted,
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
                width: isActive ? 22.w : 6.w,
                height: 6.h,
                margin: EdgeInsets.only(right: 6.w),
                decoration: BoxDecoration(
                  color: isDone
                      ? const Color(0xFF1D6FBF)
                      : isActive
                      ? ExitColors.blue
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
            padding: EdgeInsets.symmetric(horizontal: 9.w, vertical: 3.h),

            decoration: BoxDecoration(
              color: ExitColors.navy,
              borderRadius: BorderRadius.circular(4.r),
            ),
            child: Text(
              badge,
              style: GoogleFonts.dmSans(
                fontSize: 10.sp,
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
              fontSize: 14.sp,
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
        color: ExitColors.autoBadgeBg,
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(color: ExitColors.autoBadgeBorder),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(
            Icons.check_circle_outline_rounded,
            size: 12,
            color: ExitColors.autoBadgeFg,
          ),
          SizedBox(width: 4.w),
          Text(
            'Auto-Filled from system',
            style: GoogleFonts.dmSans(
              fontSize: 10.sp,
              fontWeight: FontWeight.w600,
              letterSpacing: 0.5,
              color: ExitColors.autoBadgeFg,
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

  const ExitReadOnlyField({super.key,
  required this.label,
  required this.value
  
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
Text(
  label.toUpperCase(),
  style:GoogleFonts.dmSans(
    fontSize: 10.5.sp,
    fontWeight: FontWeight.w600,
    letterSpacing:0.4,
    color:ExitColors.textMuted,

  )
),
SizedBox(height:5.h),
Container(
  width: double.infinity,
  padding: EdgeInsets.symmetric(horizontal: 11.w,
  vertical: 9.h),
decoration: BoxDecoration(
  color:ExitColors.bg,
  borderRadius: BorderRadius.circular(10.r),
  border:Border.all(color:ExitColors.border),

),
child:Text(value,
style: GoogleFonts.dmSans(
  fontSize: 14.sp,
  color:ExitColors.text.withOpacity(0.75),

),)

)



    ],);
  }
}
