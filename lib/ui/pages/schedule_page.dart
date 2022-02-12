part of 'pages.dart';

class SchedulePage extends StatefulWidget {
  final MovieDetail movieDetail;
  const SchedulePage(
    this.movieDetail, {
    Key? key,
  }) : super(key: key);

  @override
  State<SchedulePage> createState() => _SchedulePageState();
}

class _SchedulePageState extends State<SchedulePage> {
  late List<DateTime> dates;
  late DateTime selectedDate;
  int? selectedTime;
  Theater? selectedTheater;
  bool isValid = false;

  @override
  void initState() {
    super.initState();
    dates =
        List.generate(7, (index) => DateTime.now().add(Duration(days: index)));
    selectedDate = dates[0];
  }

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
                            'Set Your Schedule',
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
                  'Date',
                  style:
                      whiteTextStyle.copyWith(fontWeight: medium, fontSize: 18),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 20, top: 12),
                  height: 80,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: dates.length,
                    itemBuilder: (_, index) => Container(
                      margin: EdgeInsets.only(
                          right: (index < dates.length - 1) ? 16 : 0),
                      child: DateCard(
                        dates[index],
                        isSelected: selectedDate == dates[index],
                        onTap: () {
                          this.setState(() {
                            selectedDate = dates[index];
                          });
                        },
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                generateTimeTable(),
                BlocBuilder<AuthCubit, AuthState>(
                  builder: (context, state) {
                    if (state is AuthSucces) {
                      return CustomButton(
                          margin: const EdgeInsets.only(top: 30, bottom: 45),
                          title: 'Continue',
                          onPressed: () {
                            if (isValid) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => OrderPage(
                                      ticket: TicketModel(
                                          movieDetail: widget.movieDetail,
                                          theater: selectedTheater!,
                                          time: DateTime(
                                              selectedDate.year,
                                              selectedDate.month,
                                              selectedDate.day,
                                              selectedTime!),
                                          bookingCode: randomAlphaNumeric(12)
                                              .toUpperCase(),
                                          name: state.user.name)),
                                ),
                              );
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  dismissDirection: DismissDirection.up,
                                  backgroundColor: greenColor,
                                  content: Text(
                                    'Please complete your schedule',
                                    style: whiteTextStyle,
                                  ),
                                ),
                              );
                            }
                          });
                    } else {
                      return const SizedBox();
                    }
                  },
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Column generateTimeTable() {
    List<int> schedule = List.generate(7, (index) => 10 + index * 2);
    List<Widget> widgets = [];

    for (var theater in dummyTheaters) {
      widgets.add(Container(
        margin: const EdgeInsets.only(bottom: 16),
        child: Text(
          theater.name,
          style: whiteTextStyle.copyWith(fontSize: 20),
        ),
      ));

      widgets.add(Container(
        height: 45,
        margin: const EdgeInsets.only(top: 12, bottom: 20),
        child: ListView.builder(
          itemBuilder: (_, index) => Container(
            margin:
                EdgeInsets.only(right: (index < schedule.length - 1) ? 14 : 0),
            child: TimeCard(
              "${schedule[index]}:00",
              isSelected:
                  selectedTheater == theater && selectedTime == schedule[index],
              isEnable: schedule[index] > DateTime.now().hour ||
                  selectedDate.day != DateTime.now().day,
              onTap: () {
                this.setState(() {
                  selectedTheater = theater;
                  selectedTime = schedule[index];
                  isValid = (schedule[index] > DateTime.now().hour ||
                          selectedDate.day != DateTime.now().day)
                      ? true
                      : false;
                });
              },
            ),
          ),
          itemCount: schedule.length,
          scrollDirection: Axis.horizontal,
        ),
      ));
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: widgets,
    );
  }
}
