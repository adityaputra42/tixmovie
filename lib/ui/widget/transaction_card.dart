part of 'widget.dart';

class TransactionCard extends StatelessWidget {
  final TransactionModel transaction;
  const TransactionCard(this.transaction, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 90,
      padding: const EdgeInsets.all(5),
      margin:
          EdgeInsets.only(bottom: 8, left: defaultMargin, right: defaultMargin),
      decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(color: Colors.black12, spreadRadius: 2, blurRadius: 3)
          ],
          borderRadius: BorderRadius.circular(12),
          color: bgInputColor.withOpacity(0.5)),
      child: Row(
        children: [
          Container(
            height: 80,
            width: 70,
            margin: const EdgeInsets.only(right: 18),
            child: (transaction.picture != null)
                ? Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        image: DecorationImage(
                            image: NetworkImage(
                                imageBaseURL + 'w500' + transaction.picture!),
                            fit: BoxFit.cover)),
                  )
                : Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        image: const DecorationImage(
                            image: AssetImage('assets/bg_topup.png'))),
                  ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width - 146,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  transaction.title,
                  style:
                      whiteTextStyle.copyWith(fontSize: 18, fontWeight: medium),
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(
                  height: 3,
                ),
                Text(
                  NumberFormat.currency(
                          locale: 'ID_id', decimalDigits: 0, symbol: 'IDR ')
                      .format(transaction.amount < 0
                          ? -transaction.amount
                          : transaction.amount),
                  style: greenTextStyle.copyWith(
                    color: transaction.amount < 0 ? redColor : greenColor,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(
                  height: 3,
                ),
                Text(
                  transaction.subtitle,
                  style: greyTextStyle.copyWith(fontWeight: light),
                  maxLines: 2,
                  overflow: TextOverflow.clip,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
