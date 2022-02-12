part of 'ticket_cubit.dart';

abstract class TicketState extends Equatable {
  const TicketState();

  @override
  List<Object> get props => [];
}

class TicketInitial extends TicketState {}

class TicketLoading extends TicketState {}

class TicketSucces extends TicketState {
  final List<TicketModel> tickets;

  const TicketSucces(this.tickets);

  @override
  List<Object> get props => [tickets];
}

class TicketFailed extends TicketState {
  final String error;

  const TicketFailed(this.error);

  @override
  List<Object> get props => [error];
}
