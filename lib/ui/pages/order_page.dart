part of 'pages.dart';

class OrderPage extends StatefulWidget {
  final TicketModel ticket;
  const OrderPage({
    Key? key,
    required this.ticket,
  }) : super(key: key);

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  List<String> selectedSeats = [];

  bool isValid = false;

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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 20, bottom: 20),
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
                              widget.ticket.movieDetail.title,
                              style: whiteTextStyle.copyWith(
                                  fontSize: 20, fontWeight: medium),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Text(
                    'Select Your Seat',
                    style: whiteTextStyle.copyWith(
                        fontWeight: medium, fontSize: 18),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 16, bottom: 30),
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 30),
                    decoration: BoxDecoration(
                        color: secondBgColor,
                        boxShadow: const [
                          BoxShadow(
                              blurRadius: 2,
                              spreadRadius: 2,
                              color: Colors.black12)
                        ],
                        borderRadius: BorderRadius.circular(16)),
                    child: Column(
                      children: [
                        Container(
                          width: double.infinity,
                          height: 80,
                          decoration: const BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage('assets/screen_green.png'),
                                  fit: BoxFit.contain)),
                        ),
                        generateSeats(),
                      ],
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    margin: const EdgeInsets.only(bottom: 30),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 30),
                    decoration: BoxDecoration(
                        color: secondBgColor,
                        boxShadow: const [
                          BoxShadow(
                              blurRadius: 2,
                              spreadRadius: 2,
                              color: Colors.black12)
                        ],
                        borderRadius: BorderRadius.circular(16)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Container(
                                  width: 20,
                                  height: 20,
                                  margin: const EdgeInsets.only(right: 12),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(4),
                                    color: bgInputColor,
                                  ),
                                ),
                                Text(
                                  'Availabe',
                                  style: whiteTextStyle.copyWith(
                                      fontWeight: light),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 12,
                            ),
                            Row(
                              children: [
                                Container(
                                  width: 20,
                                  height: 20,
                                  margin: const EdgeInsets.only(right: 12),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(4),
                                    color: darkGrey,
                                  ),
                                ),
                                Text(
                                  'Booked',
                                  style: whiteTextStyle.copyWith(
                                      fontWeight: light),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 12,
                            ),
                            Row(
                              children: [
                                Container(
                                  width: 20,
                                  height: 20,
                                  margin: const EdgeInsets.only(right: 12),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(4),
                                    color: mainColor,
                                  ),
                                ),
                                Text(
                                  'Selected',
                                  style: whiteTextStyle.copyWith(
                                      fontWeight: light),
                                )
                              ],
                            )
                          ],
                        ),
                        Container(
                          width: 2,
                          height: 100,
                          color: whiteColor,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Selected Seat',
                              style: greyTextStyle,
                            ),
                            const SizedBox(
                              height: 2,
                            ),
                            SizedBox(
                              width:
                                  MediaQuery.of(context).size.width / 2 - 100,
                              child: Text(
                                selectedSeats.join(', '),
                                style: whiteTextStyle,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            const SizedBox(
                              height: 6,
                            ),
                            Text(
                              'Price',
                              style: greyTextStyle,
                            ),
                            const SizedBox(
                              height: 2,
                            ),
                            Text(
                              NumberFormat.currency(
                                      locale: 'ID_id',
                                      symbol: 'IDR ',
                                      decimalDigits: 0)
                                  .format(50000 * selectedSeats.length),
                              style: whiteTextStyle,
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  CustomButton(
                    title: 'Book Now',
                    onPressed: () {
                      if (selectedSeats.isNotEmpty) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => PaymentPage(
                                      ticket: widget.ticket
                                          .copyWith(seats: selectedSeats),
                                    )));
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            dismissDirection: DismissDirection.up,
                            backgroundColor: greenColor,
                            content: Text(
                              'Please select your seats',
                              style: whiteTextStyle,
                            ),
                          ),
                        );
                      }
                    },
                    margin: const EdgeInsets.only(top: 10, bottom: 50),
                  )
                ],
              ),
            ],
          )),
        ],
      ),
    );
  }

  Column generateSeats() {
    List<int> numberofSeats = [6, 6, 6, 6, 6, 6];
    List<Widget> widgets = [];

    for (int i = 0; i < numberofSeats.length; i++) {
      widgets.add(Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
            numberofSeats[i],
            (index) => Padding(
                  padding: EdgeInsets.only(
                      right: index < numberofSeats[i] - 1 ? 12 : 0,
                      bottom: 15,
                      left: (index == 3) ? 20 : 0),
                  child: SelectableBox(
                    text: "${String.fromCharCode(i + 65)}${index + 1}",
                    width: 35,
                    height: 35,
                    fontsize: 13,
                    isSelected: selectedSeats
                        .contains("${String.fromCharCode(i + 65)}${index + 1}"),
                    onTap: () {
                      String seatNumber =
                          "${String.fromCharCode(i + 65)}${index + 1}";
                      this.setState(() {
                        if (selectedSeats.contains(seatNumber)) {
                          selectedSeats.remove(seatNumber);
                        } else {
                          selectedSeats.add(seatNumber);
                        }
                      });
                    },
                  ),
                )),
      ));
    }

    return Column(
      children: widgets,
    );
  }
}
