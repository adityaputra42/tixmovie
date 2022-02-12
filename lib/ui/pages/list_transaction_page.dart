part of 'pages.dart';

class ListTransactionPage extends StatefulWidget {
  const ListTransactionPage({Key? key}) : super(key: key);

  @override
  State<ListTransactionPage> createState() => _ListTransactionPageState();
}

class _ListTransactionPageState extends State<ListTransactionPage> {
  @override
  void initState() {
    context.read<TransactionCubit>().getTransaction();
    super.initState();
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
            children: [
              Container(
                margin: EdgeInsets.only(
                    top: 30,
                    left: defaultMargin,
                    right: defaultMargin,
                    bottom: 20),
                child: Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(right: 15),
                      child: Icon(
                        Icons.arrow_back_ios,
                        color: whiteColor,
                        size: 24,
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'History Transaction',
                          style: whiteTextStyle.copyWith(
                              fontSize: 18, fontWeight: semiBold),
                        ),
                        const SizedBox(
                          height: 2,
                        ),
                        Text(
                          'View your transaction history here',
                          style: greyTextStyle,
                        )
                      ],
                    )
                  ],
                ),
              ),
              BlocBuilder<TransactionCubit, TransactionState>(
                builder: (context, state) {
                  if (state is TransactionSucces) {
                    return SizedBox(
                        width: double.infinity,
                        height: MediaQuery.of(context).size.height - 132,
                        child: GenerateTransaction(state.transaction));
                  } else {
                    return SizedBox(
                      height: MediaQuery.of(context).size.height - 132,
                      width: double.infinity,
                      child: Center(
                        child: loadingIndicator,
                      ),
                    );
                  }
                },
              ),
            ],
          ))
        ],
      ),
    );
  }
}
