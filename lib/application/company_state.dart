import 'package:equatable/equatable.dart';

import 'package:meta/meta.dart';

import '../domain/profile/company/company_external_link.dart';
import '../domain/profile/company/company_feed.dart';

class CompanyState extends Equatable {
  final List<CompanyFeed> feeds;
  final List<CompanyExternalLinkEntity> buttons;
  const CompanyState({
    required this.feeds,
    required this.buttons,
  });

  CompanyState copyWith({
    List<CompanyFeed>? feeds,
    List<CompanyExternalLinkEntity>? buttons,
  }) {
    return CompanyState(
      feeds: feeds ?? this.feeds,
      buttons: buttons ?? this.buttons,
    );
  }

  factory CompanyState.init() => const CompanyState(buttons: [], feeds: []);
  @override
  String toString() => 'CompanyState(feeds: $feeds, buttons: $buttons)';

  @override
  List<Object> get props => [feeds, buttons];
}
