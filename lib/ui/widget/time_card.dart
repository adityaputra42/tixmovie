part of 'widget.dart';

class TimeCard extends StatelessWidget {
  final bool isSelected;
  final bool isEnable;
  final double width;
  final double height;
  final String text;
  final Function() onTap;

  const TimeCard(
    this.text, {
    Key? key,
    this.isSelected = false,
    this.isEnable = true,
    this.width = 80,
    this.height = 45,
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
          borderRadius: BorderRadius.circular(8),
          color: (!isEnable)
              ? darkGrey
              : isSelected
                  ? mainColor
                  : bgInputColor,
        ),
        child: Center(
          child: Text(
            text,
            style: (!isEnable)
                ? greyTextStyle.copyWith(fontSize: 16, fontWeight: medium)
                : isSelected
                    ? blacTextStyle.copyWith(fontSize: 16, fontWeight: medium)
                    : whiteTextStyle.copyWith(fontSize: 16, fontWeight: medium),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
