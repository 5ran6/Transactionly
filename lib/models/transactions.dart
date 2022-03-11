class Transactions {
  final int transactionId;
  final String? type;
  final int? amount;
  final String? comment;
  final String? entryDate;
  final String? currencyCode;
  final String? balance;

  Transactions(
      {required this.transactionId,
      this.type,
      this.amount,
      this.comment,
      this.entryDate,
      this.currencyCode,
      this.balance});

  Map<String, dynamic> toJson() => {
        'transactionId': transactionId,
        'type': type,
        'amount': amount,
        'comment': comment,
        'entryDate': entryDate,
        'currencyCode': currencyCode,
        'balance': balance
      };
}
