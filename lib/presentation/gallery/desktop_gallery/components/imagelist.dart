class Photo {
  final String title, images;
  final int id;
  Photo({
    required this.id,
    required this.title,
    required this.images,
  });
}

List<Photo> photos = [
  Photo(
      id: 0,
      title: "album1",
      images:
          "https://images.pexels.com/photos/12070041/pexels-photo-12070041.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500"),
  Photo(id: 1, title: "album2", images: "assets/images/01.jpg"),
  Photo(id: 2, title: "album3", images: "assets/images/021.jpg"),
  Photo(id: 3, title: "album4", images: "assets/images/021.jpg"),
  Photo(id: 4, title: "album4", images: "assets/images/01.jpg"),
  Photo(id: 5, title: "album4", images: "assets/images/021.jpg"),
  Photo(id: 6, title: "album4", images: "assets/images/021.jpg"),
  Photo(id: 7, title: "album4", images: "assets/images/01.jpg"),
  Photo(id: 8, title: "album3", images: "assets/images/01.jpg"),
  Photo(id: 9, title: "album4", images: "assets/images/021.jpg"),
  Photo(id: 10, title: "album4", images: "assets/images/01.jpg"),
  Photo(id: 11, title: "album4", images: "assets/images/021.jpg"),
  Photo(id: 12, title: "album4", images: "assets/images/01.jpg"),
  Photo(id: 13, title: "album4", images: "assets/images/01.jpg"),
];
