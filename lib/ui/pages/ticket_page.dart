part of 'pages.dart';

class TicketPage extends StatefulWidget {
  final bool isExpiredTicket;

  const TicketPage({
    Key? key,
    this.isExpiredTicket = false,
  }) : super(key: key);

  @override
  State<TicketPage> createState() => _TicketPageState();
}

class _TicketPageState extends State<TicketPage> {
  late bool isExpiredTickets;
  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    User? user = FirebaseAuth.instance.currentUser;
    context.read<TicketCubit>().getTicket(user!.uid);
    isExpiredTickets = widget.isExpiredTicket;
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
                    margin: const EdgeInsets.only(top: 30, left: 24),
                    width: double.infinity,
                    child: Text(
                      'My Tickets',
                      style: whiteTextStyle.copyWith(
                          fontWeight: semiBold, fontSize: 18),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 3, bottom: 30, left: 24),
                    width: double.infinity,
                    child: Text(
                      'Your tiket movie in here',
                      style: greyTextStyle.copyWith(fontWeight: light),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  CustomTabBar(
                      selectedIndex: selectedIndex,
                      title: const ['Newest', 'Oldest'],
                      ontap: (index) {
                        this.setState(() {
                          selectedIndex = index;
                          isExpiredTickets = !isExpiredTickets;
                        });
                      }),
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
                  BlocBuilder<TicketCubit, TicketState>(
                      builder: (context, state) {
                    if (state is TicketSucces) {
                      return SizedBox(
                        width: double.infinity,
                        height: MediaQuery.of(context).size.height - 270,
                        child: TicketViewer(isExpiredTickets
                            ? state.tickets
                                .where((ticket) =>
                                    ticket.time.isBefore(DateTime.now()))
                                .toList()
                            : state.tickets
                                .where((ticket) =>
                                    !ticket.time.isBefore(DateTime.now()))
                                .toList()),
                      );
                    } else {
                      return SizedBox(
                        height: MediaQuery.of(context).size.height - 270,
                        width: double.infinity,
                        child: Center(
                          child: loadingIndicator,
                        ),
                      );
                    }
                  })
                ],
              ),
            ),
          ],
        ));
  }
}

class TicketViewer extends StatelessWidget {
  final List<TicketModel> tickets;

  const TicketViewer(this.tickets, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var sortedTicket = tickets;
    sortedTicket
        .sort((ticket1, ticket2) => ticket1.time.compareTo(ticket2.time));

    return ListView.builder(
      itemCount: sortedTicket.length,
      itemBuilder: (_, index) => GestureDetector(
          onTap: () {},
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => TicketDetail(tickets[index])));
            },
            child: Container(
                margin: EdgeInsets.only(
                    top: (index == 0) ? 3 : 0,
                    bottom: index == sortedTicket.length - 1 ? 25 : 0),
                child: Ticketcard(tickets[index])),
          )),
    );
  }
}
