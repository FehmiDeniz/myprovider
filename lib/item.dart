import 'package:flutter/cupertino.dart';

class Item with ChangeNotifier {
  List? products = [
    {
      "id": 1,
      "image":
          "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2F1.bp.blogspot.com%2F-sUih_YSpnog%2FVI3J8qbMjmI%2FAAAAAAAAJEA%2F30OcPUhiAdw%2Fs1600%2FLGTribute2.jpg",
      "title": "Telefon 1",
      "description": "telefon 1 açıklama yazısı şöyle böyle",
      "price": 120
    },
    {
      "id": 2,
      "image": "",
      "title": "Telefon 2",
      "description": "telefon 2 açıklama yazısı şöyle böyle ",
      "price": 150
    },
    {
      "id": 3,
      "image": "",
      "title": "Telefon 3",
      "description": "telefon 3 açıklama yazısı şöyle böyle",
      "price": 180
    }
  ];

  Item(int i);
}



//Step 1: İlk başta item.dart dosyasında item classı ile  changenotifier oluşturarak içerisinde ürün verilerini oluşturuyoruz
//Step 2: Main.dart dosyamızda provider kullanıyoruz --> ChangenotifierProvider kullandık. multiprovider içerisine alıyoruz. birden fazla provider kullanabilmemiz için bunu yaptık.
//not: ResponsiveSizer kullanımında ''builder'' kısmı >orientation-->Hem dikey hem de yatay yönlendirmeleri desteklemek istiyorsanız kullanılır | >Screentype-->tablet ve mobilde görüntünün bozulmaması için
//cartcount --> sepetteki toplam ürünü belirlemek için kullanıyoruz.
//ekleme, çıkarma ve reset fonksiyonlarını tanımlıyoruz
//products.dart ile ürünleri göstericez 

