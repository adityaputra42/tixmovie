part of 'model.dart';

class Promo extends Equatable {
  final String title;
  final String subtitle;
  final int discount;
  const Promo(
      {required this.title, required this.subtitle, required this.discount});

  @override
  List<Object> get props => [title, subtitle, discount];
}

List<Promo> dummyPromos = [
  const Promo(
      title: "Student Holiday ",
      discount: 50,
      subtitle: "Maximal only for two people"),
  const Promo(
      title: "Family CLub", discount: 70, subtitle: "Maximal for three mebers"),
  const Promo(
      title: "Subcripstion Promo", discount: 40, subtitle: "Min One Year"),
];
