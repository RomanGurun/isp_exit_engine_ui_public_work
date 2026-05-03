import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:isp_exit_form_implementation/core/widgets/show_snackbar.dart';
import 'package:isp_exit_form_implementation/feature/exit_page/screens/exit_page_reasons.dart';
import 'package:isp_exit_form_implementation/feature/exit_page/screens/exit_page_signature.dart';
import '../exit_theme.dart';
import '../widgets/exit_widgets.dart';
import 'package:flutter/services.dart';
import 'exit_page_employee_info.dart';
import 'exit_page_ratings.dart';
import 'exit_page_feedback.dart';
import '../../mini_page/out_screen.dart';

class ExitFormScreen extends StatefulWidget {
  const ExitFormScreen({super.key});

  @override
  State<ExitFormScreen> createState() => _ExitFormScreenState();
}

class _ExitFormScreenState extends State<ExitFormScreen> {
  int _currentStep = 0;
  final int _totalSteps = exitSteps.length;


  //================= Page 2 : Reasons =========================
  Set<String> _selectedReasons = {};
  final _otherReasonCtrl = TextEditingController();

  // ==========Page:4 Feedback =================
  late List<TextEditingController> _feedbackControllers;

  //============== Page 3: Ratings ==========================
  // Map of aspect -> rating(0 = unrated)
  late Map<String, int> _ratings;

  // ==============Page Controller =================
  final _pageCtrl = PageController();

  // ==============Page 5: Signature
  bool _signed = false;
  Uint8List? _signatureBytes;

  //=========== submission ====================
  bool _loading = false;
  bool _submitted = false;

  //====================== Validation ===============================

  bool _validateCurrent() {
    // Page 2 – Reasons: at least one checkbox or other text must be filled
    if (_currentStep == 1) {
      final otherFilled = _otherReasonCtrl.text.trim().isNotEmpty;
      if (_selectedReasons.isEmpty && !otherFilled) {
        ClassicSnackBar.error(
          context: context,
          msg: 'Please select at least one reason for leaving.',
        );
        return false;
      }
    }

    // Page 3 – Ratings: at least one aspect must be rated
    if (_currentStep == 2) {
      final hasRating = _ratings.values.any((r) => r > 0);
      if (!hasRating) {
        ClassicSnackBar.error(
          context: context,
          msg: 'Please rate at least one aspect before continuing.',
        );
        return false;
      }
    }

    // Page 4 – Feedback: at least one response must be filled
    if (_currentStep == 3) {
      final hasFeedback =
          _feedbackControllers.any((c) => c.text.trim().isNotEmpty);
      if (!hasFeedback) {
        ClassicSnackBar.error(
          context: context,
          msg: 'Please answer at least one feedback question.',
        );
        return false;
      }
    }

    // Page 5 – Signature: must be signed
    if (_currentStep == 4 && !_signed) {
      ClassicSnackBar.error(
        context: context,
        msg: 'Please sign before submitting.',
      );
      return false;
    }

    return true;
  }

  //========================= Navigation =======================
  void _goBack() {
    if (_currentStep == 0) return;
    setState(() => _currentStep--);
    _pageCtrl.animateToPage(
      _currentStep,
      duration: const Duration(milliseconds: 280),
      curve: Curves.easeInOut,
    );
  }

  void _goNext() async {
    // If already submitted, navigate to OutScreen
    if (_submitted) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) =>  OutScreen()),
      );
      return;
    }

    if (!_validateCurrent()) return;
    if (_currentStep == _totalSteps - 1) {
      await _submitForm();
      return;
    }
    setState(() => _currentStep++);
    _pageCtrl.animateToPage(
      _currentStep,
      duration: const Duration(milliseconds: 280),
      curve: Curves.easeInOut,
    );
  }

  @override
  void initState() {
    super.initState();
    _ratings = {for (final a in exitRatingAspects) a: 0};
    _feedbackControllers = List.generate(
      exitFeedbackQuestions.length,
      (_) => TextEditingController(),
    );
  }

  @override
  void dispose() {
    _pageCtrl.dispose();
    _otherReasonCtrl.dispose();
    for (final c in _feedbackControllers) c.dispose();
    super.dispose();
  }

  Future<void> _submitForm() async {
    setState(() => _loading = true);

    await Future.delayed(const Duration(milliseconds: 1200));
    if (mounted) {
      setState(() {
        _loading = false;
        _submitted = true;
      });
      ClassicSnackBar.success(
        context: context,
        msg: 'Exit interview submitted successfully.',
      );
    }
  }

  // Build payload for API - wire to model layer
  Map<String, dynamic> _buildPayload() {
    return {
      'employee': {'id': dummyEmployee.employeeId, 'name': dummyEmployee.name},
      'reasons': _selectedReasons.toList(),
      'otherReason': _otherReasonCtrl.text,
      'ratings': _ratings,
      'feedback': {
        for (var i = 0; i < exitFeedbackQuestions.length; i++)
          'q ${i + 1}': _feedbackControllers[i].text,
      },
      'signed': _signed,
      'submittedAt': DateTime.now().toIso8601String(),
    };
  }

  ExitNavButtonStyle get _nextButtonStyle {
    if (_submitted) return ExitNavButtonStyle.success;
    if (_currentStep == _totalSteps - 1) return ExitNavButtonStyle.submit;
    return ExitNavButtonStyle.normal;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ExitColors.bg,
      body: Column(
        children: [
          //============== Fixed Header =====================
          const ExitAppHeader(),

          //================ Step bar ========================
          ExitStepBar(
            currentStep: _currentStep,
            totalSteps: _totalSteps,
            stepLabel: exitSteps[_currentStep],
          ),

          //======================= Pages ========================
          Expanded(
            child: Stack(
              children: [
                PageView(
                  controller: _pageCtrl,
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    // Page 1
                    const ExitPageEmployeeInfo(),

                    // Page 2
                    ExitPageReasons(
                      selectedReasons: _selectedReasons,
                      onChanged: (v) => setState(() => _selectedReasons = v),
                      otherController: _otherReasonCtrl,
                    ),

                    // Page 3 – Ratings
                    ExitPageRatings(
                      ratings: _ratings,
                      onChanged: (v) => setState(() => _ratings = v),
                    ),

                    // Page 4
                    ExitPageFeedback(controllers: _feedbackControllers),

                    // Page 5 – Signature (real hand_signature pad)
                    ExitPageSignature(
                      signed: _signed,
                      signatureBytes: _signatureBytes,
                      onSign: (bytes) => setState(() {
                        _signed = true;
                        _signatureBytes = bytes;
                      }),
                      submitted: _submitted,
                    ),
                  ],
                ),


              ],
            ),
          ),

          // =================Nav Footer =============
          ExitNavFooter(
            showBack: _currentStep > 0 && !_submitted,
            onBack: _goBack,
            onNext: _goNext,
            nextStyle: _nextButtonStyle,
            loading: _loading,
          ),
        ],
      ),
    );
  }
}
