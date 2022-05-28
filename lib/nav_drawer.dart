import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

 final tabState = _TabStates();
 var index;

 class TabWidgetDrawer extends StatefulWidget {
   const TabWidgetDrawer({Key? key}) : super(key: key);

   @override
   State<TabWidgetDrawer> createState() => tabState;

 }

class _TabStates extends State<TabWidgetDrawer> {

  late MainPageState state;
  var barTitle;
  var screenText;
  var currentIndex;

  @override
  void initState() {
    state = Tab1State();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: buildBody(),
    );
  }

  @override
  Widget buildBody() {
    if (state.runtimeType == Tab1State) {
      barTitle = 'Page 1';
      screenText = 'Страница 1';
      currentIndex = 0;
      return MainWidget();
    }

    if (state.runtimeType == Tab2State) {
      barTitle = 'Page 2';
      screenText = 'Страница 2';
      currentIndex = 1;
      return MainWidget();
    }
    return Placeholder();
  }

  Widget MainWidget() {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.red,
        elevation: 0,
        title: Text(barTitle),
        centerTitle: true,
      ),
       drawer: NavigationDrawerWidget(),
      body: Center(child: Text(screenText)),
       );
  }

  Widget NavigationDrawerWidget() {
    final padding = EdgeInsets.symmetric(horizontal: 20);
    return Drawer(
      child: Material(
        color: Colors.red,
        child: Center(
            child: ListView(
                padding: padding,
                children: <Widget>[
                  const SizedBox(height: 50),
                  buildButtons(
                      text: 'Страница 1',
                      icon: Icons.grade,
                      onTap: () => _onTap(0),
                  ),
                  buildButtons(
                    text: 'Страница 2',
                    icon: Icons.grade,
                    onTap: () => _onTap(1),
                  )
                ]
            )
        ),
      ),
    );

  }

  Widget buildButtons({
    required String text,
    required IconData icon,
    VoidCallback? onTap,
  }) {
    final color = Colors.white;
    return ListTile(
      leading: Icon(icon, color: color,),
      title: Text(text, style: TextStyle(color: color),),
      onTap: onTap,
    );
  }

  void _onTap(int index) {
  Navigator.of(context).pop();

    setState(() {
      if (index == 0) {
        state = Tab1State();
      }
      if (index == 1) {
        state = Tab2State();
      }
    });

  }

}

class MainPageState {

}

class Tab1State extends MainPageState {

}

class Tab2State extends MainPageState {

}