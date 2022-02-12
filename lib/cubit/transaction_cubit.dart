import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tix_movie/model/model.dart';
import 'package:tix_movie/services/services.dart';

part 'transaction_state.dart';

class TransactionCubit extends Cubit<TransactionState> {
  TransactionCubit() : super(TransactionInitial());

  void saveTransaction(TransactionModel transaction) async {
    try {
      emit(TransactionLoading());
      await TransactionService().saveTransaction(transaction);

      emit(const TransactionSucces([]));
    } catch (e) {
      emit(TransactionFailed(e.toString()));
    }
  }

  void getTransaction() async {
    try {
      emit(TransactionLoading());
      List<TransactionModel> transactions =
          await TransactionService().getTransaction();
      emit(TransactionSucces(transactions));
    } catch (e) {
      emit(TransactionFailed(e.toString()));
    }
  }
}
