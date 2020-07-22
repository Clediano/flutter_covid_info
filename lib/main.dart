import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_covid_info/constant.dart';
import 'package:flutter_covid_info/widgets/counter.dart';
import 'package:flutter_covid_info/widgets/header.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Covid 19',
      theme: ThemeData(
        scaffoldBackgroundColor: kBackgrounColor,
        fontFamily: "Poppins",
        textTheme: TextTheme(
          bodyText1: TextStyle(color: kBodyTextColor),
        ),
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Header(
              image: "assets/icons/drcorona.svg",
              text: "Tudo o que você\nprecisa fazer\né ficar em casa.",
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              margin: EdgeInsets.symmetric(horizontal: 20),
              height: 60,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(29),
                border: Border.all(
                  color: Color(0xFFE5E5E5),
                ),
              ),
              child: Row(
                children: <Widget>[
                  Icon(Icons.location_on, color: kPrimaryColor),
                  SizedBox(width: 15),
                  Expanded(
                    child: DropdownButton(
                      isExpanded: true,
                      underline: SizedBox(),
                      icon:
                          Icon(Icons.keyboard_arrow_down, color: kPrimaryColor),
                      value: "Brasil",
                      items: ["Indonésia", "Brasil", "Estados Unidos", "China"]
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          child: Text(value),
                          value: value,
                        );
                      }).toList(),
                      onChanged: (value) {},
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "Casos atualizados\n",
                              style: kTitleTextStyle,
                            ),
                            TextSpan(
                              text: "Última atualização em 18 de Julho",
                              style: TextStyle(color: kTextLightColor),
                            ),
                          ],
                        ),
                      ),
                      Spacer(),
                      Text(
                        "Ver detalhes",
                        style: TextStyle(
                          color: kPrimaryColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Container(
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(0, 4),
                          blurRadius: 30,
                          color: kShadowColor,
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Counter(
                          color: kInfectedColor,
                          number: 1046,
                          title: "Infectados",
                        ),
                        Counter(
                          color: kDeathColor,
                          number: 87,
                          title: "Mortos",
                        ),
                        Counter(
                          color: kRecoverColor,
                          number: 46,
                          title: "Recuperados",
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Propagação do vírus",
                        style: kTitleTextStyle,
                      ),
                      Text(
                        "Ver detalhes",
                        style: TextStyle(
                          color: kPrimaryColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    padding: EdgeInsets.all(20),
                    height: 178,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            offset: Offset(0, 10),
                            blurRadius: 30,
                            color: kShadowColor),
                      ],
                    ),
                    child: Image.asset(
                      "assets/images/map.png",
                      fit: BoxFit.contain,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
