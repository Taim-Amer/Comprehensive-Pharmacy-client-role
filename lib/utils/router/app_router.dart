import 'package:comprehensive_pharmacy_client_role/dependencies/signin_binding.dart';
import 'package:comprehensive_pharmacy_client_role/features/authentication/views/signin/signin_screen.dart';
import 'package:get/get.dart';

class AppRoutes {
  static const signin = '/signin';
  static const otp = '/otp';
  static const signup = '/signup';
  static const home = '/home';
  static const profile = '/profile';
  static const profileEdit = '/profileEdit';
  static const debtSchedule = '/debtSchedule';
  static const addPayment = '/addPayment';
  static const addDebt = '/addDebt';
  static const clientProfile = '/clientProfile';
  static const notations = '/notations';
  static const settings = '/settings';
  static const notification = '/notification';

  static List<GetPage> routes = [

    GetPage(
      name: signin,
      page: () => const SigninScreen(),
      binding: SigninBinding(),
      transition: Transition.fade
    ),
    //
    // GetPage(
    //   name: otp,
    //   page: () => const OtpScreen(),
    //   binding: OtpBinding(),
    //   transition: Transition.rightToLeft
    // ),
    //
    // GetPage(
    //   name: signup,
    //   page: () => SignupScreen(),
    //   binding: SignupBinding(),
    //   transition: Transition.rightToLeft,
    // ),
    //
    // GetPage(
    //   name: home,
    //   page: () => const HomeScreen(),
    //   binding: HomeBinding(),
    //   transition: Transition.rightToLeft
    // ),
    //
    // GetPage(
    //   name: profile,
    //   page: () => const ProfileScreen(),
    //   transition: Transition.rightToLeft,
    //   binding: ProfileBinding(),
    // ),
    //
    // GetPage(
    //   name: profileEdit,
    //   page: () => const ProfileEditScreen(),
    //   binding: ProfileBinding(),
    //   transition: Transition.rightToLeft
    // ),
    //
    // GetPage(
    //   name: debtSchedule,
    //   page: () => const DebtScheduleScreen(),
    //   binding: DebtScheduleBinding(),
    //   transition: Transition.rightToLeft,
    // ),
    //
    // GetPage(
    //   name: addPayment,
    //   page: () => const PayAdditionScreen(),
    //   binding: AdditionBinding(),
    //   transition: Transition.rightToLeft
    // ),
    //
    // GetPage(
    //     name: addDebt,
    //     page: () => const DebtAdditionScreen(),
    //     binding: AdditionBinding(),
    //     transition: Transition.rightToLeft
    // ),
    //
    // GetPage(
    //     name: clientProfile,
    //     page: () => const ClientProfileScreen(),
    //     binding: ClientProfileBinding(),
    //     transition: Transition.rightToLeft
    // ),
    //
    // GetPage(
    //     name: notations,
    //     page: () => const NotationsScreen(),
    //     binding: NotationsBinding(),
    //     transition: Transition.rightToLeft
    // ),
    //
    // GetPage(
    //     name: settings,
    //     page: () => const SettingsScreen(),
    //     binding: SettingsBinding(),
    //     transition: Transition.rightToLeft
    // ),
    //
    // GetPage(
    //     name: notification,
    //     page: () => const NotificationsScreen(),
    //     binding: NotificationBinding(),
    //     transition: Transition.rightToLeft
    // ),

  ];
}