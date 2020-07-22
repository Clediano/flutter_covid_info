import 'package:flutter/material.dart';
import 'package:flutter_covid_info/constant.dart';
import 'package:flutter_covid_info/widgets/header.dart';

class InfoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Header(
              image: "assets/icons/coronadr.svg",
              text: "Conheça tudo\n sobre Covid-19",
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Sintomas",
                    style: kTitleTextStyle,
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      SymptomCard(
                        image: "assets/images/light_fever.gif",
                        title: "Febre",
                        isActive: true,
                      ),
                      SymptomCard(
                        image: "assets/images/light_cough.gif",
                        title: "Tosse seca",
                      ),
                      SymptomCard(
                        image: "assets/images/light_tiredness.gif",
                        title: "Cansaço",
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Text(
                    "Prevenção",
                    style: kTitleTextStyle,
                  ),
                  SizedBox(height: 20),
                  PreventCard(
                    image: "assets/images/wear_mask.png",
                    title: "Use máscara",
                    text:
                        "Desde o início do surto de coronavírus, alguns lugares adotaram o uso de máscaras faciais presando a segurança social.",
                  ),
                  PreventCard(
                    image: "assets/images/wash_hands.png",
                    title: "Lave as mãos",
                    text:
                        "Essas doenças incluem infecções gastrointestinais, como Salmonella, e infecções respiratórias, como Influenza.",
                  ),
                  SizedBox(height: 20),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class PreventCard extends StatelessWidget {
  final String image;
  final String title;
  final String text;
  const PreventCard({
    Key key,
    this.image = "",
    this.title = "",
    this.text = "",
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: SizedBox(
        height: 156,
        child: Stack(
          alignment: Alignment.centerLeft,
          children: <Widget>[
            Container(
              height: 150,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 8),
                    blurRadius: 24,
                    color: kShadowColor,
                  )
                ],
              ),
            ),
            Image.asset(image),
            Positioned(
              left: 140,
              width: MediaQuery.of(context).size.width - 180,
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 5,
                ),
                height: 150,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      title,
                      style: kTitleTextStyle.copyWith(fontSize: 16),
                    ),
                    Text(
                      text,
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: Icon(
                        Icons.chevron_right,
                        color: kPrimaryColor,
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class SymptomCard extends StatelessWidget {
  final String image;
  final String title;
  final bool isActive;

  const SymptomCard({
    Key key,
    this.image,
    this.title,
    this.isActive = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
        boxShadow: [
          isActive
              ? BoxShadow(
                  offset: Offset(0, 10),
                  blurRadius: 20,
                  color: kActiveShadowColor,
                )
              : BoxShadow(
                  offset: Offset(0, 3),
                  blurRadius: 6,
                  color: kShadowColor,
                ),
        ],
      ),
      child: Column(
        children: <Widget>[
          Image.asset(
            image,
            height: 95,
            width: 90,
          ),
          Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
    );
  }
}
