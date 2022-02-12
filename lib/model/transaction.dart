part of 'model.dart';

class TransactionModel extends Equatable {
  final String userID;
  final String title;
  final String subtitle;
  final int amount;
  final DateTime time;
  final String? picture;

  const TransactionModel(
      {required this.userID,
      required this.title,
      required this.subtitle,
      this.amount = 0,
      required this.time,
      this.picture});

  factory TransactionModel.fromJson(String id, Map<String, dynamic> json) =>
      TransactionModel(
          userID: id,
          title: json['title'],
          subtitle: json['subtitle'],
          amount: json['amount'],
          time: DateTime.fromMillisecondsSinceEpoch(json['time']),
          picture: json['picture']);

  @override
  List<Object> get props => [
        userID,
        title,
        subtitle,
        amount,
        time,
      ];
}
