class Album {
  final String title, images;
  final int id;
  Album({
    required this.id,
    required this.title,
    required this.images,
  });
}

List<Album> albums = [
  Album(id: 0, title: "album1", images: "assets/images/nova.jpg"),
  Album(id: 1, title: "album2", images: "assets/images/nova.jpg"),
  Album(id: 2, title: "album3", images: "assets/images/nova.jpg"),
  Album(id: 3, title: "album4", images: "assets/images/nova.jpg"),
];
