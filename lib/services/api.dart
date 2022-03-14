import 'package:transactionly/imports/imports.dart';
import 'package:http/http.dart' as http;

class Api {
  Api(this._baseAddress);

// "https://api-sandbox.renmoney.com/deposit-transfer/api/v3/investment/3580016662"
  final String _baseAddress;

  Future<List<Transaction>> getAllTransactions() async {
    final response = await _get('/transactions');
    final decodedTasks = json.decode(response.body)["data"] as List;
    return decodedTasks
        .map((jsonTask) => Transaction.fromJson(jsonTask))
        .toList();
  }

// logout
  Future<http.Response> _get(String endpoint) async {
    try {
      final response = await http.get(
        '$_baseAddress$endpoint',
        headers: {
          HttpHeaders.acceptHeader: 'application/json',
        },
      );
      return returnResponseOrThrowException(response);
    } on IOException catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
      throw NetworkException();
    }
  }

  http.Response returnResponseOrThrowException(http.Response response) {
    if (response.statusCode == 404) {
      throw ItemNotFoundException();
    } else if (response.statusCode > 400) {
      throw UnKnownApiException(response.statusCode);
    } else {
      return response;
    }
  }
}
