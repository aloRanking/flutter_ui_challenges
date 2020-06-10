import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui_challenges/whatsapp/chat_model.dart';

class WhatsAppHome extends StatefulWidget {
  @override
  _WhatsAppHomeState createState() => _WhatsAppHomeState();
}

class _WhatsAppHomeState extends State<WhatsAppHome> {
  Chat chat = Chat();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: Text(
            'WhatsApp',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 20.0
            ),
          ),
          bottom: TabBar(
            indicatorSize: TabBarIndicatorSize.label,
              indicatorColor: Colors.white,
              unselectedLabelColor: Colors.grey,

              isScrollable: false,
              labelStyle: TextStyle(fontSize: 14),
              tabs: <Widget>[

                Tab(
                  icon: Icon(
                    Icons.camera_alt,

                  ),
                    ),
                Tab(
                  child: Text('Chats',
                  style: TextStyle(

                  ),),

                ),
                Tab(
                  child: Text('Status',
                    style: TextStyle(
                    ),),

                ),
                Tab(
                  child: Text('Calls',
                    style: TextStyle(

                    ),),

                )
          ]),
        ),
        body: TabBarView(
          children: <Widget>[
            ListView.builder(
              itemCount: whatsAppMssg.length,
              itemBuilder: (context, index){
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ChatCard(chat: whatsAppMssg[index]),
                );
              }
            ),

            ListView.builder(
                itemCount: whatsAppMssg.length,
                itemBuilder: (context, index){
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      child: Row(

                        children: <Widget>[
                          CircleAvatar(
                            radius: 30.0,
                            backgroundImage: AssetImage(""),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                whatsAppMssg[index].name,
                                style: TextStyle(
                                    fontSize: 16.0,
                                    color: Colors.black54,
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                              Text(
                                whatsAppMssg[index].lastMessage,
                                style: TextStyle(
                                    color: Colors.black26,
                                    fontSize: 13.0
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: <Widget>[
                              Text(
                                  whatsAppMssg[index].date
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                }
            ),
            ListView.builder(
                itemCount: whatsAppMssg.length,
                itemBuilder: (context, index){
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      child: Row(

                        children: <Widget>[
                          CircleAvatar(
                            radius: 30.0,
                            backgroundImage: AssetImage(""),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                whatsAppMssg[index].name,
                                style: TextStyle(
                                    fontSize: 16.0,
                                    color: Colors.black54,
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                              Text(
                                whatsAppMssg[index].lastMessage,
                                style: TextStyle(
                                    color: Colors.black26,
                                    fontSize: 13.0
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: <Widget>[
                              Text(
                                  whatsAppMssg[index].date
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                }
            ),
            Container(),

          ],
        ),


        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.green,
          child: Icon(
            Icons.message,
            color: Colors.white,
          ),
        ),

      ),
    );
  }
}

class ChatCard extends StatelessWidget {
  final Chat chat;



  ChatCard({this.chat});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[
         Expanded(
           child: CircleAvatar(
             radius: 30.0,
             backgroundImage: AssetImage(""),
           ),
         ),
          SizedBox(width: 20,),
          Expanded(
            flex: 4,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  chat.name,
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.black54,
                    fontWeight: FontWeight.bold
                  ),
                ),
                Text(
                  chat.lastMessage,
                  style: TextStyle(
                    color: Colors.black26,
                    fontSize: 13.0
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              children: <Widget>[
                Text(
                  chat.date
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}



