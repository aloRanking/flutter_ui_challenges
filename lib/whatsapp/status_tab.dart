import 'package:flutter/material.dart';
import 'package:flutter_ui_challenges/whatsapp/story_view.dart';

import 'chat_model.dart';

class StatusTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: whatsAppMssg.length,
      separatorBuilder: (context, index){
        return Divider();
      },
      itemBuilder: (context, index){
        return ListTile(
          leading:GestureDetector(
            behavior: HitTestBehavior.translucent,
            child: Container(
              width: 60,
              height: 60,
              padding: EdgeInsets.symmetric(vertical: 4.0),
              alignment: Alignment.center,
              child: CircleAvatar(
                radius: 30.0,
              ),
            ),
          ),
          title: Text(
            whatsAppMssg[index].name,
          ),
          subtitle: Text(
            whatsAppMssg[index].date,
          ),
          onTap: (){
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => StoryViewScreen(),
              ),
            );
          },

        );




      },

    );
  }
}
