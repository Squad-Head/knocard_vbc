import 'package:cached_network_image/cached_network_image.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import 'constants.dart';

class ProfileBackground extends Equatable {
  final int id;
  final String categCode;
  final Widget widget;
  final Color textColor;
  final String imageUrl;
  const ProfileBackground(
      {required this.id,
      required this.categCode,
      required this.widget,
      required this.textColor,
      this.imageUrl = ''});

  @override
  List<Object> get props => [id, categCode, widget, textColor];

  ProfileBackground copyWith(
      {int? id,
      String? categCode,
      Widget? widget,
      Color? textColor,
      String? imageUrl}) {
    return ProfileBackground(
      id: id ?? this.id,
      categCode: categCode ?? this.categCode,
      widget: widget ?? this.widget,
      textColor: textColor ?? this.textColor,
      imageUrl: imageUrl ?? this.imageUrl,
    );
  }

  factory ProfileBackground.set(String background) {
    final String id = background.contains('|') ? background.split('|')[0] : '1';
    final String categCode = background.contains('|')
        ? background.split('|')[1]
        : Constants.patternBackground;

    if (categCode == Constants.solidBackground) {
      for (int i = 0; Constants.solid.length > i; i++) {
        if (Constants.solid[i].categCode == categCode &&
            Constants.solid[i].id == int.parse(id)) {
          return Constants.solid[i];
        }
      }
    } else if (categCode == Constants.gradientBackground) {
      for (int i = 0; Constants.gradient.length > i; i++) {
        if (Constants.gradient[i].categCode == categCode &&
            Constants.gradient[i].id == int.parse(id)) {
          return Constants.gradient[i];
        }
      }
    } else if (categCode == Constants.patternBackground) {
      for (int i = 0; Constants.pattern.length > i; i++) {
        if (Constants.pattern[i].categCode == categCode &&
            Constants.pattern[i].id == int.parse(id)) {
          return Constants.pattern[i];
        }
      }
    } else if (categCode == Constants.uploadBackground) {
      final link = background.split('|')[2];
      return ProfileBackground(
          imageUrl: link,
          textColor: Colors.black,
          id: int.parse(id),
          categCode: categCode,
          widget: CachedNetworkImage(
            fit: BoxFit.cover,
            width: double.infinity,
            imageUrl: link,
           errorWidget: (context, url, error) => Container(),
          ));
    } else {
      return defaultBg();
    }

    return defaultBg();
  }

  static ProfileBackground defaultBg() => ProfileBackground(
      textColor: Colors.black,
      id: -1,
      categCode: '',
      widget: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xff1d92c8),
              Color(0xffc1ddef),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
      ));
}
