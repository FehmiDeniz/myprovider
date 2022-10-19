import 'package:flutter/cupertino.dart';

class Item with ChangeNotifier {
  List? basket = [];
  double totalPrice = 0;

  List? products = [
    {
      "id": 1,
      "image":
          "https://productimages.hepsiburada.net/s/283/375/110000271461251.jpg",
      "title": "Telefon 1",
      "description": "telefon 1 açıklama yazısı şöyle böyle",
      "price": 120,
    },
    {
      "id": 2,
      "image":
          "https://productimages.hepsiburada.net/s/280/375/110000267188592.jpg",
      "title": "Telefon 2",
      "description": "telefon 2 açıklama yazısı şöyle böyle ",
      "price": 150,
    },
    {
      "id": 3,
      "image":
          "https://productimages.hepsiburada.net/s/283/375/110000271461057.jpg",
      "title": "Telefon 3",
      "description": "telefon 3 açıklama yazısı şöyle böyle",
      "price": 180
    }
  ];

  Item(int i);

  void addBasket(Object value) {
    basket!.add(value);

    notifyListeners();
  }

  void removeBasket(int index) {
    basket!.removeAt(index);
    notifyListeners(); //removeAt yerine remove kullanınca son ekleneni çıkarıyor istenen indexi değil bu yüzden removeAt kullanırız.
  }
}

//Step 1: İlk başta item.dart dosyasında item classı ile  changenotifier oluşturarak içerisinde ürün verilerini oluşturuyoruz
//Step 2: Main.dart dosyamızda provider kullanıyoruz --> ChangenotifierProvider kullandık. multiprovider içerisine alıyoruz. birden fazla provider kullanabilmemiz için bunu yaptık.
//not: ResponsiveSizer kullanımında ''builder'' kısmı >orientation-->Hem dikey hem de yatay yönlendirmeleri desteklemek istiyorsanız kullanılır | >Screentype-->tablet ve mobilde görüntünün bozulmaması için
//ekleme, çıkarma ve reset fonksiyonlarını tanımlıyoruz;notify listeners ile classın dinlenmesini sağlıyoruz.
//products.dart dosyası oluşturuyoruz bu dosya ile ürünleri göstericez
//products.dart içerisinde 'consumer' içerisine alıyoruz. builder yapısı (context,kurduğumuz 'Item' classı,widget) şeklinde.
//bu sayfada ürünlerimiz gözükecek ve genel işlemler yapılacak.
//yapıyı bu sayfada oluşturuyoruz. ilk olarak listview'i oluşturup verileri çekeceğiz.
//sırayla oluşturduğumuz verileri row içerisinde gösteriyoruz.
//> "${item.products![index]["image"]}" < image network içerisine
//> "${item.products![index]["title"]}" < title verisi için diğer veriler için de aynı yapı kullanılıyor.
//item.dart sayfasında 'basket' isimli bir liste oluşturuyoruz. bu listeye sepete eklenen adet miktarını ekleyeceğiz.
//addBasket fonksiyonu ile ekleme yaparak değeri göstericez. removeBasket ile de çıkarma işlemi yapacağız.
//ekleme kısmında  > item.totalPrice = item.totalPrice +  item.products![index]["price"]; < ile toplam ücreti hesaplıyoruz.
                                
//basket.dart isimli dosya açıyoruz. eklenen dosyaları orada görüntüleyeceğiz ve silme işlemi yapacağız. 
//consumer yapısı ile sarıyoruz tekrar. basket listesine eklenen ürünler ile listview oluşturacağız ve onları göstereceğiz. (products.dart dosyasındaki şilemler gibi)

