import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pin_screen_test/presentation/modules/round_button.dart';

class CreatePinScreen extends StatefulWidget {
  const CreatePinScreen({Key? key}) : super(key: key);

  @override
  _CreatePinScreenState createState() => _CreatePinScreenState();
}

class _CreatePinScreenState extends State<CreatePinScreen> {
  String pinCode = '';
  String pinCodeHolder = '';

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    List<String> buttonNameList = [
      '1',
      '2',
      '3',
      '4',
      '5',
      '6',
      '7',
      '8',
      '9',
      'false',
      '0',
      'backspace',
    ];

    void resetPinCodeHolder() {
      Future.delayed(const Duration(milliseconds: 250), () {
        setState(() {
          pinCode = pinCodeHolder;

          pinCodeHolder = '';
        });
      });
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Column(
        children: [
          Container(
            alignment: Alignment.bottomCenter,
            height: height * 0.1,
            width: width,
            child: Text(
              pinCode.isEmpty ? 'Create PIN' : 'Re-enter your PIN',
              style: const TextStyle(color: Colors.grey, fontSize: 20.0),
            ),
          ),
          SizedBox(
            height: height * 0.1,
            width: width,
            child: Center(
              child: ListView.separated(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: 4,
                itemBuilder: (context, index) {
                  if (index < pinCodeHolder.length) {
                    return Container(
                      width: 13.0,
                      decoration: BoxDecoration(
                        color: const Color(0xFF9C74EA),
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.grey),
                      ),
                    );
                  } else {
                    return Container(
                      width: 13.0,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.grey, width: 1),
                      ),
                    );
                  }
                },
                separatorBuilder: (context, index) {
                  return SizedBox(width: width * 0.075);
                },
              ),
            ),
          ),
          Container(
            alignment: Alignment.topCenter,
            height: height * 0.6,
            width: width,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 30.0, vertical: 0),
              child: GridView.builder(
                  physics:
                      const NeverScrollableScrollPhysics(), // to disable GridView's scrolling

                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 35,
                    mainAxisSpacing: 20,
                  ),
                  itemBuilder: (context, index) {
                    return RoundedButton(
                        buttonName: buttonNameList[index],
                        pinCodeHolder: pinCodeHolder,
                        callback: buttonNameList[index] == 'backspace'
                            ? () {
                                if (pinCodeHolder.isNotEmpty) {
                                  setState(() {
                                    pinCodeHolder = pinCodeHolder.substring(
                                        0, pinCodeHolder.length - 1);
                                  });
                                }
                              }
                            : () {
                                if (pinCodeHolder.length < 4) {
                                  setState(() {
                                    pinCodeHolder =
                                        pinCodeHolder + buttonNameList[index];

                                    if (pinCodeHolder.length == 4 &&
                                        pinCode.isEmpty) {
                                      resetPinCodeHolder();
                                    } else if (pinCodeHolder.length == 4 &&
                                        pinCode.isNotEmpty) {
                                      showCupertinoDialog(
                                        context: context,
                                        builder: (BuildContext context) =>
                                            CupertinoAlertDialog(
                                          content: pinCode == pinCodeHolder
                                              ? const Text(
                                                  'Your PIN code is successfully created')
                                              : const Text('Incorrect PIN'),
                                          actions: <CupertinoDialogAction>[
                                            CupertinoDialogAction(
                                              child: const Text('Ok'),
                                              onPressed: () {
                                                Navigator.pop(context);
                                                if (pinCode == pinCodeHolder) {
                                                  Navigator.pop(
                                                      context, pinCode);
                                                  setState(() {
                                                    pinCodeHolder = '';
                                                  });
                                                }
                                              },
                                            ),
                                          ],
                                        ),
                                      );
                                    }
                                  });
                                }
                              });
                  },
                  itemCount: buttonNameList.length),
            ),
          ),
        ],
      ),
    );
  }
}
