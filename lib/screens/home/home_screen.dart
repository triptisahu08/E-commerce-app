import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shop_app/components/coustom_bottom_nav_bar.dart';
import 'package:shop_app/components/product_card.dart';
import 'package:shop_app/enums.dart';
import 'package:shop_app/models/Product.dart';
import 'package:shop_app/screens/cart/cart_screen.dart';

import '../../size_config.dart';
import 'components/icon_btn_with_counter.dart';
import 'components/search_field.dart';
import 'components/section_title.dart';

class HomeScreen extends StatelessWidget {
  static String routeName = "/home";
  List<Map<String, dynamic>> categories = [
    {"icon": "assets/icons/Flash Icon.svg", "text": "Flash Deal"},
    {"icon": "assets/icons/Bill Icon.svg", "text": "Bill"},
    {"icon": "assets/icons/Game Icon.svg", "text": "Game"},
    {"icon": "assets/icons/Gift Icon.svg", "text": "Daily Gift"},
    {"icon": "assets/icons/Discover.svg", "text": "More"},
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          key: Key('scrollV1'),
          child: Column(
            children: [
              SizedBox(height: getProportionateScreenHeight(20)),
              Padding(
                padding:
                EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SearchField(),
                    IconBtnWithCounter(
                      key: Key('btnCart'),
                      svgSrc: "assets/icons/Cart Icon.svg",
                      press: () => Navigator.pushNamed(context, CartScreen.routeName),
                    ),
                    IconBtnWithCounter(
                      svgSrc: "assets/icons/Bell.svg",
                      numOfitem: 3,
                      press: () {},
                    ),
                  ],
                ),
              ),
              SizedBox(height: getProportionateScreenWidth(10)),
              Container(
                // height: 90,
                width: double.infinity,
                margin: EdgeInsets.all(getProportionateScreenWidth(20)),
                padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(20),
                  vertical: getProportionateScreenWidth(15),
                ),
                decoration: BoxDecoration(
                  color: Color(0xFF4A3298),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text.rich(
                  TextSpan(
                    style: TextStyle(color: Colors.white),
                    children: [
                      TextSpan(text: "A Summer Surpise\n"),
                      TextSpan(
                        text: "Cashback 20%",
                        style: TextStyle(
                          fontSize: getProportionateScreenWidth(24),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(getProportionateScreenWidth(20)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: List.generate(
                    categories.length,
                        (index) => CategoryCard(
                      icon: categories[index]["icon"],
                      text: categories[index]["text"],
                      press: () {},
                    ),
                  ),
                ),
              ),
              Column(
                children: [
                  Padding(
                    padding:
                    EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
                    child: SectionTitle(
                      title: "Special for you",
                      press: () {},
                    ),
                  ),
                  SizedBox(height: getProportionateScreenWidth(20)),
                  SingleChildScrollView(
                    key: Key('scrollSOffer'),
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        SpecialOfferCard(
                          key: Key('cardFashion1'),
                          image: "assets/images/Image Banner 2.png",
                          category: "Smartphone",
                          numOfBrands: 18,
                          press: () {},
                        ),
                        SpecialOfferCard(
                          key: Key('cardFashion2'),
                          image: "assets/images/Image Banner 3.png",
                          category: "Fashion",
                          numOfBrands: 24,
                          press: () {},
                        ),
                        SizedBox(width: getProportionateScreenWidth(20)),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: getProportionateScreenWidth(30)),
              Column(
                children: [
                  Padding(
                    padding:
                    EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
                    child: SectionTitle(title: "Popular Products", press: () {}),
                  ),
                  SizedBox(height: getProportionateScreenWidth(20)),
                  SingleChildScrollView(
                    key: Key('scrollV2'),
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      key: Key('btnProduct'),
                      children: [
                        ...List.generate(
                          demoProducts.length,
                              (index) {
                            if (demoProducts[index].isPopular)
                              return ProductCard(product: demoProducts[index]);
                            return SizedBox
                                .shrink(); // here by default width and height is 0
                          },
                        ),

                        SizedBox(width: getProportionateScreenWidth(20)),
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(height: getProportionateScreenWidth(30)),
            ],
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.home),
    );
  }
}

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    Key key,
    @required this.icon,
    @required this.text,
    @required this.press,
  }) : super(key: key);

  final String icon, text;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: SizedBox(
        width: getProportionateScreenWidth(55),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(getProportionateScreenWidth(15)),
              height: getProportionateScreenWidth(55),
              width: getProportionateScreenWidth(55),
              decoration: BoxDecoration(
                color: Color(0xFFFFECDF),
                borderRadius: BorderRadius.circular(10),
              ),
              child: SvgPicture.asset(icon),
            ),
            SizedBox(height: 5),
            Text(text, textAlign: TextAlign.center)
          ],
        ),
      ),
    );
  }
}

class SpecialOfferCard extends StatelessWidget {
  const SpecialOfferCard({
    Key key,
    @required this.category,
    @required this.image,
    @required this.numOfBrands,
    @required this.press,
  }) : super(key: key);

  final String category, image;
  final int numOfBrands;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: getProportionateScreenWidth(20)),
      child: GestureDetector(
        onTap: press,
        child: SizedBox(
          width: getProportionateScreenWidth(242),
          height: getProportionateScreenWidth(100),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Stack(
              children: [
                Image.asset(
                  image,
                  fit: BoxFit.cover,
                ),
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color(0xFF343434).withOpacity(0.4),
                        Color(0xFF343434).withOpacity(0.15),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(15.0),
                    vertical: getProportionateScreenWidth(10),
                  ),
                  child: Text.rich(
                    TextSpan(
                      style: TextStyle(color: Colors.white),
                      children: [
                        TextSpan(
                          text: "$category\n",
                          style: TextStyle(
                            fontSize: getProportionateScreenWidth(18),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextSpan(text: "$numOfBrands Brands")
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


