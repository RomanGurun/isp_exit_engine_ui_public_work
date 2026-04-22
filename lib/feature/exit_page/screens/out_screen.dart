import 'package:flutter/material.dart';
import 'package:isp_exit_form_implementation/feature/exit_page/exit_theme.dart';

class OutScreen extends StatelessWidget {

   OutScreen({super.key});

  final List item = ["pen", "laptop", "pencil", "football", "mobile","bike","house","cash","bag","bottle",'chair','table'];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Title Page', style: TextStyle(color: ExitColors.g8)),
        centerTitle: true,
        backgroundColor: ExitColors.g8,

        // leading: IconButton(onPressed: (){

        // }, icon: Icon(Icons.menu)),
        actions: [
          IconButton(icon: Icon(Icons.search), onPressed: () {}),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.account_balance_outlined),
          ),
        ],
        elevation: 0.7,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
        ),
       
      ),
      
      body: SafeArea(
        child: ListView.builder(
          itemCount: item.length,
          // scrollDirection: BouncingScrollPhysics(),
          padding: EdgeInsets.only(top: 50,left:10),
          itemExtent: 70,
          itemBuilder: (context, index) {
            return Card(
              color: ExitColors.green,
              elevation: 4,
              margin: EdgeInsets.symmetric(vertical: 5),
              child: ListTile(
                // iconColor: ExitColors.g8,
                textColor: ExitColors.pureBlack,
                
                leading: CircleAvatar(child: Text("${index + 1}"),
                backgroundColor: ExitColors.pureBlack,
                foregroundColor: ExitColors.amber),
                title: Text("${item[index]}"),
                subtitle: Text("This is a subtitle"),
                trailing: Icon(Icons.arrow_forward_ios),
                onTap: () {
                  print('Clicked ${item[index]}');
                },
              ),
            );
          },
        ),
      ),
      backgroundColor: ExitColors.pureWhite,
    );
  }
}
