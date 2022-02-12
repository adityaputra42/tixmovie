part of 'pages.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({
    Key? key,
  }) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController retypePasswordController =
      TextEditingController();

  @override
  void initState() {
    super.initState();
    // _picker = ImagePicker();
    // imagePick = widget.registrationData!.profilePicture!;
  }

  // void getImage() async {
  //   final XFile? image = await _picker.pickImage(source: ImageSource.gallery);

  //   setState(() {
  //     if (image != null) {
  //       imagePick = File(image.path);
  //     } else {
  //       print('No image selected.');
  //     }
  //   });
  // }

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
              Container(
                margin: const EdgeInsets.only(top: 20, bottom: 20),
                height: 56,
                child: Row(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: GestureDetector(
                        onTap: () {},
                        child: Icon(Icons.arrow_back_ios_outlined,
                            color: whiteColor),
                      ),
                    ),
                    Center(
                      child: Container(
                        margin: const EdgeInsets.only(left: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Sign Up',
                              style: whiteTextStyle.copyWith(
                                  fontSize: 20, fontWeight: medium),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              'Show your pernsonal',
                              style: greyTextStyle.copyWith(fontWeight: light),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
                margin: const EdgeInsets.only(top: 30, bottom: 40),
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: secondBgColor,
                    boxShadow: const [
                      BoxShadow(
                          spreadRadius: 2, blurRadius: 2, color: Colors.black12)
                    ]),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Container(
                        margin: const EdgeInsets.only(bottom: 16),
                        width: 90,
                        height: 90,
                        child: Stack(
                          children: [
                            Container(
                              width: 90,
                              height: 90,
                              padding: const EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border:
                                      Border.all(color: mainColor, width: 1)),
                              child: Container(
                                decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                      image: AssetImage(
                                          'assets/profile_picture.png'),
                                      fit: BoxFit.cover,
                                    )),
                              ),
                            ),
                            Align(
                              alignment: Alignment.bottomRight,
                              child: GestureDetector(
                                onTap: () {
                                  // getImage();
                                },
                                child: Container(
                                  margin: const EdgeInsets.only(
                                    right: 5,
                                  ),
                                  width: 24,
                                  height: 24,
                                  decoration: const BoxDecoration(
                                      image: DecorationImage(image: AssetImage(
                                          // (widget
                                          //           .registrationData!
                                          //           .profilePicture ==
                                          //       null)
                                          'assets/button_add.png'))),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    InputText(
                        obscureText: false,
                        title: 'Full Name',
                        hintText: 'Your full name',
                        controller: nameController),
                    InputText(
                        obscureText: false,
                        title: 'Email address',
                        hintText: 'Your email address',
                        controller: emailController),
                    InputText(
                        obscureText: true,
                        title: 'Password',
                        hintText: 'Your password',
                        controller: passwordController),
                    InputText(
                        obscureText: true,
                        title: 'Confirm Password',
                        hintText: 'Confirm your password',
                        controller: retypePasswordController),
                    CustomButton(
                      onPressed: () {
                        if (!(nameController.text.trim() != "" &&
                            emailController.text.trim() != "" &&
                            passwordController.text.trim() != "" &&
                            retypePasswordController.text.trim() != "")) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              dismissDirection: DismissDirection.up,
                              backgroundColor: greenColor,
                              content: Text(
                                'please fill all the fields',
                                style: whiteTextStyle,
                              ),
                            ),
                          );
                        } else if (passwordController.text !=
                            retypePasswordController.text) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              dismissDirection: DismissDirection.up,
                              backgroundColor: greenColor,
                              content: Text(
                                'Mismatch password and confirmed password',
                                style: whiteTextStyle,
                              ),
                            ),
                          );
                        } else if (passwordController.text.length < 6) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              dismissDirection: DismissDirection.up,
                              backgroundColor: greenColor,
                              content: Text(
                                'Password length min 6 characters',
                                style: whiteTextStyle,
                              ),
                            ),
                          );
                        } else if (!EmailValidator.validate(
                            emailController.text)) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              dismissDirection: DismissDirection.up,
                              backgroundColor: greenColor,
                              content: Text(
                                'Wrong formatted email address',
                                style: whiteTextStyle,
                              ),
                            ),
                          );
                        } else {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => PreferencePage(
                                        registrationData: RegistrationData(
                                          name: nameController.text,
                                          email: emailController.text,
                                          password: passwordController.text,
                                        ),
                                      )));
                        }
                      },
                      title: 'Continue',
                      margin: const EdgeInsets.only(top: 10),
                    )
                  ],
                ),
              ),
            ],
          )),
        ],
      ),
    );
  }
}
