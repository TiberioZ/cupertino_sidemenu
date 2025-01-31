# Cupertino Sidemenu

https://github.com/user-attachments/assets/56109728-a54d-43ca-a881-45acd7e6a003

Inspired by **ChatGPT**, **DeepSeek**, **Messenger**, **Twitter** and **Lydia** side menus.

A **customizable Cupertino-style side menu** for Flutter with **smooth animations** and **haptic feedback**. Easily swipe or use buttons to open left and/or right side menus in your app.

## 🚀 Features

- **Swipe Gesture and Controller Navigation** – Open and close menus with smooth swipe gestures or with buttons. 
- **Customizable Left & Right Menus** – Pass any widgets inside the menus.
- **Customizable Parameters** - Width of the menus, Haptic feedbacks, Animation speed, Center page opacity

## 🎮 Usage

### **Basic Example**

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

## 🔄 Programmatic Control

To **open or close the menus** programmatically, use the `CupertinoSidemenuController`:

```dart
controller.openLeftMenu(); // Opens the left menu
controller.openRightMenu(); // Opens the right menu
controller.closeMenu(); // Closes any open menu
```

## ⚙️ Configuration Options

| Property            | Type      | Default | Description                                      |
| ------------------- | --------- | ------- | ------------------------------------------------ |
| `centerPage`        | `Widget`  | -       | The main page in the center                      |
| `leftMenu`          | `Widget?` | `null`  | Left menu content (optional)                     |
| `rightMenu`         | `Widget?` | `null`  | Right menu content (optional)                    |
| `menuWidthOfScreen` | `double`  | `0.80`  | Width of side menu as a percentage of the screen [0.0,1.0] |
| `hapticFeedback`    | `bool`    | `true`  | Enables haptic feedback on swipe                 |
| `animationSpeed`    | `int`     | `200`   | Controls animation duration in milliseconds      |
| `centerBackgroundOpacity`        | `double`  | `0.25`       | Opacity of the center page when menu is open [0.0,1.0]                  |





## 🛠️ Installation for Local Development

If you are working on this package and need to test it locally in another project, use a **path dependency**:

```yaml
dependencies:
  cupertino_sidemenu:
    path: ../cupertino_sidemenu
```

Run:

```sh
flutter pub get
```

## 🤝 Contributing

We welcome contributions! To contribute:

1. Fork the repo & create a new branch.
2. Make your changes.
3. Create a Pull Request.

