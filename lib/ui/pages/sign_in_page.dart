part of 'pages.dart';

class SignInPage extends StatelessWidget {
  SignInPage({Key? key}) : super(key: key);

  final TextEditingController emailControler = TextEditingController();
  final TextEditingController passwordControler = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Stack(
        children: [
          const BackgroundComon(),
          SafeArea(
            child: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin:
                            const EdgeInsets.only(top: 70, bottom: 20, left: 6),
                        height: 46,
                        width: 80,
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('assets/logo_green.png'),
                                fit: BoxFit.cover)),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 6),
                        child: Text(
                          'Welcome Back\nExplorer',
                          style: whiteTextStyle.copyWith(
                              fontSize: 22, fontWeight: FontWeight.w500),
                          // textAlign: TextAlign.center,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 40),
                        margin: const EdgeInsets.only(top: 30, bottom: 40),
                        width: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            color: secondBgColor,
                            boxShadow: const [
                              BoxShadow(
                                  spreadRadius: 2,
                                  blurRadius: 2,
                                  color: Colors.black12)
                            ]),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            InputText(
                                obscureText: false,
                                title: 'Email address',
                                hintText: 'Your email address',
                                controller: emailControler),
                            InputText(
                                obscureText: true,
                                title: 'Password',
                                hintText: 'Your password',
                                controller: passwordControler),
                            BlocConsumer<AuthCubit, AuthState>(
                              listener: (context, state) {
                                if (state is AuthSucces) {
                                  Navigator.pushNamedAndRemoveUntil(
                                      context, '/main', (route) => false);
                                } else if (state is AuthFailed) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      backgroundColor: mainColor,
                                      content: Text(
                                        state.error,
                                        style: whiteTextStyle,
                                      ),
                                    ),
                                  );
                                }
                              },
                              builder: (context, state) {
                                if (state is AuthLoading) {
                                  return Center(
                                    child: loadingIndicator,
                                  );
                                }
                                return CustomButton(
                                    margin: const EdgeInsets.only(top: 10),
                                    title: 'Sign In',
                                    onPressed: () {
                                      context.read<AuthCubit>().signIn(
                                            email: emailControler.text,
                                            password: passwordControler.text,
                                          );
                                    });
                              },
                            ),
                          ],
                        ),
                      ),
                      Center(
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, '/sign-up');
                          },
                          child: Text(
                            'Create New Account',
                            style: GoogleFonts.poppins(
                                color: greyColor, fontSize: 16),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 60,
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
