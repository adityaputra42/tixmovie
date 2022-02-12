part of 'widget.dart';

class MoneyCard extends StatelessWidget {
  final double width;
  final bool isSelected;
  final int amount;
  final Function() onTap;

  const MoneyCard(
      {Key? key,
      this.isSelected = false,
      this.amount = 0,
      required this.onTap,
      this.width = 90})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: 60,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            boxShadow: const [
              BoxShadow(blurRadius: 1, spreadRadius: 1, color: Colors.black12)
            ],
            color: isSelected ? mainColor : bgInputColor),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("IDR",
                style: greyTextStyle.copyWith(
                    fontWeight: medium,
                    fontSize: 16,
                    color: isSelected ? blackColor : whiteColor)),
            const SizedBox(
              height: 3,
            ),
            Text(
              NumberFormat.currency(
                      locale: 'id_ID', decimalDigits: 0, symbol: '')
                  .format(amount),
              style: whiteTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: medium,
                  color: isSelected ? blackColor : whiteColor),
            )
          ],
        ),
      ),
    );
  }
}
