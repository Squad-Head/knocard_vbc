// ignore_for_file: unnecessary_question_mark, non_constant_identifier_names

import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'company/company.dart';
import 'external_page/external_page.dart';
import 'kno_card.dart';
import 'playlist.dart';
import 'social_media.dart';

class UserProfile extends Equatable {
  final int id;
  final String name;
  final String username;
  final String first_name;
  final String last_name;
  final String email;
  final dynamic email_verified_at;
  final String api_token;
  final String phone_country_code;
  final dynamic mobile_number;
  final String street1;
  final String street2;
  final String city;
  final String state;
  final int zip_code;
  final String profile_picture;
  final String occupation;
  final dynamic tagline;
  final dynamic about_me;
  final String phone_number;
  final dynamic integration_id;
  final dynamic gateway;
  final dynamic card_brand;
  final dynamic card_last_four;
  final String role;

  final int get_started;
  final dynamic meta_tags;
  final int is_legacy;
  final dynamic create_and_share_id;
  final int show_profile_picture;
  final String status;
  final dynamic go_live_code;

  final Company company;
  final Knocard knocard;

  final List<SocialMedia> social_media;
  final List<ExternalPageData> external_pages;
  final List<Playlist> playlists;
  final String longitude;
  final String latitude;
  const UserProfile({
    required this.id,
    required this.name,
    required this.username,
    required this.first_name,
    required this.last_name,
    required this.email,
    required this.email_verified_at,
    required this.api_token,
    required this.phone_country_code,
    required this.mobile_number,
    required this.street1,
    required this.street2,
    required this.city,
    required this.state,
    required this.zip_code,
    required this.profile_picture,
    required this.occupation,
    required this.tagline,
    required this.about_me,
    required this.phone_number,
    required this.integration_id,
    required this.gateway,
    required this.card_brand,
    required this.card_last_four,
    required this.role,
    required this.get_started,
    required this.meta_tags,
    required this.is_legacy,
    required this.create_and_share_id,
    required this.show_profile_picture,
    required this.status,
    required this.go_live_code,
    required this.company,
    required this.knocard,
    required this.social_media,
    required this.external_pages,
    required this.playlists,
    required this.longitude,
    required this.latitude,
  });

  UserProfile copyWith({
    int? id,
    String? name,
    String? username,
    String? first_name,
    String? last_name,
    String? email,
    dynamic? email_verified_at,
    String? api_token,
    String? phone_country_code,
    dynamic? mobile_number,
    String? street1,
    String? street2,
    String? city,
    String? state,
    int? zip_code,
    String? profile_picture,
    String? occupation,
    dynamic? tagline,
    dynamic? about_me,
    String? phone_number,
    dynamic? integration_id,
    dynamic? gateway,
    dynamic? card_brand,
    dynamic? card_last_four,
    String? role,
    int? get_started,
    dynamic? meta_tags,
    int? is_legacy,
    dynamic? create_and_share_id,
    int? show_profile_picture,
    String? status,
    dynamic? go_live_code,
    Company? company,
    Knocard? knocard,
    List<SocialMedia>? social_media,
    List<ExternalPageData>? external_pages,
    List<Playlist>? playlists,
    String? longitude,
    String? latitude,
  }) {
    return UserProfile(
      id: id ?? this.id,
      name: name ?? this.name,
      username: username ?? this.username,
      first_name: first_name ?? this.first_name,
      last_name: last_name ?? this.last_name,
      email: email ?? this.email,
      email_verified_at: email_verified_at ?? this.email_verified_at,
      api_token: api_token ?? this.api_token,
      phone_country_code: phone_country_code ?? this.phone_country_code,
      mobile_number: mobile_number ?? this.mobile_number,
      street1: street1 ?? this.street1,
      street2: street2 ?? this.street2,
      city: city ?? this.city,
      state: state ?? this.state,
      zip_code: zip_code ?? this.zip_code,
      profile_picture: profile_picture ?? this.profile_picture,
      occupation: occupation ?? this.occupation,
      tagline: tagline ?? this.tagline,
      about_me: about_me ?? this.about_me,
      phone_number: phone_number ?? this.phone_number,
      integration_id: integration_id ?? this.integration_id,
      gateway: gateway ?? this.gateway,
      card_brand: card_brand ?? this.card_brand,
      card_last_four: card_last_four ?? this.card_last_four,
      role: role ?? this.role,
      get_started: get_started ?? this.get_started,
      meta_tags: meta_tags ?? this.meta_tags,
      is_legacy: is_legacy ?? this.is_legacy,
      create_and_share_id: create_and_share_id ?? this.create_and_share_id,
      show_profile_picture: show_profile_picture ?? this.show_profile_picture,
      status: status ?? this.status,
      go_live_code: go_live_code ?? this.go_live_code,
      company: company ?? this.company,
      knocard: knocard ?? this.knocard,
      social_media: social_media ?? this.social_media,
      external_pages: external_pages ?? this.external_pages,
      playlists: playlists ?? this.playlists,
      longitude: longitude ?? this.longitude,
      latitude: latitude ?? this.latitude,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'username': username,
      'first_name': first_name,
      'last_name': last_name,
      'email': email,
      'email_verified_at': email_verified_at,
      'api_token': api_token,
      'phone_country_code': phone_country_code,
      'mobile_number': mobile_number,
      'street1': street1,
      'street2': street2,
      'city': city,
      'state': state,
      'zip_code': zip_code,
      'profile_picture': profile_picture,
      'occupation': occupation,
      'tagline': tagline,
      'about_me': about_me,
      'phone_number': phone_number,
      'integration_id': integration_id,
      'gateway': gateway,
      'card_brand': card_brand,
      'card_last_four': card_last_four,
      'role': role,
      'get_started': get_started,
      'meta_tags': meta_tags,
      'is_legacy': is_legacy,
      'create_and_share_id': create_and_share_id,
      'show_profile_picture': show_profile_picture,
      'status': status,
      'go_live_code': go_live_code,
      'company': company.toMap(),
      'knocard': knocard.toMap(),
      'social_media': social_media.map((x) => x.toMap()).toList(),
      'external_pages': external_pages.map((x) => x.toMap()).toList(),
      'playlists': playlists.map((x) => x.toMap()).toList(),
      'longitude': longitude,
      'latitude': latitude,
    };
  }

