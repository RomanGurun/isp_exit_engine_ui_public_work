import 'package:flutter/material.dart';
import 'package:isp_exit_form_implementation/feature/exit_page/exit_theme.dart';

class OutScreen extends StatelessWidget {

   OutScreen({super.key});

  final List item = ["pen", "laptop", "pencil", "football", "mobile"];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Title Page', style: TextStyle(color: ExitColors.blue)),
        centerTitle: true,
        backgroundColor: ExitColors.blue,

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
              elevation: 4,
              margin: EdgeInsets.symmetric(vertical: 5),
              child: ListTile(
                leading: CircleAvatar(child: Text("${index + 1}")),
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
      backgroundColor: ExitColors.border,
    );
  }
}
