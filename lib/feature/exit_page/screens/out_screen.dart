import 'package:flutter/material.dart';
import 'package:isp_exit_form_implementation/feature/exit_page/exit_theme.dart';

class OutScreen extends StatelessWidget {
  const OutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Welcome Page')),
      body: Center(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: ExitColors.textHint,
              ),
              borderRadius: BorderRadius.circular(40),
            ),
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 11),

            child: Column(
              children: [
                Container(
                  child: GestureDetector(
                    onTap: () {},
                    child: Text(
                      'Out Screen Button',
                      style: TextStyle(color: ExitColors.pureBlack,
                      fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
