// // ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

// import 'package:flutter/material.dart';

// class PottedStatePage extends StatelessWidget {
//   const PottedStatePage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('Cucumber Monitor'),
//         ),
//         body: ListView(
//           children: <Widget>[
//             // 图片与名称
//             Container(
//               padding: EdgeInsets.all(8.0),
//               child: Row(
//                 children: <Widget>[
//                   Image.network(
//                     'https://via.placeholder.com/100', // 模拟的图片链接，可以替换为实际图片路径
//                     width: 100,
//                     height: 100,
//                   ),
//                   SizedBox(width: 10),
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: <Widget>[
//                       Text('目前：小黄瓜1', style: TextStyle(fontSize: 18)),
//                       SizedBox(height: 10),
//                       Row(
//                         children: [
//                           Text('灌水通知'),
//                           Switch(value: true, onChanged: (bool value) {}),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//             // 目前水量
//             Container(
//               padding: EdgeInsets.all(8.0),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: <Widget>[
//                   Text('目前水量', style: TextStyle(fontSize: 18)),
//                   Text('80%',
//                       style: TextStyle(fontSize: 24, color: Colors.blue)),
//                 ],
//               ),
//             ),
//             Divider(thickness: 2),
//             // 含水量记录图
//             Container(
//               padding: EdgeInsets.all(8.0),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: <Widget>[
//                   Text('含水量纪录：'),
//                   SizedBox(height: 20),
//                   Center(
//                     child: CustomPaint(
//                       size: Size(200, 100), // 画布大小
//                       painter: WaterLevelChartPainter(), // 自定义绘制器
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// // 自定义的绘制器，用来绘制含水量记录的图表
// class WaterLevelChartPainter extends CustomPainter {
//   @override
//   void paint(Canvas canvas, Size size) {
//     final paint = Paint()
//       ..color = Colors.black
//       ..strokeWidth = 2.0
//       ..style = PaintingStyle.stroke;

//     // 画一个简单的正态分布曲线模拟含水量记录
//     final path = Path();
//     path.moveTo(0, size.height);
//     path.quadraticBezierTo(size.width / 2, 0, size.width, size.height); // 贝塞尔曲线

//     canvas.drawPath(path, paint);

//     // 画一个垂直的指示条
//     paint.color = Colors.grey;
//     canvas.drawLine(
//         Offset(size.width / 2, 0), Offset(size.width / 2, size.height), paint);
//   }

//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) {
//     return false;
//   }
// }
//   // @override
//   // Widget build(BuildContext context) {
//     // return Scaffold(
//         //   body: Column(
//         //     children: <Widget>[
//         //       Container(
//         //         child: Text("State Page"),
//         //         // decoration: BoxDecoration(color: Colors.yellow),
//         //         color: Colors.blue,
//         //       ),
//         //     ],
//         //   ),
//         // );
//   // }

