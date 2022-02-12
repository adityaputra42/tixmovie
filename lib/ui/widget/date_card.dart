part of 'widget.dart';

class DateCard extends StatelessWidget {
  final bool isSelected;
  final double width;
  final double height;
  final DateTime date;
  final Function() onTap;

  const DateCard(
    this.date, {
    Key? key,
    this.isSelected = false,
    this.width = 60,
    this.height = 80,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            color: isSelected ? mainColor : bgInputColor,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                date.shortDayName,
                style: isSelected
                    ? blacTextStyle.copyWith(fontSize: 16, fontWeight: medium)
                    : whiteTextStyle.copyWith(fontSize: 16, fontWeight: medium),
              ),
              const SizedBox(
                height: 6,
              ),
              Text(
                date.day.toString(),
                style: isSelected
                    ? blacTextStyle.copyWith(fontSize: 16, fontWeight: medium)
                    : whiteTextStyle.copyWith(fontSize: 16, fontWeight: medium),
              )
            ],
          ),
        ));
  }
}
