import 'package:flutter/material.dart';
import 'package:mytasks/provider/theme_changer_provider.dart';
import 'package:provider/provider.dart';

void showCustomBottomSheet(BuildContext context) {
  double containerHeight = 500.0;

  showModalBottomSheet(
    context: context,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(20.0),
      ),
    ),
    builder: (BuildContext context) {
      final themeChanger = Provider.of<ThemeChangerProvider>(context);
      return Container(
        padding: const EdgeInsets.all(20.0),
        height: containerHeight,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const Divider(
              thickness: 5.5,
              indent: 130,
              endIndent: 130,
              color: Colors.black,
            ),
            const Divider(
              thickness: 2.0,
              color: Colors.teal,
            ),
            SizedBox(
              height: 340,
              child: Column(
                children: [
                  RadioListTile<ThemeMode>(
                    title: const Text('System Mode'),
                    value: ThemeMode.system,
                    groupValue: themeChanger.themeMode,
                    onChanged: themeChanger.setTheme,
                  ),
                  RadioListTile<ThemeMode>(
                    title: const Text('Dark Mode'),
                    value: ThemeMode.dark,
                    groupValue: themeChanger.themeMode,
                    onChanged: themeChanger.setTheme,
                  ),
                  RadioListTile<ThemeMode>(
                    title: const Text('Light Mode'),
                    value: ThemeMode.light,
                    groupValue: themeChanger.themeMode,
                    onChanged: themeChanger.setTheme,
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    },
  );
}
