part of 'widget.dart';

class RatingStar extends StatelessWidget {
  final double voteAverage;
  final double starSize;
  final double fontSize;
  final int star;

  final MainAxisAlignment alignment;

  const RatingStar(
      {Key? key,
      this.star = 5,
      this.voteAverage = 0,
      this.starSize = 20,
      this.fontSize = 12,
      this.alignment = MainAxisAlignment.start})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    int n = (voteAverage / 2).round();

    List<Widget> widgets = List.generate(
        star,
        (index) => Icon(
              index < n ? Icons.star_rounded : Icons.star_outline_rounded,
              color: yellowColor,
              size: starSize,
            ));

    widgets.add(const SizedBox(
      width: 3,
    ));
    widgets.add(Text(
      "${(voteAverage / 2).roundToDouble()}",
      style: whiteTextStyle.copyWith(fontSize: fontSize),
    ));

    return Row(
      mainAxisAlignment: alignment,
      children: widgets,
    );
  }
}
