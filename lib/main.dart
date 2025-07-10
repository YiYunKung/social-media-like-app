import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var img1 = Image.asset('assets/image1.jpg', width: 350);
    var postHeader = Row(
      children: [
        ClipOval(
          child: Image.asset(
            'assets/poster1.jpg',
            width: 45,
            height: 45,
            fit: BoxFit.cover,  // 填滿圓形
          )
        ),
        const SizedBox(width: 10),
        Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:[
                Text(
                  'grace519__',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text(
                  '國立嘉義大學蘭潭校區 理工大樓',
                  style: TextStyle(fontSize: 14),
                )
              ]
            )
        )
      ]
    );

    var appBody = SingleChildScrollView(    // 滾動式頁面
      padding: EdgeInsets.fromLTRB(25, 20, 25, 20),  // 設定頁面間距（左，上，右，下）
      child: Column (
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          postHeader,
          const SizedBox(height: 5),
          PostWidget(),
          const SizedBox(height: 10),
          img1,
        ],
      )
    );

    var appBar = AppBar(
      title: const Text(
          '#NCYU_CSIE',
      ),
      backgroundColor: Color(0xFFBBB1E3),
    );

    var app = MaterialApp(
      home: Scaffold(
        /*theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),*/
        appBar: appBar,
        body: appBody,
      )
    );
    return app;
  }
}


class PostWidget extends StatefulWidget {
  @override
  _PostWidgetState createState() => _PostWidgetState();
}

class _PostWidgetState extends State<PostWidget> {
  bool _expanded = false;   // 控制文章內容是否展開的布林變數

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [ Text.rich(
        TextSpan(
          children: [
            TextSpan(
              text:'八個你必須就讀嘉大資工的原因：\n',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
                height: 2.5,
              ),
            ),
            TextSpan(
              text: _expanded ?
                '1. 資工系的出路廣、就業機會多、薪水優渥💰\n'
                '2. 本系師資陣容強大，教授不只用心還很幽默\n'
                '3. 系學會負責讓你留下美好難忘的回憶💖\n'
                '4. 嘉義有非常多便宜又好吃的美食等著你挖掘\n（不是只有火雞肉飯好嗎）\n'
                '5. 環境純樸，好山好水好無聊（...喜歡的意思）\n'
                '6. 理工大樓離停車場跟學餐非常近，可以說是人人稱羨的「嘉大蘭潭校區黃金地段」\n'
                '7. 系館廁所總是很乾淨而且有衛生紙\n'
                '8. 拜託 求求了\n'
              :
                '1. 資工系的出路廣、就業機會多、薪水優渥💰\n'
                '2. 本系師資陣容強大，教授不只專業還很用心\n'
                '3. 系學會負責讓你留下美好難忘的回憶💖\n'
                '4. 嘉義有非常多便宜又好吃的美食等著你挖掘\n',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
              )
            ),
            TextSpan(
                text: _expanded ?
                  '#NCYU_CSIE #嘉大資工 #招生壓力給到我\n'
                :
                  '',
                style: TextStyle(
                  fontSize: 16,
                  color: Color(0xFF6367AC),
                  fontWeight: FontWeight.w600,
                  height: 1.5,
                  //decoration: TextDecoration.underline,
                )
            ),
            WidgetSpan(
              child: GestureDetector(
              onTap: () {   // 如果點擊會觸發的事件
                setState(() {
                  _expanded = !_expanded;
                });
              },
              child: Text(
                _expanded ? "... 教授在看！" : "... 偷偷顯示更多",
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black45,
                  fontWeight: FontWeight.w600,
                  decoration: TextDecoration.underline,
                  height: 2,
                  ),
                ),
              ),
            ),
          ],
        )
      )],
    );
  }
}

