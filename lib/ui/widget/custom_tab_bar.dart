// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace

part of 'widget.dart';

class CustomTabBar extends StatelessWidget {
  final int selectedIndex;
  final List<String> title;
  final Function(int) ontap;

  const CustomTabBar(
      {Key? key,
      required this.selectedIndex,
      required this.title,
      required this.ontap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 50,
        child: Row(
          children: title
              .map((e) => Padding(
                    padding: EdgeInsets.only(
                        left: (e == title.first ? defaultMargin : 0),
                        right: (e == title.last ? defaultMargin : 12)),
                    child: GestureDetector(
                      onTap: () {
                        ontap(title.indexOf(e));
                      },
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 6, horizontal: 10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(2),
                                bottomLeft: Radius.circular(2),
                                topLeft: Radius.circular(12),
                                bottomRight: Radius.circular(12)),
                            color: (title.indexOf(e) == selectedIndex
                                ? mainColor
                                : secondBgColor),
                            boxShadow: [
                              BoxShadow(
                                  blurRadius: 2,
                                  spreadRadius: 2,
                                  color: (title.indexOf(e) == selectedIndex
                                      ? Colors.black12
                                      : Colors.transparent))
                            ]),
                        child: Text(
                          e,
                          style: (title.indexOf(e) == selectedIndex
                              ? blacTextStyle.copyWith(fontWeight: medium)
                              : greyTextStyle),
                        ),
                      ),
                    ),
                  ))
              .toList(),
        ));
  }
}
