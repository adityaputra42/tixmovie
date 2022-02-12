part of 'pages.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Stack(
        children: [
          const BackgroundComon(),
          SafeArea(
              child: ListView(
            padding: EdgeInsets.symmetric(horizontal: defaultMargin),
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.only(
                      top: 30,
                    ),
                    width: double.infinity,
                    child: Text(
                      'Setting',
                      style: whiteTextStyle.copyWith(
                          fontWeight: semiBold, fontSize: 18),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 3, bottom: 30),
                    width: double.infinity,
                    child: Text(
                      'Set your personal account here',
                      style: greyTextStyle.copyWith(
                        fontWeight: light,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                ],
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                    color: secondBgColor,
                    boxShadow: const [
                      BoxShadow(
                          blurRadius: 2, spreadRadius: 2, color: Colors.black12)
                    ]),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Container(
                        margin: const EdgeInsets.only(bottom: 20),
                        padding: const EdgeInsets.all(5),
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                            border: Border.all(width: 1, color: mainColor),
                            shape: BoxShape.circle),
                        child: Container(
                          width: 100,
                          height: 100,
                          decoration: const BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage('assets/me.jpg'),
                                  fit: BoxFit.cover),
                              shape: BoxShape.circle),
                        ),
                      ),
                    ),
                    Center(
                      child: Text(
                        'Aditya Putra Pratama',
                        style: whiteTextStyle.copyWith(
                            fontWeight: medium, fontSize: 18),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Center(
                      child: Text(
                        'aditya27@gmail.com',
                        style: greyTextStyle.copyWith(fontWeight: light),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      height: 0.6,
                      color: greyColor,
                      margin: const EdgeInsets.only(top: 10, bottom: 20),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              width: 20,
                              height: 20,
                              margin: const EdgeInsets.only(right: 12),
                              child: Icon(
                                Icons.person,
                                color: mainColor,
                              ),
                            ),
                            Text(
                              'Edit Profile',
                              style: whiteTextStyle.copyWith(
                                  fontWeight: medium, fontSize: 16),
                            ),
                          ],
                        ),
                        Icon(
                          Icons.keyboard_arrow_down,
                          size: 20,
                          color: whiteColor,
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              width: 20,
                              height: 20,
                              margin: const EdgeInsets.only(right: 12),
                              child: Icon(
                                Icons.account_balance_wallet_rounded,
                                color: mainColor,
                              ),
                            ),
                            Text(
                              'Top Up',
                              style: whiteTextStyle.copyWith(
                                  fontWeight: medium, fontSize: 16),
                            ),
                          ],
                        ),
                        Icon(
                          Icons.keyboard_arrow_down,
                          size: 20,
                          color: whiteColor,
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              width: 20,
                              height: 20,
                              margin: const EdgeInsets.only(right: 12),
                              child: Icon(
                                Icons.theater_comedy,
                                color: mainColor,
                              ),
                            ),
                            Text(
                              'Theme',
                              style: whiteTextStyle.copyWith(
                                  fontWeight: medium, fontSize: 16),
                            ),
                          ],
                        ),
                        Icon(
                          Icons.keyboard_arrow_down,
                          size: 20,
                          color: whiteColor,
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              width: 20,
                              height: 20,
                              margin: const EdgeInsets.only(right: 12),
                              child: Icon(
                                Icons.thumb_up,
                                color: mainColor,
                              ),
                            ),
                            Text(
                              'Rate this app',
                              style: whiteTextStyle.copyWith(
                                  fontWeight: medium, fontSize: 16),
                            ),
                          ],
                        ),
                        Icon(
                          Icons.keyboard_arrow_down,
                          size: 20,
                          color: whiteColor,
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              width: 20,
                              height: 20,
                              margin: const EdgeInsets.only(right: 12),
                              child: Icon(
                                Icons.language,
                                color: mainColor,
                              ),
                            ),
                            Text(
                              'Change Language',
                              style: whiteTextStyle.copyWith(
                                  fontWeight: medium, fontSize: 16),
                            ),
                          ],
                        ),
                        Icon(
                          Icons.keyboard_arrow_down,
                          size: 20,
                          color: whiteColor,
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                  ],
                ),
              ),
              BlocConsumer<AuthCubit, AuthState>(
                listener: (context, state) {
                  if (state is AuthFailed) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        backgroundColor: redColor,
                        content: Text(
                          state.error,
                          style: whiteTextStyle,
                        ),
                      ),
                    );
                  } else if (state is AuthInitial) {
                    Navigator.pushNamedAndRemoveUntil(
                        context, '/sign-in', (route) => false);
                  }
                },
                builder: (context, state) {
                  if (state is AuthLoading) {
                    return Center(
                      child: loadingIndicator,
                    );
                  }
                  return CustomButton(
                    title: 'Sign Out',
                    margin: const EdgeInsets.symmetric(vertical: 30),
                    onPressed: () {
                      context.read<AuthCubit>().signOut();
                    },
                    width: 220,
                  );
                },
              ),
              const SizedBox(
                height: 100,
              )
            ],
          )),
        ],
      ),
    );
  }
}
