import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

final tabState = _TabStates();

class TabWidget extends StatefulWidget {
  const TabWidget({Key? key}) : super(key: key);

  @override
  State<TabWidget> createState() => tabState;

}

class _TabStates extends State<TabWidget> {

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
      return TabsWidget();
    }

    if (state.runtimeType == Tab2State) {
      barTitle = 'Page 2';
      screenText = 'Страница 2';
      currentIndex = 1;
      return TabsWidget();
    }
    return Placeholder();
  }

  Widget TabsWidget() {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        title: Text(barTitle),
        centerTitle: true,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.help), label: 'Tab 1'),
          BottomNavigationBarItem(icon: Icon(Icons.map), label: 'Tab 2'),
        ],
        onTap: _onTap,
        currentIndex: currentIndex,
      ),
      body: Center(child: Text(screenText)),
    );

  }

  void _onTap(int index) {

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