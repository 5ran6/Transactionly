import '../imports/imports.dart';
import 'package:intl/intl.dart';


class Transactions extends StatefulWidget {
  const Transactions({Key? key}) : super(key: key);

  @override
  State<Transactions> createState() => _TransactionsState();
}

class _TransactionsState extends State<Transactions> {
  final oCcy = NumberFormat("#,##0", "en_US");

  @override
  Widget build(BuildContext context) {
    const transactions = clientTransactions;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Column(
            children: List.generate(transactions.length, (index) {
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.purple[100]!,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(10))
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: (ScreenUtil().scaleWidth - 40) * 0.7,
                        child: Row(
                          children: [
                            Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.grey.withOpacity(0.1),
                              ),
                              child: Center(
                                child: Image.asset(
                                  transactions[index]['icon'],
                                  width: 30,
                                  height: 30,
                                ),
                              ),
                            ),
                            SizedBox(width: 15),
                            Container(
                              width: (ScreenUtil().scaleWidth - 90) * 0.5,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    transactions[index]['name'],
                                    style: const TextStyle(
                                        fontSize: 15,
                                        color: kBlackColor,
                                        fontWeight: FontWeight.w500),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  SizedBox(height: 5),
                                  Text(
                                    transactions[index]['date'],
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: kBlackColor.withOpacity(0.5),
                                        fontWeight: FontWeight.w400),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        width: (ScreenUtil().scaleWidth - 40) * 0.3,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text( "₦ "+ oCcy.format(double.parse(transactions[index]['amount'])),
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 15,
                                  color: transactions[index]['amount']
                                          .toString()
                                          .contains('-')
                                      ? Colors.red
                                      : Colors.green,
                                )),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          );
        })),
      ),
    );
  }
}
