import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:pratice_ui_1/constant.dart';

const List<String> list = <String>['One', 'Two', 'Three', 'Four'];

class SecondScreen extends StatefulWidget {
  const SecondScreen({Key? key}) : super(key: key);

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var image =
        'https://www.kindpng.com/picc/m/162-1620706_g-b-xi-doremon-doraemon-hd-png-download.png';
    return SafeArea(
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(children: [
                Container(
                  width: size.width * 0.4,
                  // height: 40,
                  margin: EdgeInsets.symmetric(vertical: 5),
                  // padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 218, 213, 213),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: DropdownButtonFormField(
                      itemHeight: 50,
                      borderRadius: BorderRadius.circular(20),
                      decoration: const InputDecoration(
                        fillColor: Color.fromARGB(255, 218, 213, 213),
                        hintText: "Search",
                        border: InputBorder.none,
                        icon: Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: Icon(Icons.search)),
                      ),
                      // dropdownColor: Colors.green,
                      value: list[0],
                      icon: const Padding(
                          padding: EdgeInsets.only(right: 10),
                          child: Icon(Icons.arrow_downward)),
                      isExpanded: true,
                      items: list.map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                            value,
                            style: const TextStyle(
                                color: Colors.blueGrey,
                                fontWeight: FontWeight.w700),
                          ),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        print(newValue);
                      }),
                ),
                Expanded(
                  child: Avatar(size: 22, imageUrl: image),
                )
              ]),
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Text('Hi Jason ✌️\nbe productive today!',
                    style: Theme.of(context)
                        .textTheme
                        .headline4!
                        .copyWith(fontWeight: FontWeight.w900)),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Row(
                  children: [
                    Container(
                      width: 160,
                      height: 160,
                      decoration: const BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              offset: Offset(0, 10),
                              blurRadius: 40,
                              spreadRadius: -15,
                              color: Color.fromARGB(255, 237, 195, 118),
                            )
                          ],
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              Color(0xfff3b440),
                              Color(0xfff7fbf0),
                            ],
                          ),
                          shape: BoxShape.circle),
                      child: CircularPercentIndicator(
                        animation: true,
                        animationDuration: 1200,
                        radius: 60,
                        lineWidth: 10,
                        percent: 7 / 10,
                        center: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                '70%',
                                style: Theme.of(context)
                                    .textTheme
                                    .headline4!
                                    .copyWith(fontWeight: FontWeight.w900),
                                textAlign: TextAlign.center,
                              ),
                              Text(
                                'Finished',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(fontWeight: FontWeight.w900),
                                textAlign: TextAlign.center,
                              ),
                            ]),
                        backgroundColor: Colors.transparent,
                        progressColor: Colors.white,
                        circularStrokeCap: CircularStrokeCap.round,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 50),
                      child: Container(
                        height: 160,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            StatusCard(
                                count: 32, title: 'Done', icon: Icons.check),
                            StatusCard(
                                count: 4,
                                title: 'In Progress',
                                icon: Icons.done),
                            StatusCard(
                                count: 7, title: 'Pending', icon: Icons.pause),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Latest Chats',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 30,
                              fontWeight: FontWeight.w700)),
                      Padding(
                        padding: const EdgeInsets.only(top: 15),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Avatar(size: 25, imageUrl: image),
                              Avatar(size: 25, imageUrl: image),
                              Avatar(size: 25, imageUrl: image),
                              Avatar(size: 25, imageUrl: image),
                              const Avatar(
                                  size: 25,
                                  title: Text(
                                    '+5',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20),
                                  ))
                            ]),
                      )
                    ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Avatar extends StatelessWidget {
  final double size;
  final Widget? title;
  final String? imageUrl;

  const Avatar({
    Key? key,
    required this.size,
    this.title,
    this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Align(
        alignment: Alignment.centerRight,
        child: CircleAvatar(
          backgroundColor: Color.fromARGB(255, 136, 136, 136),
          backgroundImage: imageUrl != null ? NetworkImage(imageUrl!) : null,
          radius: size,
          child: title,
        ),
      ),
      Positioned(
        right: 0,
        bottom: 0,
        child: Container(
          padding: EdgeInsets.all(5.5),
          decoration: BoxDecoration(
              border: Border.all(width: 2, color: Colors.white),
              borderRadius: BorderRadius.circular(90.0),
              color: Colors.green),
        ),
      )
    ]);
  }
}

class StatusCard extends StatelessWidget {
  final int count;
  final String title;
  final IconData icon;

  const StatusCard({
    Key? key,
    required this.count,
    required this.title,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Container(
          width: 45,
          height: 45,
          decoration: BoxDecoration(
              color: Color(0xfff7f7f7), borderRadius: BorderRadius.circular(5)),
          child: Icon(
            icon,
            color: Color(0xff00A3FF),
          )),
      Padding(
        padding: const EdgeInsets.only(left: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '$count',
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(fontWeight: FontWeight.w900),
            ),
            Text(
              title,
              style: Theme.of(context)
                  .textTheme
                  .bodySmall!
                  .copyWith(fontWeight: FontWeight.w900),
            ),
          ],
        ),
      )
    ]);
  }
}
