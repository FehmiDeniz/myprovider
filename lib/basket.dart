import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import "item.dart";

class basketScreen extends StatefulWidget {
  const basketScreen({super.key});

  @override
  State<basketScreen> createState() => _basketScreenState();
}

class _basketScreenState extends State<basketScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: ((context, Item item, widget) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.indigo[400],
            actions: [
              Container(
                //alignment: Alignment.centerLeft,
                width: 50.h,
                child: Row(
                  // mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          height: 4.h,
                          child: IconButton(
                              onPressed: () {
                                item.clearList();
                              },
                              icon: Icon(Icons.whatshot_sharp)),
                        ),
                        Container(
                          alignment: Alignment.topCenter,
                          margin: EdgeInsets.only(top: 2),
                          height: 2.h,
                          child: Text(
                            "Sıfırla",
                            style: TextStyle(fontSize: 13),
                          ),
                        ),
                      ],
                    ),
                    Spacer(),
                    Text(
                      "Sepet Toplamı: ${item.getPrice().toString()} ₺",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                  ],
                ),
              ),
            ],
          ),
          body: item.basket!.isEmpty
              ? Center(
                  child: Text(
                    item.basket!.length == 0 ? "SEPET BOŞ" : "",
                    style: TextStyle(
                        fontSize: 25,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.w500,
                        color: Colors.blueGrey),
                  ),
                )
              : Column(
                  children: [
                    Stack(
                      children: <Widget>[
                        Container(
                          width: 100.w,
                          height: 86.h,
                          child: SizedBox(
                            height: 60.h,
                            child: ListView.builder(
                              itemCount: item.basket!.length,
                              itemBuilder: (context, index) {
                                return Container(
                                  margin: EdgeInsets.only(bottom: 1.h),
                                  padding:
                                      EdgeInsets.only(right: 3.w, left: 3.w),
                                  color: Colors.black12,
                                  width: 100.w,
                                  height: 10.h,
                                  child: Row(
                                    children: [
                                      ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(2.w),
                                        child: SizedBox(
                                          width: 7.h,
                                          height: 7.h,
                                          child: Image.network(
                                              "${item.basket![index]["image"]}"),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 2.w,
                                        height: 2.w,
                                      ),
                                      Text(
                                        "${item.basket![index]["title"]}",
                                        style: TextStyle(
                                            fontSize: 16.sp,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(
                                        width: 4.w,
                                        height: 4.w,
                                      ),
                                      Text(
                                        "Ürün Fiyatı: ${item.basket![index]["price"]}",
                                        style: TextStyle(
                                            fontStyle: FontStyle.italic),
                                      ),
                                      Spacer(),
                                      InkWell(
                                        onTap: () {
                                          item.removeBasket(index);
                                        },
                                        child: Container(
                                          width: 4.h,
                                          height: 4.h,
                                          decoration: BoxDecoration(
                                              color: Colors.red[300],
                                              shape: BoxShape.circle),
                                          child: Icon(Icons.remove),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
        );
      }),
    );
  }
}
