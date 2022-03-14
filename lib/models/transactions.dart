class Transaction {
  final int transactionId;
  final String? type;
  final int? amount;
  final String? comment;
  final String? entryDate;
  final String? currencyCode;
  final String? balance;

  Transaction(
      {required this.transactionId,
      this.type,
      this.amount,
      this.comment,
      this.entryDate,
      this.currencyCode,
      this.balance});

  factory Transaction.fromJson(Map<String, dynamic> json) {
    return Transaction(
        transactionId: json['transactionId'],
        type: json['type'],
        amount: json['amount'],
        comment: json['comment'],
        entryDate: json['entryDate'],
        currencyCode: json['currencyCode'],
        balance: json['balance']);
  }


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
