import 'package:flutter/material.dart';

import 'chat_model.dart';

class ChatRoom extends StatelessWidget {
  final Chat chat;

  ChatRoom({this.chat});

  @override
  Widget build(BuildContext context) {
    final avatarRadius = 20.0;
    final defaultIconButtonPadding = 8.0;
    final leftOffset = -25.0;
    final titleLineHeight = 2.0;

    final roundedContainer = ClipRRect(
      borderRadius: BorderRadius.circular(20.0),
      child: Container(
        color: Colors.white,
        child: Row(
          children: <Widget>[
            SizedBox(width: 8.0),
            Icon(Icons.insert_emoticon,
                size: 30.0, color: Theme.of(context).hintColor),
            SizedBox(width: 8.0),
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Type a message',
                  border: InputBorder.none,
                ),
              ),
            ),
            Icon(Icons.attach_file,
                size: 30.0, color: Theme.of(context).hintColor),
            SizedBox(width: 8.0),
            Icon(Icons.camera_alt,
                size: 30.0, color: Theme.of(context).hintColor),
            SizedBox(width: 8.0),
          ],
        ),
      ),
    );

    final inputBar = Padding(
      padding: EdgeInsets.all(8.0),
      child: Row(
        children: <Widget>[
          Expanded(
            child: roundedContainer,
          ),
          SizedBox(
            width: 5.0,
          ),
          GestureDetector(
            onTap: () {},
            child: CircleAvatar(
              child: Icon(Icons.send),
            ),
          ),
        ],
      ),
    );

    final screenWidth = MediaQuery.of(context).size.width;


    return Scaffold(
      backgroundColor: Color(0xFFECE5DD),
      appBar: AppBar(
        title: SizedBox(
          width: double.infinity,
          height: 60,
          child: Stack(
            overflow: Overflow.visible,
            children: <Widget>[

              Positioned(
                left: leftOffset,
                top: defaultIconButtonPadding,
                child: CircleAvatar(
                  radius: avatarRadius,
                  backgroundImage: AssetImage(chat.profileUrl),
                ),
              ),
              Positioned(

                left: leftOffset + avatarRadius * 2 + 8.0,
                top: defaultIconButtonPadding + avatarRadius / 2 - titleLineHeight,

                child: Text(chat.name),
              ),
            ],
          ),
        ),

        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.videocam),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.phone),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: () {},
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,

          children: <Widget>[
            Expanded(
              child: ListView(
                children: <Widget>[
                  MessageBubble(
                    sender: chat.name,
                    text: 'hii',
                    isMe: false,
                  ),

                  MessageBubble(
                    sender: 'bimbo',
                    text: 'hii..wats up',
                    isMe: true,
                  ),
                ],

              ),
            ),


            inputBar,


           // input field + send button
          ],
        ),
      ),
    );
  }
}

class MessageBubble extends StatelessWidget {
  MessageBubble({this.sender, this.text, this.isMe});
  final String sender;
  final String text;
  final bool isMe;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment:
            isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            sender,
            style: TextStyle(
              color: Colors.grey,
            ),
          ),
          Material(
            color: isMe ? Color(0xFFDCF8C6) : Colors.white,
            elevation: 5.0,
            borderRadius: isMe
                ? BorderRadius.only(
                    topLeft: Radius.circular(25.0),
                    bottomLeft: Radius.circular(25.0),
                    bottomRight: Radius.circular(25.0),
                  )
                : BorderRadius.only(
                    topRight: Radius.circular(25.0),
                    bottomLeft: Radius.circular(25.0),
                    bottomRight: Radius.circular(25.0),
                  ),
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
              child: Text(
                text,
                style: TextStyle(
                    color: isMe ? Colors.black54 : Colors.black54,
                    fontSize: 20.0),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

