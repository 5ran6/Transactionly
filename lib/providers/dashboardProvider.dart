import 'package:weight_tracker/imports/imports.dart';

class DashboardProvider with ChangeNotifier {
  // Status _loggedInStatus = Status.NotLoggedIn;
  //
  // Status get loggedInStatus => _loggedInStatus;
  //BLoC
  // // Login User
  // Future<Map?> login(String email, String password) async {
  //   prefs = await SharedPreferences.getInstance();
  //   _loggedInStatus = Status.Authenticating;
  //   notifyListeners();
  //   api.signUp(email, password, "").then((value) {
  //     if (value != null) {
  //       if (value["status"] == "success") {
  //         _loggedInStatus = Status.LoggedIn;
  //         print("Value returns true");
  //         notifyListeners();
  //         return value;
  //       } else if (value["status"] == "failed") {
  //         _loggedInStatus = Status.NotLoggedIn;
  //         print("Error is " + value["error"]);
  //         notifyListeners();
  //         return value;
  //       }
  //     } else {
  //       _loggedInStatus = Status.NotLoggedIn;
  //       notifyListeners();
  //       return "Error reaching server";
  //     }
  //   });
  //   _loggedInStatus = Status.NotLoggedIn;
  //   notifyListeners();
  //   return null;
  // }
  //
  // // LogOut User
  // Future<bool> logout() async {
  //   api.logout().then((value) {
  //     if (value!) {
  //       _loggedInStatus = Status.LoggedOut;
  //       notifyListeners();
  //       return true;
  //     } else {
  //       return false;
  //     }
  //   });
  //   return true;
  // }
}
