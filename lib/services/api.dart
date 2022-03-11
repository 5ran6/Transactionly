import 'package:transactionly/imports/imports.dart';

class Api {

// logout
  Future signOut() async {
    try {

     await SharedPreferences.getInstance().then((prefs) async{
       await prefs.clear();
     });
     return "true";

    } catch (error) {
      if (kDebugMode) {
        print("got and error: " + error.toString());
      }
      return "error";
    }
  }

}
