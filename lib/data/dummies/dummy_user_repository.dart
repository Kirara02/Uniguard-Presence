import 'package:unipres/data/repositories/user_repository.dart';
import 'package:unipres/domain/entities/presence.dart';
import 'package:unipres/domain/entities/result.dart';
import 'package:unipres/domain/entities/user.dart';

class DummyUserRepository implements UserRepository {
  @override
  Future<Result<List<Presence>>> getPresencehistories() async {
    await Future.delayed(const Duration(seconds: 1));
    List<Presence> results = [
      Presence(date: 'Monday, May 1, 2024', checkIn: '08:00 AM', checkOut: '05:00 PM'),
      Presence(date: 'Tuesday, May 2, 2024', checkIn: '08:00 AM', checkOut: '05:00 PM'),
      Presence(date: 'Wednesday, May 3, 2024', checkIn: '08:00 AM', checkOut: '05:00 PM'),
      Presence(date: 'Thursday, May 4, 2024', checkIn: '08:00 AM', checkOut: '05:00 PM'),
      Presence(date: 'Friday, May 5, 2024', checkIn: '08:00 AM', checkOut: '05:00 PM'),
      Presence(date: 'Saturday, May 6, 2024', checkIn: '08:00 AM', checkOut: '05:00 PM'),
    ];

    return Result.success(results);
  }

  @override
  Future<Result<User>> getUser() async {
    await Future.delayed(const Duration(seconds: 1));
    return Result.success(User(id: 1, name: 'Kirara Bernstein', email: 'kirara@gmail.com'));
  }
}
