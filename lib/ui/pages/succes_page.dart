part of 'pages.dart';

class SuccesPage extends StatelessWidget {
  final TransactionModel transaction;
  final TicketModel? ticket;
  const SuccesPage({Key? key, required this.transaction, this.ticket})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: FutureBuilder(
          future: ticket != null
              ? processingTicketOrder(context)
              : processingTopUp(context),
          builder: (context, snapshot) => (snapshot.connectionState ==
                  ConnectionState.done)
              ? Stack(
                  children: [
                    const BackgroundComon(),
                    SafeArea(
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 240,
                              height: 240,
                              margin: const EdgeInsets.only(bottom: 30),
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                image: AssetImage(ticket != null
                                    ? 'assets/ilustrasi_ticket.png'
                                    : 'assets/ilustrasi_topup.png'),
                              )),
                            ),
                            Text(
                              ticket != null ? 'Happy Watching!' : 'Emm Yummy!',
                              style: whiteTextStyle.copyWith(
                                  fontSize: 20, fontWeight: medium),
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            Text(
                              ticket != null
                                  ? "You have successfully\nbought the ticket"
                                  : "You have successfully\ntop up the wallet",
                              textAlign: TextAlign.center,
                              style: greyTextStyle.copyWith(
                                  fontSize: 16, fontWeight: FontWeight.w300),
                            ),
                            CustomButton(
                              title: ticket != null ? 'My Ticket' : "My Wallet",
                              onPressed: () {
                                if (ticket != null) {
                                  Navigator.pushAndRemoveUntil(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => const MainPage(
                                                initialPage: 1,
                                              )),
                                      (route) => false);
                                } else {
                                  Navigator.pushAndRemoveUntil(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => const MainPage(
                                                initialPage: 2,
                                              )),
                                      (route) => false);
                                }
                              },
                              margin: const EdgeInsets.symmetric(
                                  horizontal: 48, vertical: 30),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Discover new movie? ",
                                  style: greyTextStyle.copyWith(),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.pushNamedAndRemoveUntil(
                                        context, '/main', (route) => false);
                                  },
                                  child: Text(
                                    "Back to Home",
                                    style: yellowTextStyle.copyWith(
                                        fontWeight: medium),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                )
              : Center(
                  child: loadingIndicator,
                )),
    );
  }

  Future<void> processingTicketOrder(BuildContext context) async {
    context.read<AuthCubit>().purchase(ticket!.totalPrice);
    context.read<TicketCubit>().saveTicket(transaction.userID, ticket!);

    await TransactionService().saveTransaction(transaction);
  }

  Future<void> processingTopUp(BuildContext context) async {
    context.read<AuthCubit>().topUp(transaction.userID, transaction.amount);
    await TransactionService().saveTransaction(transaction);
  }
}
