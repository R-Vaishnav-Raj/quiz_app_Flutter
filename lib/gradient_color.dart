// import 'package:flutter/material.dart';

// class GradientContainer extends StatelessWidget {
//   const GradientContainer(this.c1, this.c2, {super.key});

//   final Color c1, c2;

//   @override
//   Widget build(context) {
//     return Container(
//       decoration: BoxDecoration(
//         gradient: LinearGradient(
//           begin: Alignment.topLeft,
//           end: Alignment.bottomRight,
//           colors: [c1, c2],
//         ),
//       ),
//       child: Center(
//         child: Column(
//           children: [
//             SizedBox(
//               height: 200,
//             ),
//             Image.asset('assets/images/quiz-logo.png', width: 300),
//             SizedBox(
//               height: 75,
//             ),
//             Text(
//               'Learn flutter the fun way!',
//               style: TextStyle(
//                 fontSize: 25,
//                 color: Colors.white,
//               ),
//             ),
//             SizedBox(
//               height: 30,
//             ),
//             ElevatedButton(onPressed: () {}, child: Text('Start Quiz'),BoxDecoration ),
            
//           ],
//         ),
//       ),
//     );
//   }
// }
