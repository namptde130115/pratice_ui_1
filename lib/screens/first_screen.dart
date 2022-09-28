import 'package:flutter/material.dart';
import 'package:pratice_ui_1/constants/colors.dart';
import 'package:pratice_ui_1/models/writing.dart';
import 'package:pratice_ui_1/provider/advertisement.dart';
import 'package:pratice_ui_1/widget/writing.dart';
import 'package:provider/provider.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final provider = Provider.of<WritingProvider>(context);

    Widget CardNavigate(String mainText, String subText, String stt) {
      var widthSize = MediaQuery.of(context).size.width;
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: InkWell(
          onTap: () {
            provider.setCurrentWriting(int.parse(stt));
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Writing()));
          },
          child: SizedBox(
            width: widthSize,
            child: Stack(alignment: AlignmentDirectional.center, children: [
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Container(
                  width: widthSize,
                  decoration: BoxDecoration(
                      color: whiteColor,
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
        ),
      );
    }

    return SizedBox(
      width: size.width,
      height: size.height,
      child: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
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
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 25),
            child: Text(
              'Hướng dẫn đầu tư hiệu quả cùng Fns sssssssssssssssss',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w900,
                height: 3,
              ),
            ),
          ),
          const Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Text(
              'Giúp bạn giải ngân trong 3 click sssssss ssssssssss',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: provider.listContent.length,
                  itemBuilder: (context, index) {
                    return CardNavigate(
                      WritingContent.fromJson(provider.listContent[index])
                          .title,
                      WritingContent.fromJson(provider.listContent[index])
                          .subtitle,
                      (index + 1).toString(),
                    );
                  })),
        ]),
      ),
    );
  }
}
