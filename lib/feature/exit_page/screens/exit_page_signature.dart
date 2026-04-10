import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../exit_theme.dart';
import '../widgets/exit_widgets.dart';

class ExitPageSignature extends StatelessWidget {
  final bool signed;
  final VoidCallback onSign;
  final bool submitted;

  const ExitPageSignature({
    super.key,
    required this.signed,
    required this.onSign,
    this.submitted = false,
  });
  @override
  Widget build(BuildContext context) {
    if (submitted) {
      return ExitSuccessView(employeeName: dummyEmployee.name);
    }

    return SingleChildScrollView();
  }
}
