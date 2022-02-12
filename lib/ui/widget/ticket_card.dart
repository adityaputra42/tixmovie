part of 'widget.dart';

class Ticketcard extends StatelessWidget {
  final TicketModel ticket;
  const Ticketcard(this.ticket, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 100,
      padding: const EdgeInsets.all(5),
      margin:
          EdgeInsets.only(right: defaultMargin, left: defaultMargin, bottom: 8),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: bgInputColor.withOpacity(0.6),
          boxShadow: const [
            BoxShadow(color: Colors.black12, spreadRadius: 2, blurRadius: 3)
          ]),
      child: Row(
        children: [
          Container(
            height: 90,
            width: 80,
            margin: const EdgeInsets.only(right: 12),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                    image: NetworkImage(imageBaseURL +
                        'w500' +
                        ticket.movieDetail.backdropPath),
                    fit: BoxFit.cover)),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width - 150,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  ticket.movieDetail.title,
                  style:
                      whiteTextStyle.copyWith(fontSize: 18, fontWeight: medium),
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(
                  height: 3,
                ),
                Text(
                  ticket.movieDetail.genresAndLanguage,
                  style: greyTextStyle,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(
                  height: 3,
                ),
                Text(
                  ticket.theater.name,
                  style: greyTextStyle.copyWith(fontWeight: light),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
