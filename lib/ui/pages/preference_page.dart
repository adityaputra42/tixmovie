part of 'pages.dart';

class PreferencePage extends StatefulWidget {
  final List<String> genres = [
    "Horor",
    "Music",
    "Action",
    "Drama",
    "War",
    "Crime"
  ];
  final List<String> languages = ["Bahasa", "English", "Japanese", "Korean"];
  final RegistrationData registrationData;
  PreferencePage({Key? key, required this.registrationData}) : super(key: key);

  @override
  State<PreferencePage> createState() => _PreferencePageState();
}

class _PreferencePageState extends State<PreferencePage> {
  List<String> selectedGenres = [];
  String selectedLanguage = "English";

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
                    margin: const EdgeInsets.only(top: 20, bottom: 20),
                    height: 56,
                    child: Stack(
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
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width * 0.5,
                            child: Text(
                              'Set Your Preference',
                              style: whiteTextStyle.copyWith(
                                  fontSize: 20, fontWeight: medium),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: 20),
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 30),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
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
                        Text(
                          "Selelct Your Four\nFavorite Genres",
                          style: whiteTextStyle.copyWith(fontSize: 18),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Wrap(
                          spacing: 16,
                          runSpacing: 16,
                          children: generateGenreWidgets(context),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 30),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
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
                        Text(
                          "Movie Language\nYou Prefer?",
                          style: whiteTextStyle.copyWith(fontSize: 18),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Wrap(
                          spacing: 16,
                          runSpacing: 16,
                          children: generateLangWidgets(context),
                        ),
                      ],
                    ),
                  ),
                  BlocConsumer<AuthCubit, AuthState>(
                    listener: (context, state) {
                      if (state is AuthSucces) {
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const BonusPage()),
                            (route) => false);
                      } else if (state is AuthFailed) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            backgroundColor: greenColor,
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
                          margin: const EdgeInsets.only(top: 30),
                          title: 'Continue',
                          onPressed: () {
                            if (selectedGenres.length != 4) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  dismissDirection: DismissDirection.up,
                                  backgroundColor: greenColor,
                                  content: Text(
                                    'please select 4 genres',
                                    style: whiteTextStyle,
                                  ),
                                ),
                              );
                            } else {
                              context.read<AuthCubit>().signUp(
                                  email: widget.registrationData.email,
                                  password: widget.registrationData.password,
                                  name: widget.registrationData.name,
                                  selectedGenres: selectedGenres,
                                  selectedLanguage: selectedLanguage);
                            }
                          });
                    },
                  ),
                  const SizedBox(
                    height: 50,
                  )
                ],
              )
            ],
          )),
        ],
      ),
    );
  }

  List<Widget> generateGenreWidgets(BuildContext context) {
    double width =
        (MediaQuery.of(context).size.width - 2 * defaultMargin - 56) / 2;

    return widget.genres
        .map((e) => SelectableBox(
              width: width,
              fontsize: 16,
              radius: 12,
              isSelected: selectedGenres.contains(e),
              onTap: () {
                onSelectGenre(e);
              },
              text: e,
            ))
        .toList();
  }

  List<Widget> generateLangWidgets(BuildContext context) {
    double width =
        (MediaQuery.of(context).size.width - 2 * defaultMargin - 56) / 2;

    return widget.languages
        .map((e) => SelectableBox(
              radius: 12,
              width: width,
              isSelected: selectedLanguage == e,
              onTap: () {
                this.setState(() {
                  selectedLanguage = e;
                });
              },
              text: e,
            ))
        .toList();
  }

  void onSelectGenre(String genre) {
    if (selectedGenres.contains(genre)) {
      this.setState(() {
        selectedGenres.remove(genre);
      });
    } else {
      if (selectedGenres.length < 4) {
        this.setState(() {
          selectedGenres.add(genre);
        });
      }
    }
  }
}
