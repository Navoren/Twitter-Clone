import 'package:appwrite/appwrite.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:twitter_clone/core/core.dart';

//want to signup, want to user account -> Account
//want to access uesr related data -> model.Account

final authApiProvider = Provider((ref) {
  return AuthAPI(account: account);
});

abstract class IAuthAPI {
  FutureEither<Account> signUp({
    required String email,
    required String password,
  });
}

//abstract could be used if we furthur have to change our backend.

class AuthAPI implements IAuthAPI {
  final Account _account;
  AuthAPI({required Account account}) : _account = account;
  @override
  FutureEither<Account> signUp({
    required String email,
    required String password,
  }) async {
    try {
      final account = await _account.create(
        userId: ID.unique(),
        email: email,
        password: password,
      );
      return right(account as Account);
    } on AppwriteException catch (e, stackTrace) {
      return left(Failure(
        e.message ?? 'Some Unexpected Error occured',
        stackTrace,
      ));
    } catch (e, stackTrace) {
      return left(Failure(
        e.toString(),
        stackTrace,
      ));
    }
  }
}
