// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

//创建数据模型，定义一个简单的数据模型来表示每个数据条目。
class CucumberData {
  final String name;
  final String imageUrl;
  final double waterLevel;

  CucumberData(
      {required this.name, required this.imageUrl, required this.waterLevel});
}

//模拟数据库数据，创建一个模拟的数据列表，假装是从数据库中获取的。
List<CucumberData> fetchCucumberData() {
  return [
    CucumberData(
        name: "小黃瓜1",
        imageUrl: "https://via.placeholder.com/100",
        waterLevel: 80),
    CucumberData(
        name: "小黃瓜2",
        imageUrl: "https://via.placeholder.com/100",
        waterLevel: 65),
    CucumberData(
        name: "小黃瓜3",
        imageUrl: "https://via.placeholder.com/100",
        waterLevel: 90),
    // 可以添加更多模拟数据
  ];
}

//动态生成 UI，根据数据列表生成对应的 UI。
class PottedStatePage extends StatelessWidget {
  const PottedStatePage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<CucumberData> data = fetchCucumberData();

    return MaterialApp(
      debugShowCheckedModeBanner: false, // 隐藏 debug 横幅
      home: Scaffold(
        appBar: AppBar(
          title: Text('Cucumber Monitor'),
        ),
        body: ListView.builder(
          itemCount: data.length,
          itemBuilder: (context, index) {
            return buildCucumberItem(data[index]);
          },
        ),
      ),
    );
  }

  Widget buildCucumberItem(CucumberData cucumber) {
    return Container(
      margin: EdgeInsets.all(10.0),
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Image.network(
                cucumber.imageUrl,
                width: 100,
                height: 100,
              ),
              SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('目前：${cucumber.name}', style: TextStyle(fontSize: 18)),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Text('灌水通知'),
                      Switch(value: true, onChanged: (bool value) {}),
                    ],
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text('目前水量', style: TextStyle(fontSize: 18)),
              Text('${cucumber.waterLevel}%',
                  style: TextStyle(fontSize: 24, color: Colors.blue)),
            ],
          ),
          Divider(thickness: 2),
          Container(
            padding: EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('含水量纪录：'),
                SizedBox(height: 20),
                Center(
                  child: CustomPaint(
                    size: Size(200, 100), // 画布大小
                    painter: WaterLevelChartPainter(), // 自定义绘制器
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class WaterLevelChartPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.black
      ..strokeWidth = 2.0
      ..style = PaintingStyle.stroke;

    // 画一个简单的正态分布曲线模拟含水量记录
    final path = Path();
    path.moveTo(0, size.height);
    path.quadraticBezierTo(size.width / 2, 0, size.width, size.height);

    canvas.drawPath(path, paint);

    // 画一个垂直的指示条
    paint.color = Colors.grey;
    canvas.drawLine(
        Offset(size.width / 2, 0), Offset(size.width / 2, size.height), paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
