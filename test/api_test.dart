import 'package:transactionly/utils/exceptions.dart';
import 'package:transactionly/models/transactions.dart';
import 'package:transactionly/services/api.dart';
import 'package:flutter_test/flutter_test.dart';

import 'api/mock_api.dart';

const getTasksResponse = '/get_tasks_response.json';

Api? _api;
MockApi mockApi = MockApi();
String anyTaskId = '1';
Transaction transaction =
    Transaction(
    transactionId: 1, type: 'DEPOSIT', amount: 9000, comment: "Payment on investment from Paystack with auth_code AUTH_7j6h47njx4", entryDate: "2022-03-09T09:26:40+0000", currencyCode: "NGN",  balance: "98000");

void main() {
  setUp(() async {
    await mockApi.start();

    _api = Api(mockApi.baseAddress);
  });

  tearDown(() {
    mockApi.shutdown();
  });

  group('TodoApiClient', () {
    group('GetAllTasks should', () {
      test('sends get request to the correct endpoint', () async {
        await mockApi.enqueueMockResponse(fileName: getTasksResponse);

        await _api!.getAllTransactions();

        mockApi.expectRequestSentTo('/todos');
      });

      test('sends accept header', () async {
        await mockApi.enqueueMockResponse(fileName: getTasksResponse);

        await _api!.getAllTransactions();

        mockApi.expectRequestContainsHeader('accept', 'application/json');
      });

      test('parse current news properly getting all current news', () async {
        await mockApi.enqueueMockResponse(fileName: getTasksResponse);

        final tasks = await _api!.getAllTransactions();

        expectTasksContainsExpectedValues(tasks[0]);
      });

      test(
          'throws UnknownErrorException if there is not handled error getting news',
          () async {
        await mockApi.enqueueMockResponse(httpCode: 454);

        expect(() => _api!.getAllTransactions(),
            throwsA(isInstanceOf<UnKnownApiException>()));
      });
    });

  });
}

void expectTasksContainsExpectedValues(Transaction transaction) {
  expect(transaction, isNotNull);
  expect(transaction.transactionId, 1);
  expect(transaction.type, 'DEPOSIT');
  expect(transaction.amount, 9000);
  expect(transaction.comment, "Payment on investment from Paystack with auth_code AUTH_7j6h47njx4");
  expect(transaction.entryDate, "2022-03-09T09:26:40+0000");
  expect(transaction.currencyCode, 'NGN');
  expect(transaction.balance, '98000');

}
