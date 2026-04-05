import 'package:flutter/material.dart';
import '../exit_theme.dart';
import '../widgets/exit_widgets.dart';
import 'package:flutter/services.dart';
import 'exit_page_employee_info.dart';

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

  // ==============Page Controller =================
  final _pageCtrl = PageController();

  //=========== submission ====================
  bool _submitted = false;

  //====================== Validation ===============================

  bool _validateCurrent() {
    if (_currentStep == 1 && _selectedReasons.isEmpty) {
      _showToast('Please select at least one reason for leaving ');
      return false;
    }
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
                    // ExitPageReasons(
                    //   selectedReasons:_selectedReasons,
                    //   onChanged:(v) => setState(() => _selectedReasons = v),
                    //   otherController : _otherReasonCtrl,

                    // )

                    // Page 4
                    // ExitPageFeedback(
                    //   controller:_feedbackControllers
                    // )
                  ],
                ),

                // Toast Overalay
                // ExitToast(message:_toastMessage ,visible : _toastVisible),
              ],
            ),
          ),

          // =================Nav Footer =============
          // ExitNavFooter(
          //   showBack: _currentStep > 0 && !_submitted,
          //   onBack: _goBack,
          //   onNext: _goNext,
          //   nextStyle: _nextButtonStyle,
          //   loading: _loading,
          // ),
        ],
      ),
    );
  }
}
