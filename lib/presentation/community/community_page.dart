import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CommuniyPage extends StatelessWidget {
  const CommuniyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffFAFAFA),
        automaticallyImplyLeading: false,
        title: Text(
          'Community',
          style: TextStyle(
            color: Theme.of(context).shadowColor.withOpacity(.6),
            fontWeight: FontWeight.normal,
            fontSize: 18.sp,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const ImageIcon(
              AssetImage('assets/icons/Path 1.png'),
              color: Color(0xff088ac6),
            ),
          )
        ],
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/background/background.jpg'),
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}
