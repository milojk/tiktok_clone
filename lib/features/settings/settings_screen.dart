import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/breakpoints.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _notification = true;

  void _onNotificationChanged(bool? newValue) {
    if (newValue == null) return;
    setState(() {
      _notification = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Settings',
        ),
      ),
      body: Center(
        child: Container(
          constraints: const BoxConstraints(
            maxWidth: Breakpoints.sm,
          ),
          child: ListView(
            children: [
              SwitchListTile.adaptive(
                  title: const Text('Can you do it?'),
                  subtitle: const Text('Isn\'t it cool?'),
                  value: _notification,
                  onChanged: _onNotificationChanged),
              CheckboxListTile(
                checkColor: Colors.white,
                activeColor: Colors.black,
                value: _notification,
                onChanged: _onNotificationChanged,
                title: const Text('Enable notifications'),
              ),
              ListTile(
                onTap: () async {
                  final date = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(1980),
                    lastDate: DateTime(2030),
                  );

                  if (kDebugMode) {
                    print(date);
                  }
                  if (!mounted) return;
                  final time = await showTimePicker(
                    context: context,
                    initialTime: TimeOfDay.now(),
                  );
                  if (kDebugMode) {
                    print(time);
                  }
                  if (!mounted) return;
                  final booking = await showDateRangePicker(
                    builder: (context, child) {
                      return Theme(
                        data: ThemeData(
                          appBarTheme: const AppBarTheme(
                            foregroundColor: Colors.white,
                            backgroundColor: Colors.black,
                          ),
                        ),
                        child: child!,
                      );
                    },
                    context: context,
                    firstDate: DateTime.now(),
                    lastDate: DateTime.now().add(
                      const Duration(
                        days: 365,
                      ),
                    ),
                  );
                  if (kDebugMode) {
                    print(booking);
                  }
                },
                title: const Text('What is your birthday?'),
              ),
              ListTile(
                title: const Text('Log out (iOS)'),
                textColor: Colors.red,
                onTap: () {
                  showCupertinoDialog(
                    context: context,
                    builder: (context) => CupertinoAlertDialog(
                      title: const Text('Are you sure?'),
                      content: const Text('Please don\'t go.'),
                      actions: [
                        CupertinoDialogAction(
                          child: const Text('No'),
                          onPressed: () => Navigator.of(context).pop(),
                        ),
                        CupertinoDialogAction(
                          isDestructiveAction: true,
                          child: const Text('Yes'),
                          onPressed: () => Navigator.of(context).pop(),
                        ),
                      ],
                    ),
                  );
                },
              ),
              ListTile(
                title: const Text('Log out (Android)'),
                textColor: Colors.red,
                onTap: () {
                  showAdaptiveDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      icon: const FaIcon(
                        FontAwesomeIcons.skull,
                      ),
                      title: const Text('Are you sure?'),
                      content: const Text('Please don\'t go.'),
                      actions: [
                        IconButton(
                          onPressed: () => Navigator.of(context).pop(),
                          icon: const FaIcon(FontAwesomeIcons.roadBarrier),
                        ),
                        TextButton(
                          child: const Text('Yes'),
                          onPressed: () => Navigator.of(context).pop(),
                        ),
                      ],
                    ),
                  );
                },
              ),
              ListTile(
                title: const Text('Log out (iOS / Bottom)'),
                textColor: Colors.red,
                onTap: () {
                  //showCupertinoModalPopup( // popup dismissed

                  showCupertinoDialog(
                    context: context,
                    builder: (context) => CupertinoActionSheet(
                      title: const Text('Are you sure?'),
                      message: const Text('Please don\'t go ~~'),
                      actions: [
                        CupertinoActionSheetAction(
                            isDefaultAction: true,
                            onPressed: () => Navigator.of(context).pop(),
                            child: const Text('Not log out')),
                        CupertinoActionSheetAction(
                            isDestructiveAction: true,
                            onPressed: () => Navigator.of(context).pop(),
                            child: const Text('Yes Plz')),
                      ],
                    ),
                  );
                },
              ),
              const AboutListTile(
                applicationVersion: "1.0",
                applicationLegalese:
                    "All rights reserved. Please do not copy me",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
