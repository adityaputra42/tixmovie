part of 'model.dart';

class TicketModel extends Equatable {
  final MovieDetail movieDetail;
  final Theater theater;
  final DateTime time;
  final String bookingCode;
  final List<String> seats;
  final String name;
  final int totalPrice;

  const TicketModel(
      {required this.movieDetail,
      required this.theater,
      required this.time,
      this.bookingCode = '',
      this.seats = const [],
      this.name = '',
      this.totalPrice = 0});

  TicketModel copyWith(
          {MovieDetail? movieDetail,
          Theater? theater,
          DateTime? time,
          String? userID,
          String? bookingCode,
          List<String>? seats,
          String? name,
          int? totalPrice}) =>
      TicketModel(
        movieDetail: movieDetail ?? this.movieDetail,
        theater: theater ?? this.theater,
        time: time ?? this.time,
        bookingCode: bookingCode ?? this.bookingCode,
        seats: seats ?? this.seats,
        name: name ?? this.name,
        totalPrice: totalPrice ?? this.totalPrice,
      );

  String get seatInString {
    String s = '';

    for (var seat in seats) {
      s += seat + ((seat != seats.last) ? ', ' : '');
    }
    return s;
  }

  @override
  List<Object> get props =>
      [movieDetail, theater, time, bookingCode, seats, name, totalPrice];
}
