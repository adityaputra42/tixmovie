part of 'model.dart';

class Theater extends Equatable {
  final String name;

  const Theater(this.name);
  @override
  List<Object> get props => [name];
}

List<Theater> dummyTheaters = [
  const Theater("CGV Cibinong City Mall"),
  const Theater("XXI Mall Cijantung"),
  const Theater("CGV Grand Depok City")
];
