part of 'pages.dart';

class TicketDetail extends StatelessWidget {
  final TicketModel ticket;
  const TicketDetail(this.ticket, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Stack(
        children: [
          const BackgroundComon(),
          SafeArea(
              child: ListView(
            padding: EdgeInsets.symmetric(horizontal: defaultMargin),
            children: [
              Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(
                      top: 30,
                    ),
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
                              'Ticket Detail',
                              style: whiteTextStyle.copyWith(
                                  fontSize: 18, fontWeight: semiBold),
                            ),
                            const SizedBox(
                              height: 2,
                            ),
                            Text(
                              'Use your ticket according to the schedule',
                              style: greyTextStyle,
                              overflow: TextOverflow.clip,
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    margin: const EdgeInsets.only(
                      top: 45,
                    ),
                    height: 170,
                    decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(16),
                            topRight: Radius.circular(16)),
                        image: DecorationImage(
                            image: NetworkImage(imageBaseURL +
                                'w500' +
                                ticket.movieDetail.backdropPath),
                            fit: BoxFit.cover)),
                  ),
                  ClipPath(
                    clipper: TicketTopClipper(),
                    child: Container(
                      width: double.infinity,
                      color: bgInputColor,
                      padding: const EdgeInsets.fromLTRB(20, 16, 20, 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            ticket.movieDetail.title,
                            maxLines: 2,
                            overflow: TextOverflow.clip,
                            style: whiteTextStyle.copyWith(fontSize: 18),
                          ),
                          const SizedBox(
                            height: 6,
                          ),
                          Text(
                            ticket.movieDetail.genresAndLanguage,
                            style: greyTextStyle.copyWith(
                                fontSize: 12, fontWeight: FontWeight.w400),
                          ),
                          const SizedBox(
                            height: 6,
                          ),
                          RatingStar(
                            voteAverage: ticket.movieDetail.voteAverage,
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                "Cinema",
                                style: greyTextStyle.copyWith(
                                    fontSize: 16, fontWeight: FontWeight.w400),
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.45,
                                child: Text(
                                  ticket.theater.name,
                                  textAlign: TextAlign.end,
                                  style: whiteTextStyle.copyWith(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400),
                                ),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 9,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                "Date & Time",
                                style: greyTextStyle.copyWith(
                                    fontSize: 16, fontWeight: FontWeight.w400),
                              ),
                              Text(
                                ticket.time.dateAndTime,
                                style: whiteTextStyle.copyWith(
                                    fontSize: 16, fontWeight: FontWeight.w400),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 9,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                "Seat Numbers",
                                style: greyTextStyle.copyWith(
                                    fontSize: 16, fontWeight: FontWeight.w400),
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.45,
                                child: Text(
                                  ticket.seatInString,
                                  textAlign: TextAlign.end,
                                  style: whiteTextStyle.copyWith(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400),
                                ),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 9,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                "Order ID",
                                style: greyTextStyle.copyWith(
                                    fontSize: 16, fontWeight: FontWeight.w400),
                              ),
                              Text(
                                ticket.bookingCode,
                                style: whiteTextStyle.copyWith(
                                    fontSize: 16, fontWeight: FontWeight.w400),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          generateDashedDivider(
                              MediaQuery.of(context).size.width -
                                  2 * defaultMargin -
                                  40)
                        ],
                      ),
                    ),
                  ),
                  ClipPath(
                    clipper: TicketBottomClipper(),
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.fromLTRB(20, 16, 20, 16),
                      color: bgInputColor,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                "Name: ",
                                style: greyTextStyle.copyWith(
                                    fontSize: 16, fontWeight: FontWeight.w400),
                              ),
                              Text(
                                ticket.name,
                                style: whiteTextStyle.copyWith(
                                    fontSize: 16, fontWeight: FontWeight.w400),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Text(
                                "Paid: ",
                                style: greyTextStyle.copyWith(
                                    fontSize: 16, fontWeight: FontWeight.w400),
                              ),
                              Text(
                                NumberFormat.currency(
                                        locale: "id_ID",
                                        decimalDigits: 0,
                                        symbol: "IDR ")
                                    .format(ticket.totalPrice),
                                style: whiteTextStyle.copyWith(
                                    fontSize: 16, fontWeight: medium),
                              ),
                            ],
                          ),
                          QrImage(
                            version: 7,
                            backgroundColor: greyColor.withOpacity(0.2),
                            foregroundColor: whiteColor.withOpacity(0.8),
                            errorCorrectionLevel: QrErrorCorrectLevel.M,
                            padding: const EdgeInsets.all(0),
                            size: 100,
                            data: ticket.bookingCode,
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  )
                ],
              ),
            ],
          ))
        ],
      ),
    );
  }
}

class TicketTopClipper extends CustomClipper<Path> {
  double radius = 15;

  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height - radius);
    path.quadraticBezierTo(radius, size.height - radius, radius, size.height);
    path.lineTo(size.width - radius, size.height);
    path.quadraticBezierTo(size.width - radius, size.height - radius,
        size.width, size.height - radius);
    path.lineTo(size.width, 0);

    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class TicketBottomClipper extends CustomClipper<Path> {
  double radius = 15;
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.moveTo(0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, radius);
    path.quadraticBezierTo(size.width - radius, radius, size.width - radius, 0);
    path.lineTo(radius, 0);
    path.quadraticBezierTo(radius, radius, 0, radius);

    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