  factory UserProfile.fromMap(Map<String, dynamic> map) {
    return UserProfile(
      id: map['id']?.toInt() ?? 0,
      name: map['name'] ?? '',
      username: map['username'] ?? '',
      first_name: map['first_name'] ?? '',
      last_name: map['last_name'] ?? '',
      email: map['email'] ?? '',
      email_verified_at: map['email_verified_at'],
      api_token: map['api_token'] ?? '',
      phone_country_code: map['phone_country_code'] ?? '',
      mobile_number: map['mobile_number'],
      street1: map['street1'] ?? '',
      street2: map['street2'] ?? '',
      city: map['city'] ?? '',
      state: map['state'] ?? '',
      zip_code: map['zip_code']?.toInt() ?? 0,
      profile_picture: map['profile_picture'] ?? '',
      occupation: map['occupation'] ?? '',
      tagline: map['tagline'],
      about_me: map['about_me'],
      phone_number: map['phone_number'] ?? '',
      integration_id: map['integration_id'],
      gateway: map['gateway'],
      card_brand: map['card_brand'],
      card_last_four: map['card_last_four'],
      role: map['role'] ?? '',
      get_started: map['get_started']?.toInt() ?? 0,
      meta_tags: map['meta_tags'],
      is_legacy: map['is_legacy']?.toInt() ?? 0,
      create_and_share_id: map['create_and_share_id'],
      show_profile_picture: map['show_profile_picture']?.toInt() ?? 0,
      status: map['status'] ?? '',
      go_live_code: map['go_live_code'],
      company: Company.fromMap(map['company']),
      knocard: Knocard.fromMap(map['knocard']),
      social_media: List<SocialMedia>.from(
          map['social_media']?.map((x) => SocialMedia.fromMap(x))),
      external_pages: List<ExternalPageData>.from(
          map['external_pages']?.map((x) => ExternalPageData.fromMap(x))),
      playlists: List<Playlist>.from(
          map['playlists']?.map((x) => Playlist.fromMap(x))),
      longitude: map['longitude'] ?? '',
      latitude: map['latitude'] ?? '',
    );
  }

  static double cnvrtDouble(dynamic data) {
    if (data != null) {
      if (data is String) {
        return double.parse(data);
      } else {
        return data?.toDouble() ?? 0.0;
      }
    } else {
      return 0;
    }
  }

  @override
  String toString() {
    return 'UserProfile(id: $id, name: $name, username: $username, first_name: $first_name, last_name: $last_name, email: $email, email_verified_at: $email_verified_at, api_token: $api_token, phone_country_code: $phone_country_code, mobile_number: $mobile_number, street1: $street1, street2: $street2, city: $city, state: $state, zip_code: $zip_code, profile_picture: $profile_picture, occupation: $occupation, tagline: $tagline, about_me: $about_me, phone_number: $phone_number, integration_id: $integration_id, gateway: $gateway, card_brand: $card_brand, card_last_four: $card_last_four, role: $role, get_started: $get_started, meta_tags: $meta_tags, is_legacy: $is_legacy, create_and_share_id: $create_and_share_id, show_profile_picture: $show_profile_picture, status: $status, go_live_code: $go_live_code, company: $company, knocard: $knocard, social_media: $social_media, external_pages: $external_pages, playlists: $playlists, longitude: $longitude, latitude: $latitude)';
  }

  @override
  List<Object> get props {
    return [
      id,
      name,
      username,
      first_name,
      last_name,
      email,
      email_verified_at,
      api_token,
      phone_country_code,
      mobile_number,
      street1,
      street2,
      city,
      state,
      zip_code,
      profile_picture,
      occupation,
      tagline,
      about_me,
      phone_number,
      integration_id,
      gateway,
      card_brand,
      card_last_four,
      role,
      get_started,
      meta_tags,
      is_legacy,
      create_and_share_id,
      show_profile_picture,
      status,
      go_live_code,
      company,
      knocard,
      social_media,
      external_pages,
      playlists,
      longitude,
      latitude,
    ];
  }

  String toJson() => json.encode(toMap());

  factory UserProfile.fromJson(String source) =>
      UserProfile.fromMap(json.decode(source));
  factory UserProfile.init() => UserProfile(
      id: 0,
      name: '',
      username: '',
      first_name: '',
      last_name: '',
      email: '',
      email_verified_at: null,
      api_token: '',
      phone_country_code: '',
      mobile_number: '',
      street1: '',
      street2: '',
      city: '',
      state: '',
      zip_code: 0,
      profile_picture: '',
      occupation: '',
      tagline: null,
      about_me: null,
      phone_number: '',
      integration_id: null,
      gateway: null,
      card_brand: null,
      card_last_four: null,
      role: '',
      get_started: 0,
      meta_tags: '',
      is_legacy: 0,
      create_and_share_id: null,
      show_profile_picture: 0,
      status: '',
      go_live_code: null,
      company: Company.init(),
      knocard: Knocard.init(),
      social_media: const [],
      external_pages: const [],
      playlists: const [],
      longitude: '',
      latitude: '');
}