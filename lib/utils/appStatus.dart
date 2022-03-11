import 'package:weight_tracker/imports/imports.dart';

Api api = Api();
late SharedPreferences prefs;
enum Status {
  NotLoggedIn,
  NotRegistered,
  LoggedIn,
  Registered,
  Authenticating,
  Registering,
  LoggedOut,
  Loading,
  NotLoading,
  Error,
  LoadingTransactions,
  LoadedTransactions,
  TransactionsError
}
