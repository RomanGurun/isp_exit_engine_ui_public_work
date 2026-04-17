import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

/// Defines the text styles for the app with dynamic sizing.
abstract class AppTextStyle {

  static TextStyle extraBold(double fontSize) {
    return GoogleFonts.inter(
      fontWeight: FontWeight.w800,
      fontSize: fontSize.sp,
    );
  }

  /// Returns bold text style based on the size passed
  static TextStyle bold(double fontSize) {
    return GoogleFonts.inter(
      fontWeight: FontWeight.w700,
      fontSize: fontSize.sp,
    );
  }

  /// Returns semi-bold text style based on the size passed
  static TextStyle semiBold(double fontSize) {
    return GoogleFonts.inter(
      fontWeight: FontWeight.w600,
      fontSize: fontSize.sp,
    );
  }

  /// Returns medium text style based on the size passed
  static TextStyle medium(double fontSize) {
    return GoogleFonts.inter(
      fontWeight: FontWeight.w500,
      fontSize: fontSize.sp,
    );
  }

  /// Returns regular text style based on the size passed
  static TextStyle regular(double fontSize) {
    return GoogleFonts.inter(
      fontWeight: FontWeight.w400,
      fontSize: fontSize.sp,
    );
  }

  /// Returns light text style based on the size passed
  static TextStyle light(double fontSize) {
    return GoogleFonts.inter(
      fontWeight: FontWeight.w300,
      fontSize: fontSize.sp,
    );
  }

  /// Example usage for predefined sizes
  static TextStyle boldText25 = bold(25);
  static TextStyle boldText20 = bold(20);
  static TextStyle boldText16 = bold(16);
  static TextStyle boldText14 = bold(14);
  static TextStyle boldText12 = bold(12);

  static TextStyle semiBoldText20 = semiBold(20);
  static TextStyle semiBoldText18 = semiBold(18);
  static TextStyle semiBoldText16 = semiBold(16);
  static TextStyle semiBoldText14 = semiBold(14);
  static TextStyle semiBoldText12 = semiBold(12);

  static TextStyle mediumText30 = medium(30);
  static TextStyle mediumText20 = medium(20);
  static TextStyle mediumText18 = medium(18);
  static TextStyle mediumText19 = medium(19);
  static TextStyle mediumText16 = medium(16);
  static TextStyle mediumText14 = medium(14);
  static TextStyle mediumText12 = medium(12);

  static TextStyle regularText40 = regular(40);
  static TextStyle regularText60 = regular(60);
  static TextStyle regularText24 = regular(24);
  static TextStyle regularText20 = regular(20);
  static TextStyle regularText18 = regular(18);
  static TextStyle regularText16 = regular(16);
  static TextStyle regularText14 = regular(14);
  static TextStyle regularText15 = regular(15);
  static TextStyle regularText13 = regular(13);
  static TextStyle regularText12 = regular(12);
  static TextStyle regularText10 = regular(10);
  static TextStyle regularText11 = regular(11);

  static TextStyle lightText12 = light(12);
  static TextStyle lightText14 = light(14);
  static TextStyle lightText13 = light(13);
  static TextStyle lightText15 = light(15);
  static TextStyle lightText10 = light(10);
}
