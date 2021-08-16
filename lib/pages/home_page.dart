import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:food_delivery/core/store.dart';
import 'package:food_delivery/models/cart.dart';
import 'dart:convert';
import 'package:food_delivery/models/catalog.dart';
import 'package:food_delivery/utils/routes.dart';
import 'package:food_delivery/widgets/home_widget/catalog_header.dart';
import 'package:food_delivery/widgets/home_widget/catalog_list.dart';
import 'package:food_delivery/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // final String name = "sandip";
  CatalogModel catalogModel = CatalogModel();

  var http;

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
    // ignore: unused_local_variable
    final _cart = (VxState.store as MyStore).cart;
    return Scaffold(
      backgroundColor: MyTheme.creamColor,
      floatingActionButton: VxBuilder(
          mutations: {AddMutation, RemoveMutation},
          // ignore: non_constant_identifier_names
          builder: (context, _, VxStatus) => FloatingActionButton(
                onPressed: () =>
                    Navigator.pushNamed(context, MyRoutes.cartRoute),
                backgroundColor: MyTheme.orangeColor,
                child: Icon(
                  CupertinoIcons.cart,
                  color: Colors.white,
                ),
              ).badge(
                  color: Colors.deepOrangeAccent,
                  size: 21,
                  count: _cart.items.length,
                  textStyle: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 13))),
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
