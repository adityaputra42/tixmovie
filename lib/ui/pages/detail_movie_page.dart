part of 'pages.dart';

class DetailMoviePage extends StatelessWidget {
  final Movie movie;
  const DetailMoviePage(this.movie, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MovieDetail? movieDetail;
    List<Credit> credits;
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Stack(
        children: [
          const BackgroundComon(),
          SafeArea(
            child: FutureBuilder(
              future: MovieServices.getDetails(movie),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  movieDetail = snapshot.data as MovieDetail?;
                }
                return ListView(
                  children: [
                    // Image movie
                    Container(
                      width: double.infinity,
                      height: 300,
                      decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                            bottomRight: Radius.circular(24),
                          ),
                          image: DecorationImage(
                              image: NetworkImage(
                                  imageBaseURL + "w780" + movie.backdropPath),
                              fit: BoxFit.cover)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin:
                                EdgeInsets.only(top: 30, left: defaultMargin),
                            width: 28,
                            height: 28,
                            decoration: BoxDecoration(
                                color: whiteColor.withOpacity(0.3),
                                borderRadius: BorderRadius.circular(6)),
                            child: Icon(
                              Icons.arrow_back_ios_new_rounded,
                              color: whiteColor,
                            ),
                          ),
                          Container(
                            width: double.infinity,
                            height: 100,
                            decoration: BoxDecoration(
                                borderRadius: const BorderRadius.only(
                                  bottomRight: Radius.circular(24),
                                ),
                                gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                      blackColor.withOpacity(0),
                                      blackColor.withOpacity(0.9)
                                    ])),
                            child: Container(
                                padding: EdgeInsets.fromLTRB(
                                    defaultMargin, 30, 0, 16),
                                width: double.infinity,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            movie.title,
                                            style: whiteTextStyle.copyWith(
                                                fontWeight: semiBold,
                                                fontSize: 20),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          const SizedBox(
                                            height: 2,
                                          ),
                                          (snapshot.hasData)
                                              ? Text(
                                                  movieDetail!
                                                      .genresAndLanguage,
                                                  style: greyTextStyle.copyWith(
                                                      fontWeight: light),
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                )
                                              : SizedBox(
                                                  height: 20,
                                                  width: 20,
                                                  child: loadingIndicator,
                                                ),
                                          // const SizedBox(
                                          //   height: 6,
                                          // ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 15,
                                    ),
                                    Container(
                                      padding: const EdgeInsets.fromLTRB(
                                          6, 8, 16, 8),
                                      decoration: BoxDecoration(
                                          color: whiteColor.withOpacity(0.25),
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(12),
                                            bottomLeft: Radius.circular(5),
                                            bottomRight: Radius.circular(12),
                                          )),
                                      child: RatingStar(
                                        voteAverage: movie.voteAverage,
                                        star: 1,
                                        starSize: 25,
                                        fontSize: 16,
                                      ),
                                    )
                                  ],
                                )),
                          ),
                        ],
                      ),
                    ),
                    // Story
                    Container(
                        width: double.infinity,
                        margin: const EdgeInsets.only(top: 20),
                        padding:
                            EdgeInsets.symmetric(horizontal: defaultMargin),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'StoryLine',
                              style: whiteTextStyle.copyWith(
                                  fontWeight: medium, fontSize: 18),
                            ),
                            const SizedBox(
                              height: 12,
                            ),
                            Text(
                              movie.overview,
                              style: whiteTextStyle.copyWith(
                                  height: 2, fontWeight: light),
                              textAlign: TextAlign.justify,
                            )
                          ],
                        )),
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(horizontal: defaultMargin),
                      margin: const EdgeInsets.only(top: 30),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Crew & Cast',
                            style: whiteTextStyle.copyWith(
                                fontWeight: medium, fontSize: 18),
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          FutureBuilder(
                              future: MovieServices.getCredits(movie.id),
                              builder: (_, snapshot) {
                                if (snapshot.hasData) {
                                  credits = snapshot.data as List<Credit>;
                                  return SizedBox(
                                    height: 115,
                                    child: ListView.builder(
                                        scrollDirection: Axis.horizontal,
                                        itemCount: credits.length,
                                        itemBuilder: (_, index) => Container(
                                            margin: EdgeInsets.only(
                                                right: (index ==
                                                        credits.length - 1)
                                                    ? 0
                                                    : 16),
                                            child: CreditCard(credits[index]))),
                                  );
                                } else {
                                  return Center(
                                    child: loadingIndicator,
                                  );
                                }
                              }),
                        ],
                      ),
                    ),

                    CustomButton(
                        title: 'Reservation Now',
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SchedulePage(movieDetail!),
                            ),
                          );
                        },
                        margin: EdgeInsets.fromLTRB(
                            defaultMargin, 30, defaultMargin, 45))
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
