import 'package:flutter/cupertino.dart';
import 'package:cupertino_sidemenu/cupertino_sidemenu.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = CupertinoSidemenuController();

    return CupertinoApp(
      home: CupertinoSidemenu(
        controller: controller,
        centerPage: CupertinoPageScaffold(
          navigationBar: CupertinoNavigationBar(
            leading: CupertinoButton(
              padding: const EdgeInsets.all(8.0),
              onPressed: controller.openLeftMenu,
              child: const Icon(
                CupertinoIcons.sidebar_left,
                size: 25,
                color: CupertinoColors.black,
              ),
            ),
            middle: const Text("Cupertino Sidemenu"),
            trailing: CupertinoButton(
              padding: const EdgeInsets.all(8.0),
              onPressed: controller.openRightMenu,
              child: const Icon(
                CupertinoIcons.sidebar_right,
                size: 25,
                color: CupertinoColors.black,
              ),
            ),
          ),
          child: const Center(
            child: Text(
              "Principal Page",
            ),
          ),
        ),
        leftMenu: const CupertinoPageScaffold(
          navigationBar: CupertinoNavigationBar(
            middle: Text("Left Page"),
          ),
          child: Center(
            child: Text(
              "Add your custom widgets here",
            ),
          ),
        ),
        rightMenu: const CupertinoPageScaffold(
          navigationBar: CupertinoNavigationBar(
            middle: Text("Right Page"),
          ),
          child: Center(
            child: Text(
              "Add your custom widgets here",
            ),
          ),
        ),
      ),
    );
  }
}
