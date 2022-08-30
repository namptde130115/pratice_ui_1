import 'package:flutter/material.dart';
import 'package:pratice_ui_1/constant.dart';

class CardNavigate extends StatelessWidget {
  const CardNavigate(
      {Key? key,
      required this.mainText,
      required this.subText,
      required this.stt})
      : super(key: key);
  final String mainText;
  final String subText;
  final String stt;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: SizedBox(
        width: double.infinity,
        child: Stack(alignment: AlignmentDirectional.center, children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: primaryClolor)),
                child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: SingleChildScrollView(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(mainText,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w900,
                                )),
                            Text(subText,
                                style: const TextStyle(
                                  fontSize: 14,
                                ))
                          ]),
                    )),
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                  color: secondaryColor,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: primaryClolor)),
              child: Align(
                  alignment: Alignment.center,
                  child: Text(stt,
                      style: const TextStyle(
                        fontSize: 12,
                      ))),
            ),
          )
        ]),
      ),
    );
  }
}
