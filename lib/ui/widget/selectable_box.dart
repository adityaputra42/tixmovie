part of 'widget.dart';

class SelectableBox extends StatelessWidget {
  final bool isSelected;
  final bool isEnable;
  final double width;
  final double height;
  final String text;
  final double radius;
  final Function() onTap;
  final double fontsize;

  const SelectableBox(
      {Key? key,
      this.radius = 6,
      required this.text,
      this.isSelected = false,
      this.isEnable = true,
      this.width = 144,
      this.height = 60,
      required this.onTap,
      this.fontsize = 14})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius),
          color: (!isEnable)
              ? (darkGrey)
              : isSelected
                  ? mainColor
                  : bgInputColor,
        ),
        child: Center(
            child: (isEnable)
                ? Text((text),
                    style: (isSelected)
                        ? blacTextStyle.copyWith(
                            fontWeight: medium, fontSize: fontsize)
                        : greyTextStyle.copyWith(
                            fontWeight: medium, fontSize: fontsize))
                : const SizedBox()),
      ),
    );
  }
}
