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
    return const Placeholder();
  }
}
