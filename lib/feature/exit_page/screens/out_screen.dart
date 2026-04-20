import 'package:flutter/material.dart';
import 'package:isp_exit_form_implementation/feature/exit_page/exit_theme.dart';

class OutScreen extends StatelessWidget {
  const OutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Title Page',
style: TextStyle(color:ExitColors.blue),
)
,
centerTitle: true,
backgroundColor: ExitColors.blue,
// leading: IconButton(onPressed: (){

// }, icon: Icon(Icons.menu)),


actions: [
  IconButton(icon: Icon(Icons.search),
  onPressed: (){},),
IconButton(onPressed: (){}, icon: Icon(Icons.account_balance_outlined))


],
elevation: 0.7,
shape: RoundedRectangleBorder(
  borderRadius: BorderRadius.vertical(
    bottom:Radius.circular(20),
  )
),






),
      body: Center(
        child: SingleChildScrollView(
          physics: const ScrollPhysics(),
          child: Container(
            decoration: BoxDecoration(
              color: ExitColors.blue,
              // border: Border.all(color: ExitColors.textHint),
              // borderRadius: BorderRadius.circular(40),
            ),
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 11),

            child: Column(
              children: [
                GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: 10,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                  itemBuilder: (context, index) {
                    return Container(
                      decoration: BoxDecoration(
                        color: ExitColors.blue,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Text(
                          "ICON $index",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    );
                  },
                ),











                // Container(
                //   child: GestureDetector(
                //     onTap: () {},
                //     child: Text(
                //       'Out Screen Button',
                //       style: TextStyle(
                //         color: ExitColors.autoBadgeBg,
                //         fontWeight: FontWeight.bold,
                //       ),
                //     ),
                //   ),
                // ),
                GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: 8,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10

                  ),
                  itemBuilder: (context, index) {
                    return Container(
                      decoration: BoxDecoration
                      (

                      color:ExitColors.blue,
                        borderRadius: BorderRadius.circular(10)
                        
                      ),
                      child: Center(child: Text("Item $index",
                      style: TextStyle(fontSize: 14,
                      fontWeight: FontWeight.bold),)),

                    );

                  },
                ),
              ],
            ),
          ),
        ),
      ),
      backgroundColor: ExitColors.blue,
    );
  }
}
