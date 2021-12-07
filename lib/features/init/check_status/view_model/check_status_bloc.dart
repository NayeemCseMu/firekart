import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttercommerce/features/app/firebase/firestore_repository.dart';
import 'package:fluttercommerce/core/navigation/navigation_handler.dart';

class CheckStatusBloc extends Cubit<int> {
  CheckStatusBloc(this.firebaseRepo) : super(0);
  FirebaseManager firebaseRepo;

  Future<void> checkStatus(bool checkForAccountStatusOnly) async {
    Future.delayed(Duration(seconds: checkForAccountStatusOnly ? 2 : 0),
        () async {
      final status = await firebaseRepo.checkUserLoggedInStatus();
      if (checkForAccountStatusOnly || status) {
        final isUserDataPresent = await firebaseRepo.checkUserDetail();
        if (isUserDataPresent) {
          NavigationHandler.navigateTo(
            HomeScreenRoute(),
            navigationType: NavigationType.PushReplacement,
          );
        } else {
          NavigationHandler.navigateTo(
            AddUserDetailScreenRoute(newAddress: true),
            navigationType: NavigationType.PushReplacement,
          );
        }
      } else {
        NavigationHandler.navigateTo(
          LoginScreenRoute(),
          navigationType: NavigationType.PushReplacement,
        );
      }
    });
  }
}