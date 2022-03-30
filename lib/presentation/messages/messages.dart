import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:knocard_ui/presentation/knocard_scaffold/knocard_scaffold.dart';
import 'package:knocard_ui/style/color.dart';

class Messages extends StatelessWidget {
  Messages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return KnoCardScaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Messages",
          style: Theme.of(context).textTheme.headline4!.copyWith(
                fontSize: 20.sp,
                fontWeight: FontWeight.bold,
              ),
        ),
        actions: [
          SizedBox(
            height: 20.h,
            width: 20.w,
            child: InkWell(
              onTap: () {},
              child: Image.asset(
                "assets/images/search.png",
                fit: BoxFit.contain,
              ),
            ),
          ),
          SizedBox(
            width: 20.w,
          )
        ],
      ),
      body: ListView.separated(
        itemCount: mockPerson.length,
        separatorBuilder: (BuildContext context, int index) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 70.w),
            child: const Divider(
              height: 0,
            ),
          );
        },
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            leading: CircleAvatar(
              backgroundColor: KColor.primaryColor,
              radius: 27,
              child: CircleAvatar(
                backgroundImage: NetworkImage(mockPerson[index]["avatar"]),
                radius: 25,
              ),
            ),
            title: Text(
              mockPerson[index]["name"],
              style: GoogleFonts.lato(
                color: KColor.primaryColor,
                fontSize: 18.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
            subtitle: Text(
              mockPerson[index]["last_message"],
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
            ),
            isThreeLine: true,
            trailing: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  mockPerson[index]["last_message_time"],
                  style: TextStyle(
                    color: KColor.primaryColor,
                    fontSize: 14.sp,
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                mockPerson[index]["isGroup"]
                    ? Image.asset(
                        "assets/images/group.png",
                        fit: BoxFit.scaleDown,
                        height: 16,
                      )
                    : const SizedBox.shrink(),
              ],
            ),
          );
        },
      ),
    );
  }

  List<Map<String, dynamic>> mockPerson = [
    {
      "avatar": "https://i.pravatar.cc/300",
      "name": "KnoCard Corporation",
      "last_message":
          "what time does it say, Got the message at sharp 10:00pm. Make Sure you don't miss",
      "last_message_time": "01:21pm",
      "isGroup": false,
    },
    {
      "avatar": "https://i.pravatar.cc/300",
      "name": "Christi Meyers",
      "last_message": "Welcome to KnoCard",
      "last_message_time": "11:04am",
      "isGroup": false,
    },
    {
      "avatar": "https://i.pravatar.cc/300",
      "name": "Kathy Jodrey",
      "last_message": "Not this one",
      "last_message_time": "Yesterday",
      "isGroup": false,
    },
    {
      "avatar": "https://i.pravatar.cc/300",
      "name": "Plumbers",
      "last_message": "Yo",
      "last_message_time": "Friday",
      "isGroup": true,
    },
    {
      "avatar": "https://i.pravatar.cc/300",
      "name": "IT Department",
      "last_message": "Contact now",
      "last_message_time": "12/02/2022",
      "isGroup": true,
    },
    {
      "avatar": "https://i.pravatar.cc/300",
      "name": "Mark Rovendero",
      "last_message": "Contact now",
      "last_message_time": "11/02/2022",
      "isGroup": false,
    }
  ];
}
