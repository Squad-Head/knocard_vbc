import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:knocard_ui/presentation/knocard_scaffold/knocard_scaffold.dart';
import 'package:knocard_ui/presentation/knocard_scaffold/widget/knocard_bottom_nav.dart';
import 'package:knocard_ui/presentation/widgets/search_widget.dart';
import 'package:knocard_ui/style/color.dart';

import '../../domain/person/person.dart';

class MessageScreen extends HookConsumerWidget {
  const MessageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    return KnoCardScaffold(
      // hasBackground: true,
      bottomNavigation: KnoCardBottomNav.message(context),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: Text(
          "Messages",
          style: Theme.of(context).textTheme.headline4!.copyWith(
                fontSize: 20.sp,
                fontWeight: FontWeight.bold,
              ),
        ),
        actions: [
          const SearchWidget(),
          SizedBox(
            width: 20.w,
          )
        ],
      ),
      body: ListView.separated(
        itemCount: MockPerson.length,
        separatorBuilder: (BuildContext context, int index) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 70.w),
            child: const Divider(
              height: 0,
            ),
          );
        },
        itemBuilder: (BuildContext context, int index) {
          return Chats(mockPerson: MockPerson[index]);
        },
      ),
    );
  }
}

List<Person> MockPerson = [
  Person(
    avatar: "https://i.pravatar.cc/300",
    name: "KnoCard Corporation",
    lastMessage:
        "what time does it say, Got the message at sharp 10:00pm. Make Sure you don't miss",
    lastMessageTime: "01:21pm",
    isGroup: false,
  ),
  Person(
    avatar: "https://i.pravatar.cc/300",
    name: "Christi Meyers",
    lastMessage: "Welcome to KnoCard",
    lastMessageTime: "11:04am",
    isGroup: false,
  ),
  Person(
    avatar: "https://i.pravatar.cc/300",
    name: "Kathy Jodrey",
    lastMessage: "Not this one",
    lastMessageTime: "Yesterday",
    isGroup: false,
  ),
  Person(
    avatar: "https://i.pravatar.cc/300",
    name: "Plumbers",
    lastMessage: "Yo",
    lastMessageTime: "Friday",
    isGroup: true,
  ),
  Person(
    avatar: "https://i.pravatar.cc/300",
    name: "IT Department",
    lastMessage: "Contact now",
    lastMessageTime: "12/02/2022",
    isGroup: true,
  ),
  Person(
    avatar: "https://i.pravatar.cc/300",
    name: "Mark Rovendero",
    lastMessage: "Contact now",
    lastMessageTime: "11/02/2022",
    isGroup: false,
  ),
];

class Chats extends StatelessWidget {
  const Chats({
    Key? key,
    required this.mockPerson,
  }) : super(key: key);

  final Person mockPerson;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: KColor.primaryColor,
        radius: 27,
        child: CircleAvatar(
          backgroundImage: NetworkImage(mockPerson.avatar),
          radius: 25,
        ),
      ),
      title: Text(
        mockPerson.name,
        style: GoogleFonts.lato(
          color: KColor.primaryColor,
          fontSize: 18.sp,
          fontWeight: FontWeight.w400,
        ),
      ),
      subtitle: Text(
        mockPerson.lastMessage,
        overflow: TextOverflow.ellipsis,
        maxLines: 2,
      ),
      isThreeLine: true,
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            mockPerson.lastMessageTime,
            style: TextStyle(
              color: KColor.primaryColor,
              fontSize: 14.sp,
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          mockPerson.isGroup
              ? Image.asset(
                  "assets/images/group.png",
                  fit: BoxFit.scaleDown,
                  height: 16,
                )
              : const SizedBox.shrink(),
        ],
      ),
    );
  }
}
