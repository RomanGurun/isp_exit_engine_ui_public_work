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
              border: Border.all(color: ExitColors.textHint),
              borderRadius: BorderRadius.circular(30),
            ),
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 11),

            child: Column(
              children: [
                Container(
                  child: GestureDetector(
                    onTap: () {},
                    child: Text(
                      'Out Screen Button',
                      style: TextStyle(color: ExitColors.border),
                    ),
                  ),
                ),
                
Container(
                  child: GestureDetector(
                    onTap: () {},
                    child: Text(
                      'Out Screen Button',
                      style: TextStyle(color: ExitColors.border),
                    ),
                  ),
                ),
                
                Container(
                  child: GestureDetector(
                    onTap: () {},
                    child: Text(
                      'Out Screen Button',
                      style: TextStyle(color:ExitColors.border),
                    ),
                  ),
                ),
                
                Container(
                  child: GestureDetector(
                    onTap: () {},
                    child: Text(
                      'Out Screen Button',
                      style: TextStyle(color: Colors.green),
                    ),
                  ),
                ),
                
                Container(
                  child: GestureDetector(
                    onTap: () {},
                    child: Text(
                      'Out Screen Button',
                      style: TextStyle(color: Colors.green),
                    ),
                  ),
                ),
                
                Container(
                  child: GestureDetector(
                    onTap: () {},
                    child: Text(
                      'Out Screen Button',
                      style: TextStyle(color: Colors.green),
                    ),
                  ),
                ),
                
                Container(
                  child: GestureDetector(
                    onTap: () {},
                    child: Text(
                      'Out Screen Button',
                      style: TextStyle(color: Colors.green),
                    ),
                  ),
                ),
                
                Container(
                  child: GestureDetector(
                    onTap: () {},
                    child: Text(
                      'Out Screen Button',
                      style: TextStyle(color: Colors.green),
                    ),
                  ),
                ),
                
                Container(
                  child: GestureDetector(
                    onTap: () {},
                    child: Text(
                      'Out Screen Button',
                      style: TextStyle(color: Colors.green),
                    ),
                  ),
                ),
                
                Container(
                  padding: EdgeInsets.all(100),
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(10),
                    
                  ),
                  child: GestureDetector(
                    onTap: () {},
                    child: Text(
                      'Out Screen Button',
                      style: TextStyle(color: Colors.green),
                    ),
                  ),
                ),
                
                Container(
                  child: GestureDetector(
                    onTap: () {},
                    child: Text(
                      'Out Screen Button',
                      style: TextStyle(color: Colors.green),
                    ),
                  ),
                ),
                
                Container(
                  padding: EdgeInsets.all(100),
                  child: GestureDetector(
                    onTap: () {},
                    child: Text(
                      'Out Screen Button',
                      style: TextStyle(color: Colors.green),
                    ),
                  ),
                ),
                
                Container(
                  child: GestureDetector(
                    onTap: () {},
                    child: Text(
                      'Out Screen Button',
                      style: TextStyle(color: Colors.green),
                    ),
                  ),
                ),
                
                Container(
                  child: GestureDetector(
                    onTap: () {},
                    child: Text(
                      'Out Screen Button',
                      style: TextStyle(color: Colors.green),
                    ),
                  ),
                ),
                







                // TextField(controller: TextEditingController(),
                // enabled: true,
                // ),
                GestureDetector(
                  onTap: () {},
                  child: Text(
                    'Out Screen Button',
                    style: TextStyle(color: Colors.green),
                  ),
                ),

                GestureDetector(
                  onTap: () {},
                  child: Text(
                    'Out Screen Button',
                    style: TextStyle(color: Colors.green),
                  ),
                ),

                GestureDetector(
                  onTap: () {},
                  child: Text(
                    'Out Screen Button',
                    style: TextStyle(color: Colors.green),
                  ),
                ),

                GestureDetector(
                  onTap: () {},
                  child: Text(
                    'Out Screen Button',
                    style: TextStyle(color: Colors.green),
                  ),
                ),

                GestureDetector(
                  onTap: () {},
                  child: Text(
                    'Out Screen Button',
                    style: TextStyle(color: Colors.green),
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
