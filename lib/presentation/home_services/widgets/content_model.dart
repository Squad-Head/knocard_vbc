import 'dart:convert';

import 'package:equatable/equatable.dart';

class ContentModel extends Equatable {
  final String title;
  final String caption;
  final String date;
  String? text;
  String? imgUrl;

  ContentModel({
    required this.title,
    required this.caption,
    required this.date,
    this.text,
    this.imgUrl,
  });

  factory ContentModel.init() => ContentModel(
        title: '',
        caption: '',
        date: '',
        imgUrl: '',
        text: '',
      );

  ContentModel copyWith({
    String? title,
    String? captopn,
    String? date,
    String? text,
    String? imgUrl,
  }) {
    return ContentModel(
      title: title ?? this.title,
      caption: captopn ?? this.caption,
      date: date ?? this.date,
      text: text ?? this.text,
      imgUrl: imgUrl ?? this.imgUrl,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'captopn': caption,
      'date': date,
      'text': text,
      'imgUrl': imgUrl,
    };
  }

  factory ContentModel.fromMap(Map<String, dynamic> map) {
    return ContentModel(
      title: map['title'] ?? '',
      caption: map['captopn'] ?? '',
      date: map['date'] ?? '',
      text: map['text'],
      imgUrl: map['imgUrl'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ContentModel.fromJson(String source) =>
      ContentModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ContentModel(title: $title, captopn: $caption, date: $date, text: $text, imgUrl: $imgUrl)';
  }

  @override
  List<Object> get props {
    return [
      title,
      caption,
      date,
      text!,
      imgUrl!,
    ];
  }
}

final contents = [
  ContentModel(
    title: 'Billiard Tournament',
    caption: 'Friday night at 8 in the office',
    date: 'Mar 29, 2022',
    imgUrl: 'assets/images/billiard.jpg',
  ),
  ContentModel(
    title: 'Invitation to Tournament',
    caption: 'Friday night at 8 in the office',
    date: 'Mar 29, 2022',
    text:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris neque erat, gravida iaculis pellentesque ac, ornare id libero. Proin luctus vestibulum nunc, sit amet consectetur nibh ultrices non. Sed quis molestie est. Maecenas eu interdum nulla, ut tristique libero. Pellentesque varius elit quis risus hendrerit, vel eleifend arcu tempus. Aenean venenatis id quam in posuere. Vivamus dictum nisl et vehicula fermentum.',
  ),
  ContentModel(
    title: 'Billiard Tournament',
    caption: 'Friday night at 8 in the office',
    date: 'Mar 29, 2022',
    imgUrl: 'assets/images/billiard.jpg',
  ),
];
