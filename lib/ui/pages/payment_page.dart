part of 'pages.dart';

class PaymentPage extends StatelessWidget {
  final TicketModel ticket;
  const PaymentPage({Key? key, required this.ticket}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int total = 52500 * ticket.seats.length;
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Stack(
        children: [
          const BackgroundComon(),
          SafeArea(
            child: BlocBuilder<AuthCubit, AuthState>(
              builder: (context, state) {
                if (state is AuthSucces) {
                  return ListView(
                    padding: EdgeInsets.symmetric(horizontal: defaultMargin),
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          /// NOTE: Header
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
                                  child: Text(
                                    'Checkout\nMovie',
                                    style: whiteTextStyle.copyWith(
                                        fontSize: 20, fontWeight: medium),
                                    textAlign: TextAlign.center,
                                  ),
                                )
                              ],
                            ),
                          ),

                          /// NOTE: Payment Detail
                          Container(
                            margin: const EdgeInsets.only(bottom: 30),
                            width: double.infinity,
                            padding: const EdgeInsets.symmetric(
                                vertical: 30, horizontal: 20),
                            decoration: BoxDecoration(
                                boxShadow: const [
                                  BoxShadow(
                                      blurRadius: 2,
                                      spreadRadius: 2,
                                      color: Colors.black12)
                                ],
                                borderRadius: BorderRadius.circular(16),
                                color: secondBgColor),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      width: 70,
                                      height: 80,
                                      margin: const EdgeInsets.only(right: 20),
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                              image: NetworkImage(imageBaseURL +
                                                  "w780" +
                                                  ticket.movieDetail
                                                      .backdropPath),
                                              fit: BoxFit.cover),
                                          borderRadius:
                                              BorderRadius.circular(8)),
                                    ),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width -
                                          178,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            ticket.movieDetail.title,
                                            style: whiteTextStyle.copyWith(
                                                fontWeight: semiBold,
                                                fontSize: 18),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          const SizedBox(
                                            height: 4,
                                          ),
                                          Text(
                                            ticket
                                                .movieDetail.genresAndLanguage,
                                            style: greyTextStyle.copyWith(
                                                fontWeight: light),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          const SizedBox(
                                            height: 4,
                                          ),
                                          RatingStar(
                                            voteAverage:
                                                ticket.movieDetail.voteAverage,
                                            fontSize: 14,
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                                Container(
                                  width: double.infinity,
                                  height: 1,
                                  margin: const EdgeInsets.only(
                                      top: 15, bottom: 20),
                                  color: darkGrey,
                                ),
                                Container(
                                  margin: const EdgeInsets.only(bottom: 10),
                                  child: Text(
                                    'Booking Details',
                                    style: whiteTextStyle.copyWith(
                                        fontSize: 16, fontWeight: semiBold),
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'ID Order',
                                      style:
                                          greyTextStyle.copyWith(fontSize: 16),
                                    ),
                                    Text(
                                      ticket.bookingCode,
                                      style:
                                          whiteTextStyle.copyWith(fontSize: 16),
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 6,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Cinema',
                                      style:
                                          greyTextStyle.copyWith(fontSize: 16),
                                    ),
                                    Text(
                                      ticket.theater.name,
                                      style:
                                          whiteTextStyle.copyWith(fontSize: 16),
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 6,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Date & Time',
                                      style:
                                          greyTextStyle.copyWith(fontSize: 16),
                                    ),
                                    Text(
                                      ticket.time.dateAndTime,
                                      style:
                                          whiteTextStyle.copyWith(fontSize: 16),
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 6,
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Seat Number',
                                      style:
                                          greyTextStyle.copyWith(fontSize: 16),
                                    ),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width /
                                              2 -
                                          24,
                                      child: Text(
                                        ticket.seatInString,
                                        style: whiteTextStyle.copyWith(
                                            fontSize: 16),
                                        textAlign: TextAlign.end,
                                        overflow: TextOverflow.clip,
                                      ),
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 6,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Price',
                                      style:
                                          greyTextStyle.copyWith(fontSize: 16),
                                    ),
                                    Text(
                                      "IDR 50.000 x ${ticket.seats.length}",
                                      style:
                                          whiteTextStyle.copyWith(fontSize: 16),
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 6,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Fee',
                                      style:
                                          greyTextStyle.copyWith(fontSize: 16),
                                    ),
                                    Text(
                                      "IDR 2.500 x ${ticket.seats.length}",
                                      style:
                                          whiteTextStyle.copyWith(fontSize: 16),
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 6,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Total',
                                      style:
                                          greyTextStyle.copyWith(fontSize: 16),
                                    ),
                                    Text(
                                      NumberFormat.currency(
                                              locale: 'ID_id',
                                              decimalDigits: 0,
                                              symbol: 'IDR ')
                                          .format(total),
                                      style: whiteTextStyle.copyWith(
                                        fontSize: 16,
                                        fontWeight: semiBold,
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),

                          /// NOTE: Your Wallet
                          Container(
                            margin: const EdgeInsets.only(bottom: 40),
                            width: double.infinity,
                            padding: const EdgeInsets.symmetric(
                                vertical: 30, horizontal: 20),
                            decoration: BoxDecoration(
                                boxShadow: const [
                                  BoxShadow(
                                      blurRadius: 2,
                                      spreadRadius: 2,
                                      color: Colors.black12)
                                ],
                                borderRadius: BorderRadius.circular(16),
                                color: secondBgColor),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  margin: const EdgeInsets.only(bottom: 20),
                                  child: Text(
                                    'Payment Details',
                                    style: whiteTextStyle.copyWith(
                                        fontSize: 16, fontWeight: semiBold),
                                  ),
                                ),
                                Row(
                                  children: [
                                    Container(
                                      width: 90,
                                      height: 60,
                                      padding: const EdgeInsets.all(5),
                                      margin: const EdgeInsets.only(right: 16),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          gradient: LinearGradient(
                                            colors: [bgInputColor, greyColor],
                                          ),
                                          boxShadow: [
                                            BoxShadow(
                                                color: Colors.black
                                                    .withOpacity(0.25),
                                                offset: const Offset(0, 3),
                                                blurRadius: 2)
                                          ]),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            'Pay',
                                            style: whiteTextStyle.copyWith(
                                                fontWeight: medium,
                                                fontSize: 18),
                                          ),
                                          const SizedBox(
                                            width: 4,
                                          ),
                                          Align(
                                            alignment: Alignment.bottomRight,
                                            child: Container(
                                              width: 30,
                                              height: 30,
                                              decoration: const BoxDecoration(
                                                  image: DecorationImage(
                                                      image: AssetImage(
                                                          'assets/mastercard.png'),
                                                      fit: BoxFit.cover)),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          NumberFormat.currency(
                                                  locale: 'ID_id',
                                                  decimalDigits: 0,
                                                  symbol: 'IDR ')
                                              .format(state.user.balance),
                                          style: greenTextStyle.copyWith(
                                              color: state.user.balance >= total
                                                  ? greenColor
                                                  : redColor,
                                              fontWeight: medium,
                                              fontSize: 20),
                                        ),
                                        const SizedBox(
                                          height: 4,
                                        ),
                                        Text(
                                          'Current Balance',
                                          style: greyTextStyle.copyWith(
                                              fontWeight: light, fontSize: 16),
                                        )
                                      ],
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),

                          /// NOTE: Button Payment

                          Container(
                            width: double.infinity,
                            height: 50,
                            margin: const EdgeInsets.only(bottom: 50),
                            child: TextButton(
                              style: TextButton.styleFrom(
                                  backgroundColor: state.user.balance >= total
                                      ? mainColor
                                      : greenColor,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(17))),
                              onPressed: () {
                                if (state.user.balance >= total) {
                                  TransactionModel transaction =
                                      TransactionModel(
                                          userID: state.user.id,
                                          title: ticket.movieDetail.title,
                                          subtitle: ticket.theater.name,
                                          time: DateTime.now(),
                                          amount: -total,
                                          picture:
                                              ticket.movieDetail.posterPath);
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => SuccesPage(
                                                transaction: transaction,
                                                ticket: ticket.copyWith(
                                                    totalPrice: total),
                                              )));
                                } else {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const TopUpPage()));
                                }
                              },
                              child: Text(
                                state.user.balance >= total
                                    ? 'Pay Now'
                                    : "Top Up Now",
                                style: blacTextStyle.copyWith(
                                    color: state.user.balance >= total
                                        ? blackColor
                                        : whiteColor,
                                    fontSize: 18,
                                    fontWeight: medium),
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  );
                } else {
                  return Center(
                    child: loadingIndicator,
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
