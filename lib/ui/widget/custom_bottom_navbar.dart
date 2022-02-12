part of 'widget.dart';

class CustomBottomNavbar extends StatelessWidget {
  final int? selectedIndex;
  final Function(int index)? onTap;
  const CustomBottomNavbar({Key? key, this.selectedIndex, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 60,
      decoration: BoxDecoration(
          color: secondBgColor,
          boxShadow: const [
            BoxShadow(spreadRadius: 3, blurRadius: 5, color: Colors.black12)
          ],
          borderRadius: BorderRadius.circular(defaultMargin)),
      child: Row(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () {
                if (onTap != null) {
                  onTap!(0);
                }
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                      height: 22,
                      width: 22,
                      child: Icon(
                        Icons.home,
                        color: (selectedIndex == 0) ? mainColor : greyColor,
                        size: 20,
                      )),
                  Container(
                      margin: const EdgeInsets.only(top: 1),
                      child: Text(
                        "Home",
                        style: greyTextStyle.copyWith(
                          fontSize: 12,
                          fontWeight: selectedIndex == 0 ? semiBold : light,
                          color: (selectedIndex == 0 ? mainColor : greyColor),
                        ),
                      ))
                ],
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () {
                if (onTap != null) {
                  onTap!(1);
                }
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                      height: 22,
                      width: 22,
                      child: Icon(
                        Icons.movie,
                        color: (selectedIndex == 1) ? mainColor : greyColor,
                        size: 20,
                      )),
                  Container(
                      margin: const EdgeInsets.only(top: 1),
                      child: Text(
                        "My Ticket",
                        style: greyTextStyle.copyWith(
                          fontSize: 12,
                          fontWeight: selectedIndex == 1 ? semiBold : light,
                          color: (selectedIndex == 1 ? mainColor : greyColor),
                        ),
                      ))
                ],
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () {
                if (onTap != null) {
                  onTap!(2);
                }
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                      height: 22,
                      width: 22,
                      child: Icon(
                        Icons.account_balance_wallet_rounded,
                        color: (selectedIndex == 2) ? mainColor : greyColor,
                        size: 20,
                      )),
                  Container(
                      margin: const EdgeInsets.only(top: 1),
                      child: Text(
                        "My wallet",
                        style: greyTextStyle.copyWith(
                          fontSize: 12,
                          fontWeight: selectedIndex == 2 ? semiBold : light,
                          color: (selectedIndex == 2 ? mainColor : greyColor),
                        ),
                      ))
                ],
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () {
                if (onTap != null) {
                  onTap!(3);
                }
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                      height: 22,
                      width: 22,
                      child: Icon(
                        Icons.settings,
                        color: (selectedIndex == 3) ? mainColor : greyColor,
                        size: 20,
                      )),
                  Container(
                      margin: const EdgeInsets.only(top: 1),
                      child: Text(
                        "Setting",
                        style: greyTextStyle.copyWith(
                          fontSize: 12,
                          fontWeight: selectedIndex == 3 ? semiBold : light,
                          color: (selectedIndex == 3 ? mainColor : greyColor),
                        ),
                      ))
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}


// Icons.account_balance_wallet_rounded,