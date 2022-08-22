import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flutter/material.dart';
import 'package:knocard_ui/domain/external_asset_icons_icons.dart';
import 'package:knocard_ui/domain/external_icon.dart';
import 'package:knocard_ui/domain/my_flutter_app_icons_all.dart';
import 'package:knocard_ui/domain/profile/feature_selection_model.dart';

import 'profile_background.dart';

class Constants {
  static String solidBackground = 'solid';
  static String gradientBackground = 'gradient';
  static String patternBackground = 'pattern';
  static String uploadBackground = 'upload';

  static List<ProfileBackground> solid = [
    ProfileBackground(
        id: 1,
        categCode: 'solid',
        widget: Container(height: 190, color: const Color(0xff088AC7)),
        textColor: Colors.black),
    ProfileBackground(
        id: 2,
        categCode: 'solid',
        widget: Container(
          height: 190,
          color: const Color(0xff24DCF1),
        ),
        textColor: Colors.black),
    ProfileBackground(
        id: 3,
        categCode: 'solid',
        widget: Container(height: 190, color: const Color(0xffF58227)),
        textColor: Colors.black),
    ProfileBackground(
        id: 4,
        categCode: 'solid',
        widget: Container(height: 190, color: const Color(0xffEBA3E4)),
        textColor: Colors.black),
    ProfileBackground(
        id: 5,
        categCode: 'solid',
        widget: Container(height: 190, color: const Color(0xff535353)),
        textColor: Colors.white),
    ProfileBackground(
        id: 6,
        categCode: 'solid',
        widget: Container(height: 190, color: const Color(0xffFF9B9B)),
        textColor: Colors.black),
    ProfileBackground(
        id: 7,
        categCode: 'solid',
        widget: Container(height: 190, color: const Color(0xff7B7B7B)),
        textColor: Colors.black),
    ProfileBackground(
        id: 8,
        categCode: 'solid',
        widget: Container(height: 190, color: const Color(0xffF4F9A3)),
        textColor: Colors.black),
    ProfileBackground(
        id: 9,
        categCode: 'solid',
        widget: Container(height: 190, color: const Color(0xffC6C5C5)),
        textColor: Colors.black),
    ProfileBackground(
        id: 10,
        categCode: 'solid',
        widget: Container(height: 190, color: const Color(0xffFFFCE5)),
        textColor: Colors.black),
  ];

