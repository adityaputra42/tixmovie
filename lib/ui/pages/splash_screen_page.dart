part of 'pages.dart';

class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({Key? key}) : super(key: key);

  @override
  State<SplashScreenPage> createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  @override
  void initState() {
    Timer(const Duration(seconds: 3), () {
      User? user = FirebaseAuth.instance.currentUser;

      if (user == null) {
        Navigator.pushNamedAndRemoveUntil(
            context, '/sign-in', (route) => false);
      } else {
        context.read<AuthCubit>().getCurrentUser(user.uid);
        Navigator.pushNamedAndRemoveUntil(context, '/main', (route) => false);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: backgroundColor,
        body: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/bg_ss.png'),
                      fit: BoxFit.cover)),
            ),
            SafeArea(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 125,
                      height: 72,
                      margin: const EdgeInsets.only(bottom: 30),
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/logo_green.png'),
                              fit: BoxFit.cover)),
                    ),
                    Text('Tix Movie',
                        style: whiteTextStyle.copyWith(
                            color: mainColor,
                            fontWeight: semiBold,
                            fontSize: 32,
                            letterSpacing: 5))
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
