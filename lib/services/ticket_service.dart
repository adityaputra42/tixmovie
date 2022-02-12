part of 'services.dart';

class TicketService {
  static CollectionReference ticketCollection =
      FirebaseFirestore.instance.collection('tickets');

  Future<void> saveTicket(String userID, TicketModel ticket) async {
    try {
      ticketCollection.add({
        'movieID': ticket.movieDetail.id,
        'userID': userID,
        'theaterName': ticket.theater.name,
        'time': ticket.time.millisecondsSinceEpoch,
        'bookingCode': ticket.bookingCode,
        'seats': ticket.seatInString,
        'name': ticket.name,
        'totalPrice': ticket.totalPrice
      });
    } catch (e) {
      rethrow;
    }
  }

  Future<List<TicketModel>> getTickets(String userID) async {
    try {
      QuerySnapshot result = await ticketCollection.get();
      var documents =
          result.docs.where((document) => document['userID'] == userID);

      List<TicketModel> tickets = [];
      for (var document in documents) {
        MovieDetail movieDetail =
            await MovieServices.getDetails(null, movieID: document['movieID']);
        tickets.add(TicketModel(
          movieDetail: movieDetail,
          theater: Theater(document["theaterName"]),
          seats: document['seats'].toString().split(' , '),
          time: DateTime.fromMillisecondsSinceEpoch(document['time']),
          bookingCode: document['bookingCode'],
          name: document['name'],
          totalPrice: document['totalPrice'],
        ));
      }
      return tickets;
    } catch (e) {
      rethrow;
    }
  }
}