  static List<ProfileBackground> gradient = [
    ProfileBackground(
        id: 1,
        categCode: 'gradient',
        widget: Container(
            height: 190,
            decoration: const BoxDecoration(
                gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment(1.0, 0.5),
              colors: [Color(0xFFEEBD89), Color(0xFFD13ABD)],
              tileMode: TileMode.mirror,
            ))),
        textColor: Colors.white),
    ProfileBackground(
        id: 2,
        categCode: 'gradient',
        widget: Container(
            height: 190,
            decoration: const BoxDecoration(
                gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment(0.0, 1.0),
              colors: [Color(0xFFFEA858), Color(0xFFED765E)],
              tileMode: TileMode.mirror,
            ))),
        textColor: Colors.white),
    ProfileBackground(
        id: 3,
        categCode: 'gradient',
        widget: Container(
            height: 190,
            decoration: const BoxDecoration(
                gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment(
                  0.5, 1.0), // 10% of the width, so there are ten blinds.
              colors: [Color(0xFFBB73E0), Color(0xFFFF8DBB)], // whitish to gray
              tileMode: TileMode.mirror, // repeats the gradient over the canvas
            ))),
        textColor: Colors.white),
    ProfileBackground(
        id: 4,
        categCode: 'gradient',
        widget: Container(
            height: 190,
            decoration: const BoxDecoration(
                gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment(
                  0.5, 1.0), // 10% of the width, so there are ten blinds.
              colors: [Color(0xFF0CCDA3), Color(0xFFC1FCD3)], // whitish to gray
              tileMode: TileMode.mirror, // repeats the gradient over the canvas
            ))),
        textColor: Colors.black),
    ProfileBackground(
        id: 5,
        categCode: 'gradient',
        widget: Container(
            height: 190,
            decoration: const BoxDecoration(
                gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment(
                  1.0, 0.5), // 10% of the width, so there are ten blinds.
              colors: [Color(0xFFF9957F), Color(0xFFF2F5D0)], // whitish to gray
              tileMode: TileMode.mirror, // repeats the gradient over the canvas
            ))),
        textColor: Colors.black),
    ProfileBackground(
        id: 6,
        categCode: 'gradient',
        widget: Container(
            height: 190,
            decoration: const BoxDecoration(
                gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment(
                  0.5, 1.0), // 10% of the width, so there are ten blinds.
              colors: [Color(0xFFFF9B9B), Color(0xFFEBDFDF)], // whitish to gray
              tileMode: TileMode.mirror, // repeats the gradient over the canvas
            ))),
        textColor: Colors.white),
    ProfileBackground(
        id: 7,
        categCode: 'gradient',
        widget: Container(
            height: 190,
            decoration: const BoxDecoration(
                gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment(
                  0.5, 1.0), // 10% of the width, so there are ten blinds.
              colors: [Color(0xFFF6A09A), Color(0xFF8A1F1D)], // whitish to gray
              tileMode: TileMode.mirror, // repeats the gradient over the canvas
            ))),
        textColor: Colors.white),
    ProfileBackground(
        id: 8,
        categCode: 'gradient',
        widget: Container(
            height: 190,
            decoration: const BoxDecoration(
                gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment(
                  0.5, 1.0), // 10% of the width, so there are ten blinds.
              colors: [Color(0xFFF4F9A3), Color(0xFFE9E9E9)], // whitish to gray
              tileMode: TileMode.mirror, // repeats the gradient over the canvas
            ))),
        textColor: Colors.black),
    ProfileBackground(
        id: 9,
        categCode: 'gradient',
        widget: Container(
            height: 190,
            decoration: const BoxDecoration(
                gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment(
                  0.5, 1.0), // 10% of the width, so there are ten blinds.
              colors: [
                Color(0xfffeae5e9),
                Color(0xFF636363)
              ], // whitish to gray
              tileMode: TileMode.mirror, // repeats the gradient over the canvas
            ))),
        textColor: Colors.white),
    ProfileBackground(
        id: 10,
        categCode: 'gradient',
        widget: Container(
            height: 190,
            decoration: const BoxDecoration(
                gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment(
                  0.5, 1.0), // 10% of the width, so there are ten blinds.
              colors: [Color(0xFFFFFCE5), Color(0xFFF2E59D)], // whitish to gray
              tileMode: TileMode.mirror, // repeats the gradient over the canvas
            ))),
        textColor: Colors.black),
  ];

  static List<ProfileBackground> pattern = [
    ProfileBackground(
        id: 1,
        categCode: 'pattern',
        widget: Image.asset(
          'assets/images/backgrounds/default.png',
          height: 190,
          fit: BoxFit.fill,
        ),
        textColor: Colors.black),
    ProfileBackground(
        id: 2,
        categCode: 'pattern',
        widget: Image.asset(
          'assets/images/backgrounds/star_shower_blue.png',
          height: 190,
          fit: BoxFit.fill,
        ),
        textColor: Colors.black),
    ProfileBackground(
        id: 3,
        categCode: 'pattern',
        widget: Image.asset(
          'assets/images/backgrounds/triangle_pattern_dots.png',
          height: 190,
          fit: BoxFit.fill,
        ),
        textColor: Colors.black),
    ProfileBackground(
        id: 4,
        categCode: 'pattern',
        widget: Image.asset(
          'assets/images/backgrounds/wave_grey_wood_pattern.png',
          height: 190,
          fit: BoxFit.fill,
        ),
        textColor: Colors.black),
    ProfileBackground(
        id: 5,
        categCode: 'pattern',
        widget: Image.asset(
          'assets/images/backgrounds/colorful_polka_dots.png',
          height: 190,
          fit: BoxFit.fill,
        ),
        textColor: Colors.black),
    ProfileBackground(
        id: 6,
        categCode: 'pattern',
        widget: Image.asset(
          'assets/images/backgrounds/wave_grey_diagonal.png',
          height: 190,
          fit: BoxFit.fill,
        ),
        textColor: Colors.black),
    ProfileBackground(
        id: 7,
        categCode: 'pattern',
        widget: Image.asset(
          'assets/images/backgrounds/white_polka_dots.png',
          height: 190,
        ),
        textColor: Colors.black),
    ProfileBackground(
        id: 8,
        categCode: 'pattern',
        widget: Image.asset(
          'assets/images/backgrounds/wave_grey.png',
          height: 190,
          fit: BoxFit.fill,
        ),
        textColor: Colors.black),
    ProfileBackground(
        id: 9,
        categCode: 'pattern',
        widget: Image.asset(
          'assets/images/backgrounds/green_polka_dots.png',
          height: 190,
          fit: BoxFit.fill,
        ),
        textColor: Colors.black),
    ProfileBackground(
        id: 10,
        categCode: 'pattern',
        widget: Image.asset(
          'assets/images/backgrounds/stripe_blue.png',
          height: 190,
          fit: BoxFit.fill,
        ),
        textColor: Colors.black),
  ];

  static List<ProfileBackground> upload = [
    ProfileBackground(
        id: 1,
        categCode: 'upload',
        widget: Image.asset(
          'assets/images/backgrounds/default.png',
          height: 190,
          fit: BoxFit.fill,
        ),
        textColor: Colors.black),
    ProfileBackground(
        id: 2,
        categCode: 'upload',
        widget: Image.asset(
          'assets/images/backgrounds/star_shower_blue.png',
          height: 190,
          fit: BoxFit.fill,
        ),
        textColor: Colors.black),
  ];

  static List<ExternalIcon> externalIcons = [
    ExternalIcon(icon: MyFlutterAppAll.a_food_and_drink, size: 20),
    ExternalIcon(icon: MyFlutterAppAll.a_food_court, size: 20),
    ExternalIcon(icon: MyFlutterAppAll.a_food_delivery, size: 20),
    ExternalIcon(icon: MyFlutterAppAll.a_food_restaurant_waiter, size: 20),
    ExternalIcon(icon: MyFlutterAppAll.a_food_restaurant, size: 20),
    ExternalIcon(icon: MyFlutterAppAll.a_foodaa_coffee_cup, size: 20),
    ExternalIcon(icon: MyFlutterAppAll.a_foodab_bar, size: 20),
    ExternalIcon(icon: MyFlutterAppAll.a_foodab_booking_reservation, size: 20),
    ExternalIcon(icon: MyFlutterAppAll.aa_prof_auto_repair_mechanic, size: 20),
    ExternalIcon(icon: MyFlutterAppAll.aa_prof_automobile, size: 20),
    ExternalIcon(icon: MyFlutterAppAll.aa_prof_bt_security_guard, size: 20),
    ExternalIcon(icon: MyFlutterAppAll.aa_prof_builder, size: 20),
    ExternalIcon(icon: MyFlutterAppAll.aa_prof_business_woman, size: 20),
    ExternalIcon(
        icon: MyFlutterAppAll.aa_prof_c_presentation_learning, size: 20),
    ExternalIcon(icon: MyFlutterAppAll.aa_prof_computer_monitor, size: 20),
    ExternalIcon(icon: MyFlutterAppAll.flower_bouquet, size: 20),
    ExternalIcon(icon: MyFlutterAppAll.aa_prof_insurance_protection, size: 20),
    ExternalIcon(icon: MyFlutterAppAll.aa_prof_law, size: 20),
    ExternalIcon(icon: MyFlutterAppAll.aa_prof_loudspeaker, size: 20),
    ExternalIcon(icon: MyFlutterAppAll.aa_prof_market_share, size: 20),
    ExternalIcon(icon: MyFlutterAppAll.aa_prof_market2_growth, size: 20),
    ExternalIcon(icon: MyFlutterAppAll.aa_prof_mic_microphone, size: 20),
    ExternalIcon(icon: MyFlutterAppAll.aa_prof_nation_flag, size: 20),
    ExternalIcon(icon: MyFlutterAppAll.aa_prof_network, size: 20),
    ExternalIcon(icon: MyFlutterAppAll.aa_prof_paw, size: 20),
    ExternalIcon(icon: MyFlutterAppAll.medicine_sign, size: 20),
    ExternalIcon(icon: MyFlutterAppAll.aa_prof_re1, size: 20),
    ExternalIcon(icon: MyFlutterAppAll.aa_prof_re2, size: 20),
    ExternalIcon(icon: MyFlutterAppAll.aa_prof_re3, size: 20),
    ExternalIcon(icon: MyFlutterAppAll.aa_prof_value, size: 20),
    ExternalIcon(icon: MyFlutterAppAll.aa_prof_vphoto, size: 20),
    ExternalIcon(icon: MyFlutterAppAll.aa_prof_vphoto2, size: 20),
    ExternalIcon(icon: MyFlutterAppAll.aa_prof_women_cut_scissor, size: 20),
    ExternalIcon(icon: MyFlutterAppAll.aa_prof_women_grooming_nail, size: 20),
    ExternalIcon(icon: MyFlutterAppAll.aa_profz_cleaning, size: 20),
    ExternalIcon(icon: MyFlutterAppAll.aa_profz_garden, size: 20),
    ExternalIcon(icon: MyFlutterAppAll.aa_profz_garden2, size: 20),
    ExternalIcon(icon: MyFlutterAppAll.aa_profz_lamp, size: 20),
    ExternalIcon(icon: MyFlutterAppAll.aa_profz_maintenance, size: 20),
    ExternalIcon(icon: MyFlutterAppAll.aa_profz_plumbing, size: 20),
    ExternalIcon(icon: MyFlutterAppAll.aa_profz_saw, size: 20),
    ExternalIcon(icon: MyFlutterAppAll.aa_z_prof_book_literature, size: 20),
    ExternalIcon(icon: MyFlutterAppAll.aa_z_prof_gift_box, size: 20),
    ExternalIcon(icon: MyFlutterAppAll.bldg_bank, size: 20),
    ExternalIcon(icon: MyFlutterAppAll.bldg_cloth_store, size: 20),
    ExternalIcon(icon: MyFlutterAppAll.bldg_prof_building, size: 20),
    ExternalIcon(icon: MyFlutterAppAll.ent_culture_cinema, size: 20),
    ExternalIcon(icon: MyFlutterAppAll.ent_dolphin, size: 20),
    ExternalIcon(icon: MyFlutterAppAll.ent_gamepad, size: 20),
    ExternalIcon(icon: MyFlutterAppAll.ent_horse, size: 20),
    ExternalIcon(icon: MyFlutterAppAll.ent_movies, size: 20),
    ExternalIcon(icon: MyFlutterAppAll.ent_music_note, size: 20),
    ExternalIcon(icon: MyFlutterAppAll.ent_party_balloon, size: 20),
    ExternalIcon(icon: MyFlutterAppAll.ent_playing_card_spade_shape, size: 20),
    ExternalIcon(icon: MyFlutterAppAll.faith_pigeon_bird, size: 20),
    ExternalIcon(icon: MyFlutterAppAll.fashion_beauty_cream, size: 20),
    ExternalIcon(icon: MyFlutterAppAll.fashion_dress, size: 20),
    ExternalIcon(icon: MyFlutterAppAll.fashion_female_hat, size: 20),
    ExternalIcon(icon: MyFlutterAppAll.fashion_heel_sandal, size: 20),
    ExternalIcon(icon: MyFlutterAppAll.fashion_z_lipstick, size: 20),
    ExternalIcon(icon: MyFlutterAppAll.fit_apple_fruits, size: 20),
    ExternalIcon(icon: MyFlutterAppAll.fit_champion_winner, size: 20),
    ExternalIcon(icon: MyFlutterAppAll.fit_cycling, size: 20),
    ExternalIcon(icon: MyFlutterAppAll.fit2, size: 20),
    ExternalIcon(icon: MyFlutterAppAll.fitness_yoga_exercise, size: 20),
    ExternalIcon(icon: MyFlutterAppAll.flower_bouquet, size: 20),
    ExternalIcon(icon: MyFlutterAppAll.flower_rose_plant, size: 20),
    ExternalIcon(icon: MyFlutterAppAll.flower_spa, size: 20),
    ExternalIcon(icon: MyFlutterAppAll.med_ambulance, size: 20),
    ExternalIcon(icon: MyFlutterAppAll.medab_brush_teeth, size: 20),
    ExternalIcon(icon: MyFlutterAppAll.medical_briefcase, size: 20),
    ExternalIcon(icon: MyFlutterAppAll.medicine_sign, size: 20),
    ExternalIcon(icon: MyFlutterAppAll.shop_cost_tag, size: 20),
    ExternalIcon(icon: MyFlutterAppAll.shop_online_card_payment, size: 20),
    ExternalIcon(icon: MyFlutterAppAll.shopping_bag, size: 20),
    ExternalIcon(icon: MyFlutterAppAll.shopping_cart, size: 20),
    ExternalIcon(icon: MyFlutterAppAll.sm_facebook_round, size: 20),
    ExternalIcon(icon: MyFlutterAppAll.sm_instagram, size: 20),
    ExternalIcon(icon: MyFlutterAppAll.sm_thumbs_up_black, size: 20),
    ExternalIcon(icon: MyFlutterAppAll.sm_twitter_round, size: 20),
    ExternalIcon(icon: MyFlutterAppAll.sm_youtube_round, size: 20),
    ExternalIcon(icon: MyFlutterAppAll.travel_business_trip, size: 20),
    ExternalIcon(icon: MyFlutterAppAll.travel_earth, size: 20),
    ExternalIcon(icon: MyFlutterAppAll.travel_plane, size: 20),
    ExternalIcon(icon: MyFlutterAppAll.travel_ship, size: 20),
    ExternalIcon(icon: MyFlutterAppAll.zz_baby_carriage, size: 20),
    ExternalIcon(icon: MyFlutterAppAll.zz_binoculars, size: 20),
    ExternalIcon(icon: MyFlutterAppAll.zz_heart_black, size: 20),
    ExternalIcon(icon: MyFlutterAppAll.zz_mail, size: 20),
    ExternalIcon(icon: MyFlutterAppAll.zz_planet_space, size: 20),
    ExternalIcon(icon: MyFlutterAppAll.zz_read_book, size: 20),
    ExternalIcon(icon: MyFlutterAppAll.zz_ring, size: 20),
    ExternalIcon(icon: ExternalAssetIcons.globe, size: 20),
    ExternalIcon(icon: ExternalAssetIcons.link, size: 20),
  ];

  static final featureList = IMap<int, FeatureSelectionModel>(const {
    6: FeatureSelectionModel(feature: 'Contacts', lookupId: 6, selected: false),
    7: FeatureSelectionModel(
        feature: "Photo Gallery", lookupId: 7, selected: false),
    8: FeatureSelectionModel(
        feature: "Video Playlist", lookupId: 8, selected: false),
    9: FeatureSelectionModel(
        feature: "Business Page", lookupId: 9, selected: false),
    10: FeatureSelectionModel(
        feature: "External Link", lookupId: 10, selected: false),
  });
}
