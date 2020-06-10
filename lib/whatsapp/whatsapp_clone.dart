import 'package:flutter/material.dart';
import 'package:flutter_ui_challenges/whatsapp/status_tab.dart';
import 'package:flutter_ui_challenges/whatsapp/widget/custom_appbar.dart';
import 'package:flutter_ui_challenges/whatsapp/widget/fab_button.dart';

import 'call_tab.dart';
import 'camera_tab.dart';
import 'chat_model.dart';
import 'chat_room.dart';
import 'chat_tab.dart';

class WhatsAppClone extends StatefulWidget {
  @override
  _WhatsAppCloneState createState() => _WhatsAppCloneState();
}

class _WhatsAppCloneState extends State<WhatsAppClone> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WhatsApp',
      theme: ThemeData(
        primaryColor: Color(0xff075e54),
        indicatorColor: Colors.white,
        primaryColorDark: Color(0xFF128C7E),
        primaryIconTheme: IconThemeData(
          color: Colors.white,
        ),
        textTheme: TextTheme(
          title: TextStyle(color: Colors.white),
        ),
      ),
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin{
  double _appBarTop = 0.0;
  TabController _tabController;


  final _tabs = <Widget>[
    Tab(icon: Icon(Icons.camera_alt)),
    Tab(text: 'CHATS'),
    Tab(text: 'STATUS'),
    Tab(text: 'CALLS'),
  ];

  final int _cameraTapIndex = 0;

  double _getappBarHeight(BuildContext context) {
    final double kTabHeight = 46.0;
    final double kTextAndIconTabHeight = 72.0;
    final double inicatorHeight = 2.0;

    return kToolbarHeight +
        kTabHeight +
        inicatorHeight +
        MediaQuery.of(context).padding.top;
  }

  _buildTabView() {
    return TabBarView(
      controller: _tabController,
      children: <Widget>[
        WillPopScope(
          onWillPop: () {
            // shift to the right-handed-side tap;
            _tabController.animateTo(_cameraTapIndex + 1);
          },
          child: TabCamera(),
        ),
        ChatCard(),
        StatusTab(),
        CallTab(),
      ],
    );
  }

  _handleAppBarAnimation() {
    // This animation calculation will only work if camera tab index == 0
    if (_tabController.animation.value <= 1.0 && _cameraTapIndex == 0) {
      final value = _tabController.animation.value;
      final appBarHeight = _getappBarHeight(context);

      setState(() {
        _appBarTop = -(1 - value) * appBarHeight;
      });
    }
  }

  _handleTabIndex() {
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      vsync: this,
      length: _tabs.length,
      initialIndex: 1,
    );
    _tabController.animation.addListener(_handleAppBarAnimation);
    _tabController.animation.addListener(_handleTabIndex);
  }

  @override
  void dispose() {
    _tabController.animation.removeListener(_handleAppBarAnimation);
    _tabController.animation.removeListener(_handleTabIndex);
    _tabController.dispose();
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    final marginTopRaw = _appBarTop +
        _getappBarHeight(context) -
        MediaQuery.of(context).padding.top;
    final marginTop = marginTopRaw > 0 ? marginTopRaw : 0.0;

    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(
              top: marginTop,
            ),
            child: _buildTabView(),
          ),
          Positioned(
            left: 0.0,
            right: 0.0,
            top: _appBarTop,
            child: buildCustomAppBar(
              context,
              'WhatsApp',
              _tabs,
              _tabController,
              _getappBarHeight(context),
            ),
          ),
        ],
      ),
      floatingActionButton: buildFloatingActionButton(
        context,
        _tabController,
      ),
    );
  }
}

bool getIsTabCamera(TabController tabController) {
  return tabController.animation.value < 0.7;
}

bool getIsChatList(TabController tabController) {
  return tabController.animation.value > 0.7 &&
      tabController.animation.value < 1.7;
}

bool getIsStatusList(TabController tabController) {
  return tabController.animation.value > 1.7 &&
      tabController.animation.value < 2.7;
}

bool getIsCallList(TabController tabController) {
  return tabController.animation.value > 2.7;
}

const listLeadingAvatarRadius = 25.0;


