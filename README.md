# Cupertino Sidemenu

![Cupertino Sidemenu-2 (5)](https://github.com/user-attachments/assets/7c0d44fc-e168-40c2-ae97-27bea5f42690)

Inspired by **ChatGPT**, **DeepSeek**, **Messenger**, **Twitter** and **Lydia** side menus.

A **customizable Cupertino-style side menu** for Flutter with **smooth animations** and **haptic feedback**. Easily swipe or use buttons to open left and/or right side menus in your app.

## 🚀 Features

- **Swipe Gesture and Controller Navigation** – Open and close menus with smooth swipe gestures or with buttons. 
- **Customizable Left & Right Menus** – Pass any widgets inside the menus.
- **Customizable Parameters** - Width of the menus, Haptic feedbacks, Animation speed, Animation curves, Center page opacity

## 🔥 Try it (demo code)

```dart
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
            child: Text("Principal Page"),
          ),
        ),
        leftMenu: const CupertinoPageScaffold(
          navigationBar: CupertinoNavigationBar(middle: Text("Left Page")),
          child: Center(child: Text("Left Menu Content")),
        ),
        rightMenu: const CupertinoPageScaffold(
          navigationBar: CupertinoNavigationBar(middle: Text("Right Page")),
          child: Center(child: Text("Right Menu Content")),
        ),
      ),
    );
  }
}
```


## 👉 Custom Usage

### Step 1 : Cupertino Sidemenus

You can create **both menus** or only **one menu** if you need just one side menu.

```dart
import 'package:cupertino_sidemenu/cupertino_sidemenu.dart';

CupertinoSidemenu(
        centerPage: //widget,
        leftMenu: //optionnal widget,
        rightMenu: //optionnal widget,
)
```

### Step 2 : Add buttons to open and close menus

To **open or close the menus** programmatically (with buttons or something else), use the `CupertinoSidemenuController`:


```dart
import 'package:cupertino_sidemenu/cupertino_sidemenu.dart';

final controller = CupertinoSidemenuController(); // Initialize controller

CupertinoSidemenu(
        controller : controller  // Pass it to the widget
        centerPage: CupertinoPageScaffold(
          navigationBar: CupertinoNavigationBar(
            leading: CupertinoButton(
              onPressed: controller.openLeftMenu,  // Open the left menu on pressed
              child: const Icon(
                CupertinoIcons.sidebar_left,
              ),
            ),
            trailing: CupertinoButton(
              onPressed: controller.openRightMenu,  // Open the right menu on pressed
              child: const Icon(
                CupertinoIcons.sidebar_right,
              ),
            ),
          ),
        leftMenu: //widget,
        rightMenu: //widget,
)
```

```dart
controller.openLeftMenu(); // Opens the left menu
controller.openRightMenu(); // Opens the right menu
controller.closeMenu(); // Closes any open menu
```

### Configuration Options

| Property            | Type      | Default | Description                                      |
| ------------------- | --------- | ------- | ------------------------------------------------ |
| `centerPage`        | `Widget`  | -       | The main page in the center                      |
| `leftMenu`          | `Widget?` | `null`  | Left menu content (optional)                     |
| `rightMenu`         | `Widget?` | `null`  | Right menu content (optional)                    |
| `menuWidthOfScreen` | `double`  | `0.80`  | Width of side menu as a percentage of the screen [0.0,1.0] |
| `hapticFeedback`    | `bool`    | `true`  | Enables haptic feedback on swipe                 |
| `animationSpeed`    | `int`     | `300`   | Controls animation duration in milliseconds      |
| `animationCurves`    | `Curves`     | `Curves.easeOutCubic`   | Controls animation curves transition     |
| `centerBackgroundOpacity`        | `double`  | `0.25`       | Opacity of the center page when menu is open [0.0,1.0]                  |
| `controller`    | `CupertinoSidemenuController?`     | -   | To **open or close the menus** programmatically (with buttons)     |

---

Made by Tiberio Zolzettich

