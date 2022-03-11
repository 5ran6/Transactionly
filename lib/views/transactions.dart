import '../imports/imports.dart';

class Transactions extends StatefulWidget {
  const Transactions({Key? key}) : super(key: key);

  @override
  State<Transactions> createState() => _TransactionsState();
}

class _TransactionsState extends State<Transactions> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: ListView(
        children: const [
          Text("a"),
          Text("b"),
          Text("c"),
          Text("d"),
          Text("e"),
        ],
      ),
    );
  }
}
