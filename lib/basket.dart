import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
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
                alignment: Alignment.center,
                width: 10.h,
                child: Text(
                  "${item.totalPrice} TL",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ),
            ],
          ),
          body: Column(
            children: [
              Container(
                width: 100.w,
                height: 88.h,
                child: ListView.builder(
                  itemCount: item.basket!.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.only(bottom: 1.h),
                      padding: EdgeInsets.only(right: 3.w, left: 3.w),
                      color: Colors.black12,
                      width: 100.w,
                      height: 10.h,
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(2.w),
                            child: SizedBox(
                              width: 7.h,
                              height: 7.h,
                              child: Image.network(
                                  "${item.basket![index]["image"]}"),
                            ),
                          ),
                          SizedBox(
                            width: 1.w,
                            height: 1.w,
                          ),
                          Text(
                            "${item.basket![index]["title"]}",
                            style: TextStyle(
                                fontSize: 16.sp, fontWeight: FontWeight.bold),
                          ),
                          // Text(""), --> id'ye göre kıyasla ya da listeye göre bak ve toplam adet sayısını dene
                        ],
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        );
      }),
    );
  }
}
