import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

final tabState = _TabStates();

class ChangeColors extends StatefulWidget {
  const ChangeColors({Key? key}) : super(key: key);

  @override
  State<ChangeColors> createState() => tabState;

}

class _TabStates extends State<ChangeColors> {

  late MainPageState state;
 // var index;
  var backColor = Colors.white;

  @override
  void initState() {
    state = DefaultState();
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
      backColor = Colors.green;
      return MainWidget();
    }

    if (state.runtimeType == Tab2State) {
      backColor = Colors.blue;
      return MainWidget();
    }

    if (state.runtimeType == Tab3State) {
      backColor = Colors.red;
      return MainWidget();
    }

    if (state.runtimeType == DefaultState) {
      return MainWidget();
    }
    return Placeholder();
  }

  Widget MainWidget() {
    return Scaffold(
      backgroundColor: backColor,
      appBar: AppBar(
        backgroundColor: Colors.deepOrangeAccent,
        elevation: 0,
        title: Text('Default Page'),
        centerTitle: true,
      ),
      drawer: NavigationDrawerWidget(),
    );
  }

  Widget NavigationDrawerWidget() {
    final padding = EdgeInsets.symmetric(horizontal: 20);
    return Drawer(
      child: Material(
        color: Colors.orangeAccent,
        child: Center(
            child: ListView(
                padding: padding,
                children: <Widget>[
                  const SizedBox(height: 50),
                  buildButtons(
                    text: 'Green',
                    textColor: Colors.green,
                    icon: Icons.grade,
                    onTap: () => _onTap(0),
                  ),
                  buildButtons(
                    text: 'Blue',
                    textColor: Colors.blue,
                    icon: Icons.grade,
                    onTap: () => _onTap(1),
                  ),
                  buildButtons(
                    text: 'Red',
                    textColor: Colors.red,
                    icon: Icons.grade,
                    onTap: () => _onTap(2),
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
    required Color textColor,
    VoidCallback? onTap,
  }) {
    return ListTile(
      leading: Icon(icon, color: textColor,),
      title: Text(text, style: TextStyle(color: textColor),),
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
      if (index == 2) {
        state = Tab3State();
      }
    });

  }

}

class MainPageState {

}

class DefaultState extends MainPageState{

}

class Tab1State extends MainPageState {

}

class Tab2State extends MainPageState {

}

class Tab3State extends MainPageState {

}