part of 'pages.dart';

class WalletPage extends StatefulWidget {
  const WalletPage({Key? key}) : super(key: key);

  @override
  State<WalletPage> createState() => _WalletPageState();
}

class _WalletPageState extends State<WalletPage> {
  @override
  void initState() {
    super.initState();
    context.read<TransactionCubit>().getTransaction();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Stack(
        children: [
          const BackgroundComon(),
          SafeArea(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: defaultMargin),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(
                              top: 30,
                            ),
                            width: double.infinity,
                            child: Text(
                              'My Wallet',
                              style: whiteTextStyle.copyWith(
                                  fontWeight: semiBold, fontSize: 18),
                              textAlign: TextAlign.left,
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 3, bottom: 30),
                            width: double.infinity,
                            child: Text(
                              'Check your wallet balance here',
                              style: greyTextStyle.copyWith(
                                fontWeight: light,
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 70,
                      height: 40,
                      child: TextButton(
                        style: TextButton.styleFrom(
                            backgroundColor: greenColor,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12))),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const TopUpPage()));
                        },
                        child: Text(
                          'Top Up',
                          style: whiteTextStyle.copyWith(fontWeight: medium),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: defaultMargin),
                child: const BalanceCard(),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: defaultMargin),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 20),
                      child: Text(
                        'Ricent transaction',
                        style: whiteTextStyle.copyWith(
                            fontSize: 16, fontWeight: semiBold),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const ListTransactionPage()));
                      },
                      child: Container(
                        margin: const EdgeInsets.only(top: 20),
                        child: Text(
                          'See More >>',
                          style: whiteTextStyle.copyWith(
                              fontSize: 16,
                              fontWeight: medium,
                              color: yellowColor),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                height: 0.6,
                color: greyColor,
                margin: EdgeInsets.only(
                    left: defaultMargin,
                    right: defaultMargin,
                    top: 5,
                    bottom: 10),
              ),
              BlocBuilder<TransactionCubit, TransactionState>(
                builder: (context, state) {
                  if (state is TransactionSucces) {
                    return SizedBox(
                        width: double.infinity,
                        height: MediaQuery.of(context).size.height - 475,
                        child: GenerateTransaction(
                            state.transaction.sublist(0, 4)));
                  } else {
                    return SizedBox(
                      height: MediaQuery.of(context).size.height - 475,
                      width: double.infinity,
                      child: Center(
                        child: loadingIndicator,
                      ),
                    );
                  }
                },
              ),
            ],
          )),
        ],
      ),
    );
  }
}
