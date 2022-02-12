part of 'pages.dart';

class MainPage extends StatefulWidget {
  final int initialPage;
  const MainPage({Key? key, this.initialPage = 0}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  PageController pageController = PageController(initialPage: 0);
  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    selectedIndex = widget.initialPage;
    pageController = PageController(initialPage: selectedIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: secondBgColor,
      body: Stack(
        children: [
          const BackgroundComon(),
          SafeArea(
            child: PageView(
              controller: pageController,
              onPageChanged: (index) {
                this.setState(() {
                  selectedIndex = index;
                });
              },
              children: const [
                MoviePage(),
                TicketPage(),
                WalletPage(),
                SettingPage(),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(
                bottom: 24, right: defaultRadius, left: defaultRadius),
            child: Align(
                alignment: Alignment.bottomCenter,
                child: CustomBottomNavbar(
                  selectedIndex: selectedIndex,
                  onTap: (index) {
                    this.setState(() {
                      selectedIndex = index;
                    });
                    pageController.jumpToPage(selectedIndex);
                  },
                )),
          )
        ],
      ),
    );
  }
}
