import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tix_movie/model/model.dart';
import 'package:tix_movie/services/services.dart';

part 'ticket_state.dart';

class TicketCubit extends Cubit<TicketState> {
  TicketCubit() : super(TicketInitial());

  void saveTicket(String id, TicketModel ticket) async {
    try {
      emit(TicketLoading());

      await TicketService().saveTicket(id, ticket);

      emit(const TicketSucces([]));
    } catch (e) {
      emit(TicketFailed(e.toString()));
    }
  }

  void getTicket(String id) async {
    try {
      emit(TicketLoading());
      List<TicketModel> tickets = await TicketService().getTickets(id);

      emit(TicketSucces(tickets));
    } catch (e) {
      emit(TicketFailed(e.toString()));
    }
  }
}
