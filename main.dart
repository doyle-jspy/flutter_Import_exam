import 'package:flutter/material.dart';
import 'package:iamport_flutter/iamport_payment.dart';
import 'package:iamport_flutter/model/payment_data.dart';

void main() => runApp(
  MaterialApp(
    home: MyApp(),
  )
);

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: RaisedButton(
          onPressed: (){
            return Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => Payment()
              )
            );
          },
          child: Text("아임포트"),
        ),
      ),
    );
  }
}


class Payment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return IamportPayment(
      appBar: new AppBar(
        title: new Text('아임포트 결제'),
      ),
      /* 웹뷰 로딩 컴포넌트 */
      initialChild: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('https://cdn.vox-cdn.com/thumbor/2Gx0MqNg5DKbzE9sD2uTSGKFNVM=/0x0:1000x604/1200x800/filters:focal(420x222:580x382)/cdn.vox-cdn.com/uploads/chorus_image/image/58245867/GooglePay_Lockup.max_1000x1000.0.png'),
              Container(
                padding: EdgeInsets.fromLTRB(0.0, 30.0, 0.0, 0.0),
                child: Text(
                  '잠시만 기다려주세요...',
                  style: TextStyle(
                    fontSize: 20.0
                  )
                ),
              ),
            ],
          ),
        ),
      ),
      userCode: '내정보의 가맹점코드 입력',
      data: PaymentData.fromJson({
        'pg': 'kakaopay',                                          // PG사
        'payMethod': 'card',                                           // 결제수단
        'name': '아임포트 결제데이터 분석',                                  // 주문명
        'merchantUid': 'mid_111111', // 주문번호
        'amount': 39000,                                             // 결제금액
        'buyerName': '홍길동',                                           // 구매자 이름
        'buyerTel': '01012345678',                                     // 구매자 연락처
        'buyerEmail': 'example@naver.com',                             // 구매자 이메일
        'buyerAddr': '서울시 강남구 신사동 661-16',                         // 구매자 주소
        'buyerPostcode': '06018',                                      // 구매자 우편번호
        'appScheme': 'example',                                        // 앱 URL scheme
      }),
      callback: (Map<String, String> result) {
        Navigator.pushReplacementNamed(
          context,
          '/result',
          arguments: result,
        );
      },
    );
  }
}
