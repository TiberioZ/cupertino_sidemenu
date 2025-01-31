# Cupertino Sidemenu

&#x20;

A **customizable Cupertino-style side menu** for Flutter with **smooth animations** and **haptic feedback**. Easily swipe or use buttons to open left and right side menus in your app.

## 🚀 Features

✔ **Swipe Gesture Navigation** – Open and close menus with smooth gestures. ✔ **Customizable Left & Right Menus** – Pass any widgets inside the menus. ✔ **Built-in Haptic Feedback** – Enhances user experience. ✔ **Programmatic Control** – Open/close menus using a controller. ✔ **Animation Speed Configuration** – Customize the menu transition speed. ✔ **Lightweight & Easy to Use** – Minimal setup required.

## 📦 Installation

Add `cupertino_sidemenu` to your `pubspec.yaml`:

```yaml
dependencies:
  cupertino_sidemenu: ^0.0.1
```

Then, run:

```sh
flutter pub get
```

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
| `menuWidthOfScreen` | `double`  | `0.80`  | Width of side menu as a percentage of the screen |
| `hapticFeedback`    | `bool`    | `true`  | Enables haptic feedback on swipe                 |
| `animationSpeed`    | `int`     | `200`   | Controls animation duration in milliseconds      |
| `leftMenu`          | `Widget?` | `null`  | Left menu content (optional)                     |
| `rightMenu`         | `Widget?` | `null`  | Right menu content (optional)                    |
| `centerPage`        | `Widget`  | -       | The main page in the center                      |

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

## 📜 License

This project is licensed under the **MIT License**. See the full license in the `LICENSE` file.

```
MIT License

Copyright (c) 2024 Tiberio Zolzettich

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
```

---

### **🚀 Now You're Ready to Share!**

- Upload this `README.md` file to **GitHub**.
- Ensure it's included in your **pub.dev** package.
- Update the `version` in `pubspec.yaml` before publishing new versions.

Let me know if you need any modifications! 🚀🔥

