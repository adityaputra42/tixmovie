part of 'shared.dart';

Color mainColor = '80e613'.toColor();
Color backgroundColor = '19181D'.toColor();
Color secondBgColor = '2b2b31'.toColor();
Color whiteColor = 'FFFFFF'.toColor();
Color greyColor = '8D8F9C'.toColor();
Color blackColor = '020202'.toColor();
Color bgInputColor = '3c3c43'.toColor();
Color darkGrey = '5D5D64'.toColor();
Color greenColor = '0EC3AE'.toColor();
Color yellowColor = 'FCAE16'.toColor();
Color inaktifColor = '9496C1'.toColor();
Color redColor = 'EB70A5'.toColor();

// TextStyle Pallete
TextStyle blacTextStyle = GoogleFonts.poppins(color: blackColor);

TextStyle whiteTextStyle = GoogleFonts.poppins(color: whiteColor);

TextStyle greyTextStyle = GoogleFonts.poppins(color: greyColor);

TextStyle greenTextStyle = GoogleFonts.poppins(color: greenColor);

// TextStyle redTextStyle = GoogleFonts.poppins(color: redColor);

TextStyle yellowTextStyle = GoogleFonts.poppins(color: mainColor);

//  FontWeight Palllete
FontWeight light = FontWeight.w300;
FontWeight regular = FontWeight.w400;
FontWeight medium = FontWeight.w500;
FontWeight semiBold = FontWeight.w600;
FontWeight bold = FontWeight.w700;
FontWeight extraBold = FontWeight.w800;

double defaultMargin = 24.0;
double defaultRadius = 17.0;

Widget loadingIndicator = SpinKitFadingCircle(
  size: 45,
  color: mainColor,
);
