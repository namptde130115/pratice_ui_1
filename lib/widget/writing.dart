import 'package:flutter/material.dart';
import 'package:pratice_ui_1/constants/colors.dart';
import 'package:pratice_ui_1/provider/advertisement.dart';
import 'package:provider/provider.dart';

class Writing extends StatelessWidget {
  const Writing({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final provider = Provider.of<WritingProvider>(context);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: whiteColor),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text('Hướng dẫn'),
        centerTitle: true,
      ),
      body: SizedBox(
        child: Column(children: [
          Container(
            height: 200,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                    'https://www.kindpng.com/picc/m/162-1620706_g-b-xi-doremon-doraemon-hd-png-download.png'),
                fit: BoxFit.fill,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: SizedBox(
                width: double.infinity,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                          provider.contentSelected != null
                              ? provider.contentSelected!['title']
                              : '',
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w900)),
                      Text(
                          provider.contentSelected != null
                              ? provider.contentSelected!['subtitle']
                              : '',
                          style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: primaryClolor)),
                      Text(
                          provider.contentSelected != null
                              ? provider.contentSelected!['description']
                              : '',
                          style: const TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w500)),
                    ]),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Row(
                children: [
                  if (provider.currentId != 1)
                    Expanded(
                      child: Align(
                        alignment: Alignment.bottomLeft,
                        child: Container(
                          decoration: BoxDecoration(
                            color: redColor,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: IconButton(
                              icon: const Icon(
                                Icons.arrow_back,
                                color: whiteColor,
                              ),
                              onPressed: () {
                                provider
                                    .setCurrentWriting(provider.currentId - 1);
                              }),
                        ),
                      ),
                    ),
                  if (provider.currentId != provider.writingLength)
                    Expanded(
                      child: Align(
                        alignment: Alignment.bottomRight,
                        child: Container(
                          decoration: BoxDecoration(
                            color: redColor,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: IconButton(
                              icon: const Icon(
                                Icons.arrow_forward,
                                color: whiteColor,
                              ),
                              onPressed: () {
                                provider
                                    .setCurrentWriting(provider.currentId + 1);
                              }),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
