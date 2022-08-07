import 'package:flutter/material.dart';

import 'package:circular_bottom_navigation/circular_bottom_navigation.dart';
import 'package:circular_bottom_navigation/tab_item.dart';

import 'my_page/my_page.dart';


class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  int selectedPos = 0;
  late CircularBottomNavigationController _navigationController;

  List<AppBar> indexAppBars = [MyAppBar,MyAppBar,MyAppBar,MyAppBar];
  List<Widget> indexBodys = [const MyBody(),const MyBody(),const MyBody(),const MyBody()];

  @override
  void initState() {
    super.initState();
    _navigationController = CircularBottomNavigationController(selectedPos);
  }

  @override
  void dispose() {
    super.dispose();
    _navigationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: indexAppBars[selectedPos],
        backgroundColor: Theme.of(context).colorScheme.surface,
        body: indexBodys[selectedPos],
        bottomNavigationBar: CircularBottomNavigation(
          [
            TabItem(Icons.home, "Home", Colors.blue),
            TabItem(Icons.search, "Search", Colors.orange,),
            TabItem(Icons.layers, "Reports", Colors.red),
            TabItem(Icons.person, "Person", Colors.cyan),
          ],
          controller: _navigationController,
          selectedPos: selectedPos,
          barBackgroundColor: Theme.of(context).colorScheme.background,
          backgroundBoxShadow: const <BoxShadow>[
            BoxShadow(color: Colors.black45, blurRadius: 10.0),
          ],
          animationDuration: const Duration(milliseconds: 300),
          selectedCallback: (int? selectedPos) {
            setState(() {
              this.selectedPos = selectedPos ?? 0;
              debugPrint(_navigationController.value.toString());
            });
          },
        ),
    );
  }
}