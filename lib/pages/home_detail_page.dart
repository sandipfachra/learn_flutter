import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:food_delivery/models/catalog.dart';
import 'package:food_delivery/widgets/themes.dart';

class HomeDetailPage extends StatelessWidget {
  final Item catalog;
  const HomeDetailPage({
    Key? key,
    required this.catalog,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var captionStyle = context.captionStyle;
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: MyTheme.creamColor,
      bottomNavigationBar: Container(
        color: Colors.white,
        child: ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
          buttonPadding: EdgeInsets.zero,
          children: [
            "\$${catalog.price}".text.bold.xl3.make(),
            ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                          MyTheme.orangeColor,
                        ),
                        shape: MaterialStateProperty.all(StadiumBorder())),
                    child: "Buy".text.xl.white.bold.make())
                .wh(100, 45)
          ],
        ).p24(),
      ),
      body: Column(
        children: [
          Hero(
              tag: Key(catalog.id.toString()),
              child: Image.network(
                catalog.image,
                fit: BoxFit.cover,
                height: 250,
              )),
          Expanded(
            child: VxArc(
              height: 30.0,
              arcType: VxArcType.CONVEY,
              edge: VxEdge.TOP,
              child: Container(
                color: Colors.white,
                width: context.screenWidth,
                child: Column(
                  children: [
                    catalog.name.text.xl4
                        .color(MyTheme.orangeColor)
                        .bold
                        .make(),
                    catalog.desc.text.xl.textStyle(captionStyle!).make(),
                    10.heightBox,
                  ],
                ).py64(),
              ),
            ),
          )
        ],
      ),
    );
  }
}
