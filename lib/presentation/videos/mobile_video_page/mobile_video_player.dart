import 'package:flutter/material.dart';
import 'package:knocard_ui/presentation/videos/mobile_video_page/video_item.dart';
import 'package:knocard_ui/presentation/videos/network_video_player.dart';

class MobileVideosPage extends StatelessWidget {
  MobileVideosPage({Key? key}) : super(key: key);

  final videoList = [
    VideoItem(
        "https://images.pexels.com/photos/66134/pexels-photo-66134.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
        "Episode 19: Beyond Acts"),
    VideoItem(
        "https://images.pexels.com/photos/66134/pexels-photo-66134.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
        "Episode 19: Beyond Acts"),
    VideoItem(
        "https://images.pexels.com/photos/66134/pexels-photo-66134.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
        "Episode 19: Beyond Acts"),
    VideoItem(
        "https://images.pexels.com/photos/66134/pexels-photo-66134.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
        "Episode 19: Beyond Acts"),
    VideoItem(
        "https://images.pexels.com/photos/66134/pexels-photo-66134.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
        "Episode 19: Beyond Acts"),
    VideoItem(
        "https://images.pexels.com/photos/66134/pexels-photo-66134.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
        "Episode 19: Beyond Acts"),
    VideoItem(
        "https://images.pexels.com/photos/66134/pexels-photo-66134.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
        "Episode 19: Beyond Acts"),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Ijlal & Haris on How to Get Rich SUPER FAST |\nLIGHTS OUT PODCAST",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.arrow_downward,
                      size: 20,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 220,
              width: double.infinity,
              // color: Colors.black,
              child: NetworkVideoPlayer(
                  'https://firebasestorage.googleapis.com/v0/b/knocard-da3f9.appspot.com/o/News%2FKnoCard%20News.mp4?alt=media&token=23aab96c-9ee0-4bf7-b4df-fe9f87a67d3b'),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 15),
              child: Row(
                children: const [
                  Text(
                    "Playlist",
                    style: TextStyle(
                      color: Colors.black38,
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                  SizedBox(
                    width: 180,
                  ),
                  Text(
                    "Autoplay",
                    style: TextStyle(
                      color: Colors.black38,
                    ),
                  ),
                  Icon(Icons.play_arrow_outlined),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, top: 20),
              child: Row(
                children: const [
                  CircleAvatar(
                    radius: 11,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Keep Watching",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: SizedBox(
                height: 110,
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    final video = videoList[index];
                    return Container(
                      margin: const EdgeInsets.symmetric(horizontal: 3),
                      width: 125,
                      child: Column(
                        children: [
                          Expanded(
                            child: Stack(
                              alignment: Alignment.bottomCenter,
                              children: [
                                Container(
                                  clipBehavior: Clip.hardEdge,
                                  decoration: BoxDecoration(
                                    color: Colors.black,
                                    borderRadius: BorderRadius.circular(3),
                                  ),
                                  child: Image.network(
                                    video.thumbnail,
                                    fit: BoxFit.cover,
                                    width: 125,
                                  ),
                                ),
                                Positioned(
                                  bottom: 5,
                                  child: Container(
                                    height: 3,
                                    width: 112,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(2),
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                Positioned(
                                  bottom: 5,
                                  right: 5,
                                  child: Container(
                                    height: 3,
                                    width: 50,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(2),
                                      color: Colors.black38,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            video.title,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                  itemCount: videoList.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, top: 40),
              child: Row(
                children: const [
                  CircleAvatar(
                    radius: 11,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Videos",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: SizedBox(
                height: 150,
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    final video = videoList[index];
                    return Container(
                      margin: const EdgeInsets.symmetric(horizontal: 3),
                      width: 80,
                      child: Column(
                        children: [
                          Expanded(
                            child: Container(
                              clipBehavior: Clip.hardEdge,
                              decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(3),
                              ),
                              child: Image.network(
                                video.thumbnail,
                                fit: BoxFit.cover,
                                width: 125,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            video.title,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    );
                  },
                  itemCount: videoList.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: SizedBox(
                height: 150,
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    final video = videoList[index];
                    return Container(
                      margin: const EdgeInsets.symmetric(horizontal: 3),
                      width: 80,
                      child: Column(
                        children: [
                          Expanded(
                            child: Container(
                              clipBehavior: Clip.hardEdge,
                              decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(3),
                              ),
                              child: Image.network(
                                video.thumbnail,
                                fit: BoxFit.cover,
                                width: 125,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            video.title,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    );
                  },
                  itemCount: videoList.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
