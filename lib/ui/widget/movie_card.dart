part of 'widget.dart';

class MovieCard extends StatelessWidget {
  final Movie movie;
  const MovieCard(this.movie, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 3, vertical: 5),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        boxShadow: const [
          BoxShadow(
            blurRadius: 3,
            spreadRadius: 3,
            color: Colors.black12,
          )
        ],
        borderRadius: BorderRadius.circular(defaultRadius),
        image: DecorationImage(
            image: NetworkImage(imageBaseURL + "w780" + movie.backdropPath),
            fit: BoxFit.cover),
      ),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height / 8,
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(16),
                  bottomRight: Radius.circular(16)),
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    blackColor.withOpacity(0),
                    blackColor.withOpacity(0.9)
                  ])),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: double.infinity,
              height: 65,
              margin: const EdgeInsets.only(bottom: 15, right: 10, left: 10),
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        bgInputColor.withOpacity(0.5),
                        darkGrey.withOpacity(0.4)
                      ])),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      movie.title,
                      style: whiteTextStyle.copyWith(
                          fontSize: 16, fontWeight: medium),
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    RatingStar(
                      starSize: 20,
                      voteAverage: movie.voteAverage,
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
