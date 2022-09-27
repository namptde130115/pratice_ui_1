import 'package:flutter/material.dart';
import 'package:pratice_ui_1/widget/card_navigate.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width,
      height: size.height,
      child: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
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
                  subText: 'điều chỉnh danh mục theo chiến lược kỳ vọng',
                  stt: '4'),
              CardNavigate(
                  mainText: 'Thị Trường Toàn Cảnh',
                  subText: 'Đội ngũ chuyên gia hô trợ suốt hành trình đầu tư',
                  stt: '5'),
              CardNavigate(
                  mainText: 'Thị Trường Toàn Cảnh',
                  subText: 'Đội ngũ chuyên gia hô trợ suốt hành trình đầu tư',
                  stt: '5'),
            ]),
          ),
        ]),
      ),
    );
  }
}
