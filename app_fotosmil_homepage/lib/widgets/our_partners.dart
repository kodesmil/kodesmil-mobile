import 'package:flutter/cupertino.dart';
import 'package:lib_lego/spaces.dart';
import 'package:lib_lego/texts.dart';

class OurPartnersWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final width = screenWidth > 600 ? screenWidth * 0.1 : screenWidth * 0.2;
    return Column(
      children: <Widget>[
        KsVerticalSpace.xl(),
        KsText.display2('Our partners'),
        KsVerticalSpace.l(),
        Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: width,
                child: Image.asset(
                  'assets/logo_sprak.png',
                  fit: BoxFit.contain,
                ),
              ),
              KsHorizontalSpace.m(),
              Container(
                width: width,
                child: Image.asset(
                  'assets/logo_ntnu.jpg',
                  fit: BoxFit.contain,
                ),
              ),
              KsHorizontalSpace.m(),
              Container(
                width: width,
                child: Image.asset(
                  'assets/logo_kommune.png',
                  fit: BoxFit.contain,
                ),
              ),
              KsHorizontalSpace.m(),
              Container(
                width: width,
                child: Image.asset(
                  'assets/logo_stammen.png',
                  fit: BoxFit.contain,
                ),
              ),
            ],
          ),
        ),
        KsVerticalSpace.xl(),
      ],
    );
  }
}