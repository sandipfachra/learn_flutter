import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:food_delivery/models/catalog.dart';
import 'package:food_delivery/widgets/home_widget/catalog_header.dart';
import 'package:food_delivery/widgets/home_widget/catalog_list.dart';
import 'package:velocity_x/velocity_x.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final String name = "sandip";
  CatalogModel catalogModel = CatalogModel();

  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(Duration(seconds: 3));
    final catalogJson =
        await rootBundle.loadString("assets/files/catalog.json");
    final decodedData = jsonDecode(catalogJson);
    var productData = decodedData["products"];
    var listTemp =
        List.from(productData).map<Item>((item) => Item.formap(item)).toList();
    // print("Product : $listTemp");
    CatalogModel.items = listTemp;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
            padding: Vx.m32,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CatalogHeader(),
                if (CatalogModel.items.isNotEmpty)
                  CatalogList().py12().expand()
                else
                  CircularProgressIndicator().centered().expand()
              ],
            ).pOnly(right: 8.0)),
      ),
    );
  }
}
