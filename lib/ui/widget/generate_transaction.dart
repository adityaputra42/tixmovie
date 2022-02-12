part of 'widget.dart';

class GenerateTransaction extends StatelessWidget {
  final List<TransactionModel> transactions;
  const GenerateTransaction(this.transactions, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var sortedTransaction = transactions;
    sortedTransaction.sort((transaction1, transaction2) =>
        transaction2.time.compareTo(transaction1.time));

    return ListView.builder(
        itemCount: sortedTransaction.length,
        itemBuilder: (context, index) => Container(
            margin: EdgeInsets.only(
                top: (index == 0) ? 3 : 0,
                bottom: index == sortedTransaction.length - 1 ? 20 : 0),
            child: TransactionCard(transactions[index])));
  }
}
