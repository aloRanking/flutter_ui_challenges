import 'package:flutter/material.dart';
import 'package:flutter_ui_challenges/whatsapp/widget/select_contacts.dart';

import '../camera_tab.dart';
import '../whatsapp_clone.dart';

buildFloatingActionButton(BuildContext context, TabController tabController) {
  if (getIsChatList(tabController)) {
    return FloatingActionButton(
      backgroundColor: Colors.lightGreen[700],
      onPressed: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (_) {
          return SelectContact();
        }));
      },
      child: Icon(
        Icons.message,
      ),
    );
  } else if (getIsStatusList(tabController)) {
    return FloatingActionButton(
      backgroundColor: Colors.lightGreen[700],
      onPressed: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (_) {
          return TabCamera(
            needScaffold: true,
          );
        }));
      },
      child: Icon(
        Icons.camera_alt,
      ),
    );
  } else if (getIsCallList(tabController)) {
    return FloatingActionButton(
      backgroundColor: Colors.lightGreen[700],
      onPressed: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (_) {
          return SelectContact();
        }));
      },
      child: Icon(
        Icons.add_call,
      ),
    );
  }

  return null;
}