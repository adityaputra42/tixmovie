part of 'services.dart';

class TransactionService {
  static CollectionReference transactionCollection =
      FirebaseFirestore.instance.collection('transactions');

  Future<void> saveTransaction(TransactionModel transactionModel) async {
    try {
      transactionCollection.add({
        'userID': transactionModel.userID,
        'title': transactionModel.title,
        'subtitle': transactionModel.subtitle,
        'time': transactionModel.time.millisecondsSinceEpoch,
        'amount': transactionModel.amount,
        'picture': transactionModel.picture
      });
    } catch (e) {
      rethrow;
    }
  }

  Future<List<TransactionModel>> getTransaction() async {
    try {
      QuerySnapshot result = await transactionCollection.get();

      List<TransactionModel> transactions = result.docs.map((e) {
        return TransactionModel.fromJson(
            e.id, e.data() as Map<String, dynamic>);
      }).toList();

      return transactions;
    } catch (e) {
      rethrow;
    }
  }
}
