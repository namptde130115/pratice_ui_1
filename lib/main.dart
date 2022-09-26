import 'package:flutter/material.dart';
import 'package:pratice_ui_1/models/advertisement.dart';
import 'package:pratice_ui_1/provider/advertisement.dart';
import 'package:pratice_ui_1/services/advertisement.dart';
import 'package:pratice_ui_1/widget/card_navigate.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
      create: (context) => WritingProvider(),
      child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.red,
          ),
          home: HomeScreen()));
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  List<Advertisement>? advertisements;
  var isLoaded = false;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();

    //fetch data from API
    getData();
  }

  getData() async {
    advertisements = await AdvertisementService().getAdvertisement();
    if (advertisements != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }

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
          width: size.width,
          height: size.height,
          child: SingleChildScrollView(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
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
                  const Text('Hướng dẫn đầu tư hiệu quả cùng Fns',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w900,
                        height: 3,
                      )),
                  const Text('Giúp bạn giải ngân trong 3 click',
                      style: TextStyle(
                        fontSize: 16,
                      )),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Column(children: const [
                      CardNavigate(
                          mainText: 'Thị Trường Toàn Cảnh',
                          subText: 'Điều kiện thị trường hiện tại',
                          stt: '1'),
                      CardNavigate(
                          mainText: 'Tạo Lập Danh Mục',
                          subText: 'Xây dựng danh mục đầu tư hoàn hảo',
                          stt: '2'),
                      CardNavigate(
                          mainText: 'Phân tích dòng tiền',
                          subText:
                              'Xác lập kì vọng chiến lược và điểm mua bán của từng mã cổ phiếu',
                          stt: '3'),
                      CardNavigate(
                          mainText: 'Quản lí rủi ro',
                          subText:
                              'điều chỉnh danh mục theo chiến lược kỳ vọng',
                          stt: '4'),
                      CardNavigate(
                          mainText: 'Thị Trường Toàn Cảnh',
                          subText:
                              'Đội ngũ chuyên gia hô trợ suốt hành trình đầu tư',
                          stt: '5'),
                    ]),
                  ),
                ]),
          ),
        ),
        bottomNavigationBar: Theme(
          data: Theme.of(context).copyWith(
              // canvasColor: Colors.red,
              // primaryColor: Colors.red,
              textTheme: Theme.of(context)
                  .textTheme
                  .copyWith(caption: const TextStyle(color: Colors.black))),
          child: Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(30), topLeft: Radius.circular(30)),
              boxShadow: [
                BoxShadow(
                    color: Colors.black38, spreadRadius: 0, blurRadius: 10),
              ],
            ),
            child: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              backgroundColor: Colors.white,
              items: [
                BottomNavigationBarItem(
                  icon: const Icon(Icons.home),
                  activeIcon: Container(
                    width: 60,
                    decoration: const BoxDecoration(
                        border: Border(
                      top: BorderSide(
                        color: Colors.red,
                        width: 3,
                      ),
                    )),
                    child: Icon(Icons.home),
                  ),
                  label: 'Nhận định',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.money),
                  label: 'Dòng tiền',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.badge),
                  label: 'Lập danh mục',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.settings),
                  label: 'Quản trị',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.account_circle),
                  label: 'Hướng dẫn',
                )
              ],
              currentIndex: _selectedIndex,
              onTap: _onItemTapped,
            ),
          ),
        ));
  }
}
