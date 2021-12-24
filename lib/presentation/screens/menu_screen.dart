import 'package:flutter/material.dart';

import 'authentication_screen.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Object? pinCode = '';

    void awaitPinCodCreated(context) async {
      final result = await Navigator.pushNamed(context, '/createPin');
      pinCode = result;
    }

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () {
                awaitPinCodCreated(context);
              },
              child: const Text('Create PIN'),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        AuthenticationPinScreen(pinCode: pinCode),
                  ),
                );
              },
              child: const Text('Authentication by PIN'),
            ),
          ],
        ),
      ),
    );
  }
}
