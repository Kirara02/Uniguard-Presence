import 'package:freezed_annotation/freezed_annotation.dart';

part 'presence.freezed.dart';
part 'presence.g.dart';

@freezed
class Presence with _$Presence {
  factory Presence({
    required String date,
    required String checkIn,
    required String checkOut,
  }) = _Presence;

  factory Presence.fromJson(Map<String, dynamic> json) => _$PresenceFromJson(json);
}
