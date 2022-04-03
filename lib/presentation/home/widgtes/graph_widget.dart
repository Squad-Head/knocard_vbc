import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../style/color.dart';
import '../../widgets/container_shadow.dart';

class GraphWidget extends StatelessWidget {
  const GraphWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: ContainerShadow(
        width: MediaQuery.of(context).size.width / 3 - 30,
        padding: EdgeInsets.all(10.w),
        margin: EdgeInsets.only(right: 2.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/images/graph.png"),
            Text(
              "Recent Propsects",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: KColor.primaryColor,
                fontSize: 14.sp,
              ),
            )
          ],
        ),
      ),
    );
  }
}
