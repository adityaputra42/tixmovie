// ignore_for_file: unnecessary_null_comparison

part of 'widget.dart';

class CreditCard extends StatelessWidget {
  final Credit credit;
  const CreditCard(this.credit, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          height: 70,
          width: 70,
          decoration: BoxDecoration(
              color: Colors.blueGrey[100],
              shape: BoxShape.circle,
              image: (credit.profilePath == null)
                  ? null
                  : DecorationImage(
                      image: NetworkImage(
                          imageBaseURL + "w185" + credit.profilePath),
                      fit: BoxFit.cover)),
        ),
        Container(
          margin: const EdgeInsets.only(top: 5),
          width: 70,
          child: Text(
            credit.name,
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.clip,
            style: whiteTextStyle.copyWith(fontSize: 10, fontWeight: medium),
          ),
        ),
      ],
    );
  }
}
