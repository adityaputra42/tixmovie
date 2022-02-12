part of 'widget.dart';

class BalanceCard extends StatelessWidget {
  const BalanceCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        if (state is AuthSucces) {
          return Container(
            width: double.infinity,
            height: 210,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                gradient: LinearGradient(
                  colors: [bgInputColor, greyColor],
                ),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(0.25),
                      offset: const Offset(2, 4),
                      blurRadius: 3)
                ]),
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.more_horiz,
                          color: whiteColor,
                          size: 30,
                        )),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '**** **** **** ' +
                              state.user.id.substring(0, 4).toUpperCase(),
                          style: whiteTextStyle.copyWith(fontSize: 18),
                        ),
                        Container(
                          width: 58,
                          height: 58,
                          decoration: const BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage('assets/mastercard.png'))),
                        )
                      ],
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          NumberFormat.currency(
                                  locale: 'ID_id',
                                  decimalDigits: 0,
                                  symbol: 'IDR ')
                              .format(state.user.balance),
                          style: whiteTextStyle.copyWith(
                              fontSize: 22, fontWeight: bold),
                        ),
                        Text(
                          'Balance',
                          style: whiteTextStyle.copyWith(fontWeight: light),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
