import 'package:flutter/material.dart';

import '../../constant.dart';

class Scrolemenu extends StatefulWidget {
  const Scrolemenu({Key? key}) : super(key: key);

  @override
  State<Scrolemenu> createState() => _ScrolemenuState();
}

class _ScrolemenuState extends State<Scrolemenu> {
  List<String> categories = [
    "Posts",
    "Videos",
  ];
  int firstscrole = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Stack(
        children: <Widget>[
          const Divider(
            height: 2,
            thickness: 0.5,
            color: kTextLightColor,
          ),
          SizedBox(
            width: double.infinity,
            height: 25,
            child: Center(
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                itemBuilder: (context, index) => Column(
                  children: [
                    buildText(index),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildText(int index) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: GestureDetector(
          onTap: () {
            setState(() {
              firstscrole = index;
            });
          },
          child: Column(
            children: <Widget>[
              Container(
                margin: const EdgeInsets.only(bottom: 5),
                height: 2,
                width: 50,
                color: firstscrole == index ? kTextColor : kTextLightColor,
              ),
              Text(
                categories[index],
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: firstscrole == index ? kTextColor : kTextLightColor,
                ),
              ),
            ],
          ),
        ),
      );
}
