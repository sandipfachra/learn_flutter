import 'package:flutter/cupertino.dart';
import 'package:food_delivery/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

//===== Header ======
class CatalogHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        "Simple App".text.xl4.bold.color(MyTheme.orangeColor).make(),
        "Trending products".text.xl.make(),
      ],
    );
  }
}
