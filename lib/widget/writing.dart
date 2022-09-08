import 'package:flutter/material.dart';
import 'package:pratice_ui_1/constant.dart';

class Writing extends StatelessWidget {
  const Writing(
      {Key? key,
      required this.title,
      required this.subtitle,
      required this.description})
      : super(key: key);

  final String title;
  final String subtitle;
  final String description;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text('Hướng dẫn'),
        centerTitle: true,
      ),
      body: SizedBox(
        child: Column(children: [
          Container(
            height: size.height * 0.25,
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
                      Text(title,
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w900)),
                      Text(subtitle,
                          style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: primaryClolor)),
                      Text(description,
                          style: const TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w500)),
                    ]),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            
            child: Container(
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(10),
              ),
              child: IconButton(
                icon: const Icon(Icons.arrow_forward, color: Colors.white),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
