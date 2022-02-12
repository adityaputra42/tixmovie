part of 'pages.dart';

class TopUpPage extends StatefulWidget {
  const TopUpPage({Key? key}) : super(key: key);

  @override
  _TopUpPageState createState() => _TopUpPageState();
}

class _TopUpPageState extends State<TopUpPage> {
  TextEditingController amountController = TextEditingController(text: 'IDR 0');
  int selectAmount = 0;
  @override
  Widget build(BuildContext context) {
    double cardWidth =
        ((MediaQuery.of(context).size.width - (2 * defaultMargin) - 40) / 3);
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Stack(
        children: [
          const BackgroundComon(),
          SafeArea(
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: defaultMargin),
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 20, bottom: 30),
                  height: 56,
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: GestureDetector(
                          onTap: () {},
                          child: Icon(Icons.arrow_back_ios_outlined,
                              color: whiteColor),
                        ),
                      ),
                      Center(
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width * 0.5,
                          child: Text(
                            'Top Up',
                            style: whiteTextStyle.copyWith(
                                fontSize: 20, fontWeight: medium),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 50,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                    color: bgInputColor,
                    borderRadius: BorderRadius.circular(defaultRadius),
                  ),
                  child: TextField(
                    cursorColor: whiteColor,
                    controller: amountController,
                    onChanged: (text) {
                      String temp = '';
                      for (int i = 0; i < text.length; i++) {
                        temp += text.isDigit(i) ? text[i] : '';
                      }

                      this.setState(() {
                        selectAmount = int.tryParse(temp) ?? 0;
                      });
                      amountController.text = NumberFormat.currency(
                              locale: 'id_ID', symbol: 'IDR ', decimalDigits: 0)
                          .format(selectAmount);
                      amountController.selection = TextSelection.fromPosition(
                          TextPosition(offset: amountController.text.length));
                    },
                    style: whiteTextStyle,
                    decoration: InputDecoration(
                        focusColor: Colors.white,
                        hintText: 'Amount',
                        hintStyle: greyTextStyle,
                        border: InputBorder.none),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 20, bottom: 14),
                  child: Text(
                    "Choose by Template",
                    style: whiteTextStyle,
                  ),
                ),
                Wrap(
                  spacing: 20,
                  runSpacing: 14,
                  children: [
                    makeMoneyCard(
                      amount: 50000,
                      width: cardWidth,
                    ),
                    makeMoneyCard(
                      amount: 100000,
                      width: cardWidth,
                    ),
                    makeMoneyCard(
                      amount: 150000,
                      width: cardWidth,
                    ),
                    makeMoneyCard(
                      amount: 200000,
                      width: cardWidth,
                    ),
                    makeMoneyCard(
                      amount: 250000,
                      width: cardWidth,
                    ),
                    makeMoneyCard(
                      amount: 500000,
                      width: cardWidth,
                    ),
                    makeMoneyCard(
                      amount: 1000000,
                      width: cardWidth,
                    ),
                    makeMoneyCard(
                      amount: 2500000,
                      width: cardWidth,
                    ),
                    makeMoneyCard(
                      amount: 5000000,
                      width: cardWidth,
                    )
                  ],
                ),
                BlocBuilder<AuthCubit, AuthState>(
                  builder: (context, state) {
                    if (state is AuthSucces) {
                      return CustomButton(
                        title: 'Top Up Now',
                        onPressed: () {
                          if (selectAmount > 0) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SuccesPage(
                                            transaction: TransactionModel(
                                          subtitle:
                                              "${DateTime.now().dayName}, ${DateTime.now().day} ${DateTime.now().monthName} ${DateTime.now().year}",
                                          amount: selectAmount,
                                          title: 'Top Up Wallet',
                                          time: DateTime.now(),
                                          userID: state.user.id,
                                        ))));
                          }
                        },
                        margin: const EdgeInsets.only(top: 70),
                      );
                    }
                    return const SizedBox();
                  },
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  MoneyCard makeMoneyCard({required int amount, required double width}) {
    return MoneyCard(
      amount: amount,
      width: width,
      isSelected: amount == selectAmount,
      onTap: () {
        this.setState(() {
          if (selectAmount != amount) {
            selectAmount = amount;
          } else {
            selectAmount = 0;
          }
          amountController.text = NumberFormat.currency(
                  locale: 'id_ID', decimalDigits: 0, symbol: 'IDR ')
              .format(selectAmount);

          amountController.selection = TextSelection.fromPosition(
              TextPosition(offset: amountController.text.length));
        });
      },
    );
  }
}
