part of 'pages.dart';

class BonusPage extends StatelessWidget {
  const BonusPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Stack(
        children: [
          const BackgroundComon(),
          SafeArea(
              child: Container(
            margin: EdgeInsets.only(left: defaultMargin, right: defaultMargin),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const BalanceCard(),
                const SizedBox(
                  height: 50,
                ),
                Text(
                  'Big Bonus 🎉',
                  style: whiteTextStyle.copyWith(
                      fontWeight: semiBold, fontSize: 32),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'We give you early credit so that\nyou can buy a flight ticket',
                  textAlign: TextAlign.center,
                  style:
                      greyTextStyle.copyWith(fontWeight: light, fontSize: 16),
                ),
                CustomButton(
                  title: 'Start Watch Movie',
                  onPressed: () {
                    Navigator.pushNamedAndRemoveUntil(
                        context, '/main', (route) => false);
                  },
                  width: 312,
                  margin: const EdgeInsets.only(top: 60),
                )
              ],
            ),
          )),
        ],
      ),
    );
  }
}
