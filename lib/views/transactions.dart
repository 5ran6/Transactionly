import '../imports/imports.dart';
import 'package:intl/intl.dart';

class Transactions extends StatefulWidget {
  const Transactions({Key? key}) : super(key: key);

  @override
  State<Transactions> createState() => _TransactionsState();
}

class _TransactionsState extends State<Transactions> {
  final oCcy = NumberFormat("#,##0", "en_US");
  // DateFormat.yMMMMd('en_US').format(transactions[index]['entryDate']),
  // final f = new DateFormat('yyyy-MM-dd hh:mm');

  @override
  Widget build(BuildContext context) {
    const transactions = clientTransactions;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        leading: InkWell(
            child:  Container(
              child: SvgPicture.asset("assets/left_arrow.svg"),
              height: ScreenUtil().setHeight(20),
              width: ScreenUtil().setWidth(20),
            ),
            onTap: () {
              Navigator.pop(context);
            }),
        automaticallyImplyLeading: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Column(
            children: List.generate(transactions.length, (index) {
          String type = transactions[index]['type'];
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
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
                                color: transactions[index]['amount']
                                        .toString()
                                        .contains('-')
                                    ? Colors.purple.withOpacity(0.1)
                                    : Colors.green.withOpacity(0.1),
                              ),
                              child: Center(
                                child: SvgPicture.asset(
                                  transactions[index]['amount']
                                          .toString()
                                          .contains('-')
                                      ? 'assets/down_arrow.svg'
                                      : 'assets/up_arrow.svg',
                                  width: 30,
                                  height: 30,
                                  color: transactions[index]['amount']
                                          .toString()
                                          .contains('-')
                                      ? Colors.purple[50]
                                      : Colors.green[50],
                                ),
                              ),
                            ),
                            const SizedBox(width: 15),
                            Container(
                              width: (ScreenUtil().scaleWidth - 90) * 0.5,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    type == "DEPOSIT"
                                        ? "Money Transfer from " +
                                            transactions[index]['comment']
                                                .toString()
                                                .split('Transferred')[0]
                                                .split(' ')[0]
                                        : "Money Transfer to " +
                                            transactions[index]['comment']
                                                .toString()
                                                .split('Transferred')[0]
                                                .split(' ')[0],
                                    style: const TextStyle(
                                        fontSize: 15,
                                        color: kBlackColor,
                                        fontWeight: FontWeight.w500),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  const SizedBox(height: 5),
                                  Text(
                                    DateFormat.yMMMMd('en_US').format(
                                        DateTime.parse(transactions[index]['entryDate'])),
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
                            Text(
                                "₦ " +
                                    oCcy.format(
                                        transactions[index]['amount']),
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 15,
                                  color: transactions[index]['amount']
                                          .toString()
                                          .contains('-')
                                      ? Colors.red[300]
                                      : Colors.green[300],
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
