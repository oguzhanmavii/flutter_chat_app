import 'package:flutter/material.dart';

void main() => runApp(MyApp()); // Uygulamanın Çalışmasını Tetikleyen ana method

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //
      debugShowCheckedModeBanner:
          false, // Uygulama Açıldıgındaki debug yazısını Kaldırır
      home: Iskele(),
    );
  }
}

class Iskele extends StatefulWidget {
  @override
  _IskeleState createState() => _IskeleState();
}

class _IskeleState extends State<Iskele> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Başlık Kısmı Uygulama Adının Belirtildiği bölge
        title: Text('Chat App'),
      ),
      body: AnaEkran(), // Uygulamanın Gövdesi
    );
  }
}

class AnaEkran extends StatefulWidget {
  @override
  _AnaEkranState createState() => _AnaEkranState();
}

class _AnaEkranState extends State<AnaEkran> {
  // AnaEkranımızdaki değişiklikleri kontrol ettiğimiz bölge
  TextEditingController t1 = TextEditingController();
  List mesajListesi = [];

  mesajEkle(String metin) {
    setState(() {
      // herhangi bir değişiklik olacağı zaman bu methoddan yararlanırız
      mesajListesi.insert(0, metin);
      // mesaj listesi içine eleman ekler dinamik liste belleğine
      t1.clear(); // listeye her eleman eklendilten sonra yazı yazma alanın temizler
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(60.0),
      child: Column(
        children: <Widget>[
          Flexible(
            // başlık buton ve listView i hizalamaya yardım eder
            child: ListView.builder(
              // listeyi oluştururuz
              reverse: true, // mesajlarin alttan yukarı listelenmesini sağlar
              itemCount: mesajListesi.length, // Listenin Boyutunu döndürür
              itemBuilder: (context,
                      int
                          indeksNumarasi) => // Bu method ile yazilari dizi içine indeks elaman olarak ekleriz
                  Text(mesajListesi[
                      indeksNumarasi]), // indeks numarasına göre girilen degerlerin ekranda gösterir
            ),
          ),
          Row(
            children: <Widget>[
              Flexible(
                child: TextField(
                  onSubmitted: mesajEkle,
                  // Text yazılarımızın Gösterilecegi büyük alan
                  controller: t1,
                ),
              ),
              RaisedButton(
                onPressed: mesajEkle(t1.text),
                child: Icon(Icons.send),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
