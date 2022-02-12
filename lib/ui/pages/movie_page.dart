// ignore_for_file: prefer_const_constructors

part of 'pages.dart';

class MoviePage extends StatefulWidget {
  const MoviePage({Key? key}) : super(key: key);

  @override
  State<MoviePage> createState() => _MoviePageState();
}

class _MoviePageState extends State<MoviePage> {
  final CarouselController _carouselController = CarouselController();

  int selectedIndex = 0;
  int selectedGenre = 0;
  @override
  void initState() {
    super.initState();
    context.read<MovieCubit>().getMovie();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: BlocBuilder<MovieCubit, MovieState>(
        builder: (context, state) {
          if (state is MovieLoadedSucces) {
            return Stack(
              children: [
                const BackgroundComon(),
                SafeArea(
                  child: ListView(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          BlocBuilder<AuthCubit, AuthState>(
                            builder: (context, userState) {
                              if (userState is AuthSucces) {
                                return Container(
                                  margin: const EdgeInsets.only(top: 30),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: defaultMargin),
                                  width: double.infinity,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Hallo, ${userState.user.name}',
                                            style: whiteTextStyle.copyWith(
                                                fontSize: 20,
                                                fontWeight: medium),
                                          ),
                                          const SizedBox(
                                            height: 3,
                                          ),
                                          Text(
                                            "Let's start watch a movie",
                                            style: greyTextStyle.copyWith(
                                                fontWeight: light,
                                                fontSize: 16),
                                          ),
                                        ],
                                      ),
                                      Container(
                                        width: 60,
                                        height: 60,
                                        padding: const EdgeInsets.all(5),
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: mainColor, width: 1),
                                            shape: BoxShape.circle),
                                        child: Container(
                                          width: 50,
                                          height: 50,
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              image: DecorationImage(
                                                  image: AssetImage(
                                                      'assets/me.jpg'),
                                                  fit: BoxFit.cover)),
                                        ),
                                      )
                                    ],
                                  ),
                                );
                              } else {
                                return Center(
                                  child: loadingIndicator,
                                );
                              }
                            },
                          ),
                          Container(
                            width: double.infinity,
                            height: 45,
                            margin: EdgeInsets.only(
                                top: 30,
                                right: defaultMargin,
                                left: defaultMargin),
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            decoration: BoxDecoration(
                              color: bgInputColor,
                              borderRadius:
                                  BorderRadius.circular(defaultRadius),
                            ),
                            child: TextField(
                              cursorColor: whiteColor,
                              style: whiteTextStyle,
                              decoration: InputDecoration(
                                  icon: Icon(
                                    Icons.search,
                                    color: greyColor,
                                  ),
                                  focusColor: Colors.white,
                                  hintText: 'Search',
                                  hintStyle: greyTextStyle,
                                  border: InputBorder.none),
                            ),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: defaultMargin),
                            child: Text(
                              'Categories',
                              style: whiteTextStyle.copyWith(
                                  fontSize: 18, fontWeight: medium),
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          BlocBuilder<AuthCubit, AuthState>(
                            builder: (context, state) {
                              if (state is AuthSucces) {
                                return SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: CustomTabBar(
                                      selectedIndex: selectedGenre,
                                      title: state.user.selectedGenres,
                                      ontap: (index) {
                                        this.setState(() {
                                          selectedGenre = index;
                                        });
                                      }),
                                );
                              } else {
                                return Center(
                                  child: loadingIndicator,
                                );
                              }
                            },
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: defaultMargin),
                            child: Text(
                              'Now Playing',
                              style: whiteTextStyle.copyWith(
                                  fontSize: 18, fontWeight: medium),
                            ),
                          ),
                          Container(
                              margin: const EdgeInsets.only(
                                top: 12,
                              ),
                              height: 360,
                              width: MediaQuery.of(context).size.width,
                              child: CarouselSlider(
                                items: state.movies
                                    .map((e) => GestureDetector(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      DetailMoviePage(e)));
                                        },
                                        child: MovieCard(e)))
                                    .toList(),
                                options: CarouselOptions(
                                  height: 380.0,
                                  viewportFraction: 0.65,
                                  enlargeCenterPage: true,
                                  onPageChanged: (index, reason) {
                                    this.setState(() {
                                      selectedIndex = index;
                                    });
                                  },
                                ),
                                carouselController: _carouselController,
                              )),
                          const SizedBox(
                            height: 95,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            );
          }
          return Center(
            child: loadingIndicator,
          );
        },
      ),
    );
  }
}
