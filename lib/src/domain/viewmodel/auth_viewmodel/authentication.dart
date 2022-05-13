import 'package:dev_guide/src/core/helper/local_storage_data.dart';
import 'package:dev_guide/src/core/helper/service/firestore_user.dart';
import 'package:dev_guide/src/core/routes_name.dart';
import 'package:dev_guide/src/domain/model/user.dart';

import 'package:dev_guide/src/presentation/resources/color_manager.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Authentication extends GetxController {
  // it's like controller property you can use it to call all data here inside any widget
  static Authentication instance = Get.find();
  final LocalStorageData localStorageData = Get.find();

  final FirebaseAuth _auth = FirebaseAuth.instance;
  late final GoogleSignIn _googleSignIn;
  late final GoogleSignInAccount googleAcc;

  String? email, password, fullName;
  var isLoading = false.obs;
  @override
  void onInit() {
    email = '';
    password = '';
    fullName = '';
    isLoading.value = false;

    super.onInit();
  }

  @override
  void onReady() async {
    super.onReady();
    _googleSignIn = GoogleSignIn();
  }

  @override
  void onClose() {
    // ignore: todo
    // TODO: implement onClose
    super.onClose();
  }

  // Sign in with google account
  void signInWithGoogle() async {
    try {
      googleAcc = (await _googleSignIn.signIn())!;
      GoogleSignInAuthentication googleSignInAuthentication =
          await googleAcc.authentication;
      AuthCredential authCredential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );
      await _auth
          .signInWithCredential(authCredential)
          .then((user) async => saveUser(user));
      Get.offNamedUntil(RoutesName.mainPage, (route) => false);
    } catch (e) {
      Get.snackbar(
        "Error occurred",
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: ColorManager.error,
        colorText: ColorManager.white,
      );
    }
  }

  // Sign in with facebook
  void signInWithFacebook() async {
    // todo: later on
    // try {
    //   final LoginResult result =
    //       await FacebookAuth.instance.login(permissions: ['email']);

    //   if (result.status == LoginStatus.success) {
    //     final AuthCredential credential =
    //         FacebookAuthProvider.credential(result.accessToken!.token);
    //     await _auth.signInWithCredential(credential);
    //   }
    // } catch (e) {
    //   Get.snackbar(
    //     "Error occurred",
    //     e.toString(),
    //     snackPosition: SnackPosition.BOTTOM,
    //     backgroundColor: ColorsManager.error,
    //     colorText: ColorsManager.white,
    //   );
    // }
  }

  //Sign In with Email and Password without social authentication
  void signInWithEmailAndPassword() async {
    try {
      isLoadingState();
      await _auth
          .signInWithEmailAndPassword(
        email: email!,
        password: password!,
      )
          .then((value) async {
        await FireStoreUser().getCurrentUser(value.user!.uid).then((value) {
          setUser(
            UserModel.fromJson(
              value.data() as Map<dynamic, dynamic>,
            ),
          );
        });
      });
      Get.offNamedUntil(RoutesName.mainPage, (route) => false);
    } catch (e) {
      Get.snackbar(
        "Error occurred",
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: ColorManager.error,
        colorText: ColorManager.white,
      );
    }
  }

  // Sign Up with Email and Password without social authentication
  void signUpWithEmailAndPassword() async {
    try {
      isLoadingState();
      await _auth
          .createUserWithEmailAndPassword(
            email: email!,
            password: password!,
          )
          .then(
            (user) async => saveUser(user),
          );

      Get.offNamedUntil(RoutesName.mainPage, (route) => false);
    } catch (e) {
      Get.snackbar(
        "Account creation failed",
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: ColorManager.error,
        colorText: ColorManager.white,
      );
    }
  }

  // void logOut() async {
  //   await _auth.signOut();
  //   Get.offNamedUntil(RoutesName.signin, (route) => false);
  // }

  void saveUser(UserCredential user) async {
    UserModel userModel = UserModel(
      userId: user.user!.uid,
      email: user.user!.email,
      fullName: fullName == null ? user.user!.displayName : fullName,
    );
    await FireStoreUser().addUserToFireStore(userModel);
    setUser(userModel);
  }

  void setUser(UserModel userModel) async {
    await localStorageData.setUser(userModel);
  }

  void isLoadingState() async {
    isLoading.value = true;
    await Future.delayed(Duration(seconds: 2));
    isLoading.value = false;
  }
}
