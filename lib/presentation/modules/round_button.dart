import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  String buttonName;
  String pinCodeHolder;
  var callback;

  RoundedButton(
      {Key? key,
      required this.buttonName,
      required this.pinCodeHolder,
      required this.callback})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (buttonName == 'false') {
      return Container();
    } else {
      return ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: buttonName == 'backspace'
              ? Colors.transparent
              : const Color(0xDAE8E8E8),
          elevation: 0,
          shape: const CircleBorder(),
        ),
        onPressed: callback,
        child: buttonName == 'backspace'
            ? const Icon(Icons.backspace, color: Colors.black87)
            : Text(
                buttonName,
                style: const TextStyle(fontSize: 30.0, color: Colors.grey),
              ),
      );
    }
  }
}
