import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:isp_exit_form_implementation/feature/exit_page/screens/exit_page_reasons.dart';
import 'package:isp_exit_form_implementation/feature/exit_page/screens/exit_page_signature.dart';
import '../exit_theme.dart';
import '../widgets/exit_widgets.dart';
import 'package:flutter/services.dart';
import 'exit_page_employee_info.dart';
import 'exit_page_ratings.dart';
import 'exit_page_feedback.dart';
import 'out_screen.dart';

class ExitFormScreen extends StatefulWidget {
  const ExitFormScreen({super.key});

  @override
  State<ExitFormScreen> createState() => _ExitFormScreenState();
}

class _ExitFormScreenState extends State<ExitFormScreen> {
  int _currentStep = 0;
  final int _totalSteps = exitSteps.length;

  // ==============Toast =========================
  bool _toastVisible = false;
  String _toastMessage = '';

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
    if (_currentStep == 1 && _selectedReasons.isEmpty) {
      _showToast('Please select at least one reason for leaving ');
      return false;
    }
    if (_currentStep == 4 && !_signed) {
      _showToast('Please sign before submitting');
      return false;
    }
    return true;
  }

  //===================== Toast =======================
  void _showToast(String msg) async {
    setState(() {
      _toastMessage = msg;
      _toastVisible = true;
    });
    await Future.delayed(const Duration(seconds: 3));
    if (mounted) setState(() => _toastVisible = false);
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
        MaterialPageRoute(builder: (context) => const OutScreen()),
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
      _showToast('Exit interview submitted');
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

                // Toast Overlay
                ExitToast(message: _toastMessage, visible: _toastVisible),
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
