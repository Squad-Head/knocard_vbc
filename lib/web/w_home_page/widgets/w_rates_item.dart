import 'package:flutter/material.dart';
//import 'package:flutter_screenutil/flutter_screenutil.dart';

class WRatesItem extends StatelessWidget {
  const WRatesItem({
    Key? key,
    required this.containerColor,
    required this.headTextColor,
    required this.iconColor1,
    required this.iconColor2,
    required this.iconColor3,
    required this.iconColor4,
    required this.buttomTextColor,
    required this.icon1,
    required this.icon2,
    required this.icon3,
    required this.icon4,
    required this.headText,
    required this.buttomText,
  }) : super(key: key);
  final Color containerColor;
  final Color headTextColor;
  final Color iconColor1;
  final Color iconColor2;
  final Color iconColor3;
  final Color iconColor4;
  final Color buttomTextColor;
  final IconData icon1;
  final IconData icon2;
  final IconData icon3;
  final IconData icon4;
  final String headText;
  final String buttomText;

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 130,
      // width: 100,
      height: 165,
      width: 125,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(
            color: Color(0xFFAFAFAF),
            offset: Offset(-3, 3),
            blurRadius: 2,
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            height: 30,
            width: 160,
            decoration: BoxDecoration(
              color: containerColor,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
            ),
            child: Center(
              child: Text(
                headText,
                style: TextStyle(
                    color: headTextColor,
                    fontSize: 13,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          SizedBox(height: 5),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Container(
                  height: 2,
                  width: 40,
                  color: const Color(0xFFAFAFAF),
                ),
                SizedBox(height: 5),
                Row(
                  children: [
                    Icon(
                      icon1,
                      size: 11,
                      color: iconColor1,
                    ),
                    SizedBox(width: 5),
                    Text(
                      'Sample Text Here',
                      style: TextStyle(
                        fontSize: 9,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFF666666),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 5),
                Row(
                  children: [
                    Icon(
                      icon2,
                      size: 11,
                      color: iconColor2,
                    ),
                    SizedBox(width: 8),
                    Text(
                      'Other Text Title',
                      style: TextStyle(
                        fontSize: 9,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFF666666),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8),
                Row(
                  children: [
                    Icon(
                      icon3,
                      size: 11,
                      color: iconColor3,
                    ),
                    SizedBox(width: 5),
                    Text(
                      'Text Space Goes Here',
                      style: TextStyle(
                        fontSize: 9,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFF666666),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8),
                Row(
                  children: [
                    Icon(
                      icon4,
                      size: 11,
                      color: iconColor4,
                    ),
                    SizedBox(width: 5),
                    Text(
                      'Description Space',
                      style: TextStyle(
                        fontSize: 9,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFF666666),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Container(
                  height: 2,
                  width: 40,
                  color: const Color(0xFFAFAFAF),
                ),
                SizedBox(height: 5),
                Text(
                  buttomText,
                  style: TextStyle(
                    color: buttomTextColor,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
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