import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:myprovider/basket.dart';
import 'package:myprovider/item.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({super.key});

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, Item item, widget) {
        return Scaffold(
          appBar: AppBar(
            actions: [
              Row(
                children: [
                  Text(
                    "${item.price} ",
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.w700),
                  ),
                  IconButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => basketScreen(),
                            ));
                      },
                      icon: Image.asset("assets/sepet.png")),
                ],
              )
            ],
            backgroundColor: Colors.amberAccent,
            title: Text(
              "Seçilen ürün adedi |${item.basket!.length}|",
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
          ),
          body: Column(
            children: [
              SizedBox(
                height: 80.h,
                width: 100.w,
                child: ListView.builder(
                  itemCount: item.products!.length,
                  itemBuilder: (context, index) {
                    return Container(
                      padding: EdgeInsets.all(10),
                      margin: EdgeInsets.all(2),
                      //rowu kapsayan container
                      width: 100.w,
                      height: 13.h,

                      color: Colors.yellow[200],
                      child: Row(
                        children: [
                          //görseli koyacağımız kutu
                          ClipRRect(
                            borderRadius: BorderRadius.circular(2.w),
                            child: SizedBox(
                              width: 7.h,
                              height: 7.h,
                              child: Image.network(
                                  "${item.products![index]["image"]}"),
                            ),
                          ),
                          SizedBox(
                            width: 2.w,
                          ),
                          Text(
                            "${item.products![index]["title"]}",
                            style: TextStyle(
                                fontSize: 16.sp, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: 4.w,
                          ),

                          Container(
                            width: 40.w,
                            child: RichText(
                              text: TextSpan(
                                style: TextStyle(
                                    fontSize: 12, color: Colors.black),
                                children: <TextSpan>[
                                  TextSpan(
                                      text:
                                          'Fiyat : ${item.products![index]["price"]} tl',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold)),
                                  TextSpan(text: "\n"),
                                  TextSpan(
                                      text:
                                          '\n${item.products![index]["description"]}',
                                      style: TextStyle(
                                          fontStyle: FontStyle.italic)),
                                ],
                              ),
                            ),
                          ),

                          Spacer(),
                          InkWell(
                            onTap: () {
                              item.addBasket(item.products![index]);
                            },
                            child: Container(
                              width: 4.h,
                              height: 4.h,
                              decoration: BoxDecoration(
                                  color: Colors.white, shape: BoxShape.circle),
                              child: Icon(Icons.add),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
