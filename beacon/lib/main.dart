import 'dart:math' as math;
import 'dart:math';

import 'package:beacon/getDescription.dart';
import 'package:beacon/methods.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> descriptionList = [
    "Dünyanın yedi harikasından biri olan Artemis Tapınağı, antik dünyanın mermerden inşa edilmiş ilk tapınağı olup temelleri MÖ 7. yüzyıla kadar gitmektedir. Tanrıça Artemis'e ithafen Lidya kralı Croesus tarafından yaptırılan yapı, Yunan mimar Chersiphron tarafından tasarlanmış ve dönemin en büyük heykeltıraşları Pheidias, Polycleitus, Kresilas ve Phradmon tarafından yapılmış olan bronz heykellerle süslenmişti. Büyüklüğü 130 x 68 metre ve ön cephesi diğer Artemis (Ana Tanrıça) tapınakları gibi batıya dönüktü. Tapınak hem bir pazaryeri, hem de bir dini müessese olarak kullanılıyordu. Artemis Tapınağı MÖ 21 Temmuz 356'da adını ölümsüzleştirmek isteyen Herostratus adlı bir Yunan tarafından yakıldı. Aynı gece Büyük İskender doğmuştur. Büyük İskender Anadolu’yu fethettiğinde Artemis Tapınağı’nın yeniden yapılması için yardım teklif etmiş fakat reddedilmiştir. Tapınaktan günümüze sadece birkaç mermer blok kalmıştır.Artemis Tapınağı ile ilgili kazı çalışmaları 1863 yılında British Museum'un katkılarıyla arkeolog John Turtle Wood tarafından başlatılmış ve 1869 yılında 6 metre derinlikte, Artemis Tapınağı'nın temellerine ulaşılmıştır",
    "Midyat, Mardin ilinin bir ilçesidir. Midyat, dinlerin (İslam, Hristiyanlık ve Êzîdîlik) ve dillerin (Türkçe, Kürtçe, Arapça ve Süryanice) buluşma noktasıdır. MÖ 9. yüzyıl Asur tabletlerinde Matiate olarak tanımlanır. 'Matiate', Aramice/Süryani bir isimdir ve 'mahallesim', 'vatanım', demektir. Asur kralı II. Asur Nasırpal Tur Abidin'in Aramileri talan ettikten sonra, bu savaşın tarihi tablalar yazılmıştır. Midyat'taki ilk Süryani Hristiyanlar da mağaralarda yaşardı. Midyat tarih boyunca birçok kere kuşatılıp talan edilmiştir. Son olarak I. Dünya Savaşı'nın karanlık günlerinde, 'Ferman' yılında, kasaba sakinlerinin üçte ikisi yaşamını kaybetmiştir. Ancak 1930 yılından sonra kasaba yeniden canlanmış: Kiliseler, evler ve bazı mekanlar onarılmıştır. Ondan sonra yerleşim düzeni zamanla oturmaya başlamıştır. Bazı film ve diziler Midyat' ta çekilmiştir. ATv'nin fenomen dizisi Hercai, Mardin'de çekildi.İlçenin deniz seviyesinden yüksekliği 1070 metredir. Mardin ilinin en geniş ve nüfus bakımından en kalabalık ilçelerinden biridir. İlçeye bağlı 43 köy ve mezraa bulunmaktadır. Midyat'da Müslüman olarak Kürtler, Türkler ve Araplar yaşamaktadırlar Din ve grupları ise Hristiyan. Dinine mensup Süryaniler, Ermeniler ve Keldaniler yaşamakta bu dil grupları mezhep olarak aralarında Katolik, Ortodoks ve Protestan olmak üzere üç mezhebe ayrılırlar. Hristiyanlar kendi aralarında çok az sayıda olmak kaydı ile Süryanice konuşmaktadır, Keldanice ve Ermenice bu bölgede unutulmuş dil gruplarıdır ve konuşulmamaktadır. Midyat'da bu dinlerin yanı sıra sayıları çok az olmakla beraber Yezîdî dinine mensup insanlar da yaşamaktadırlar. Bu nedenle Midyat'a Diller ve Dinler Şehri denir.",
    "Bugün görülen kulenin temelleri ve alt katın önemli kısımları II. Mehmed devri yapısıdır. Kulenin etrafındaki sahanlık geniş kaplanmıştır. Üstündeki madalyon halindeki bir mermer levhada, kuleye şimdiki şeklini veren Sultan II. Mahmud'un, Hattat Rasim’in kaleminden çıkmış 1832 tarihli bir tuğrası vardır. Kulenin Eminönü tarafı daha genişçe olup burada bir de sarnıç vardır.İlk olarak Yunan döneminde bir mezara ev sahipliği yapan bu ada Bizans döneminde inşa edilen ek bina ile gümrük istasyonu olarak kullanılmıştır. Osmanlı döneminde ise gösteri platformundan, savunma kalesine, sürgün istasyonundan, karantina odasına kadar birçok işlev yüklenmiştir. Asli görevi olan ve yüzyıllardan beri varlığı ile insanlara, geceleri ise geçen gemilere göz kırpan feneri ile yol gösterme işlevini hiç kaybetmemiştir. Geçmişten geleceğe en çok da düşlere yol göstermektedir Kız Kulesi. Kız Kulesi 2000 yılında restore edilerek, artık çatal-bıçak seslerinin duyulduğu bir mekân haline dönüştürülmüştür. Kız kulesine ulaşım Salacak ve Ortaköy'den sandallarla yapılmaktadır.Çok eski tarihi geçmişi olan Kız Kulesi, bir zamanlar, Boğazdan geçen gemilerden vergi alınmak maksadı ile kullanılmıştır. Kule ile Avrupa Yakası boyunca büyük bir zincir çekilmiş ve gemilerin Anadolu Yakası ile Kız Kulesi arasından geçişine (o zamanlar gemi boyutları küçük olduğu için geçebilmekteydi) izin verilmiştir. Bir süre sonra Kule, zinciri taşıyamamış ve Avrupa Yakasına doğru yıkılmıştır. Kuleden suyun içine bakıldığında yıkıntıları görülmektedir.Antik Çağ'da Arkla (küçük kale) ve Damialis (dana yavrusu) adları ile anılan kule, bir ara da 'Tour de Leandros' (Leandros'un kulesi) ismi ile ün yapmıştır. Şimdi ise Kız Kulesi ismi ile bütünleşmiş ve bu ismi ile anılmaktadır.",
    "Balıklıgöl (Aynzeliha ve Halil-Ür Rahman Gölleri), Şanlıurfa şehir merkezinin güneybatısında yer alan ve İbrahim peygamberin ateşe atıldığında düştüğü yer olarak bilinen bu iki göl, İslam alemi için kutsal sayılan balıkları ve çevrelerindeki tarihi eserler ile Şanlıurfa'nın en çok ziyaret edilen tarihî mekanlarındandır.İbrahim peygamber, devrin zalim hükümdarı Nemrut ve halkının taptığı putlarla mücadele etmeye, tek tanrı fikrini savunmaya başlayınca, Nemrut tarafından bugünkü Urfa Kalesi'nin bulunduğu tepeden ateşe atılır. Bu sırada Allah tarafından ateşe 'Ey ateş, İbrahim'e karşı serin ve selamet ol' emri verilir. Bu emir üzerine, ateş suya odunlar da balığa dönüşür. İbrahim bir gül bahçesinin içerisine sağ olarak düşer. İbrahim'in düştüğü yer Halil-ür Rahman Gölü'dür. Rivayete göre Nemrut'un kızı Zeliha da İbrahim'e inandığından onun peşinden atlar. Zeliha'nın düştüğü yerde ise Aynzeliha Gölü oluşmuştur."
  ];
  int _counter = 0;
  double calculateAccuracy(int txPower, double rssi) {
    if (rssi == 0) {
      return -1.0; // if we cannot determine accuracy, return -1.
    }
    double ratio = rssi * 1.0 / txPower;
    if (ratio < 1.0) {
      return math.pow(ratio, 10);
    } else {
      double accuracy = (0.89976) * math.pow(ratio, 7.7095) + 0.111;
      return accuracy;
    }
  }

  @override
  String summarize = "";
  int randomInt = 0;
  bool loading = false;
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Column(
            children: <Widget>[
              Align(
                alignment: Alignment.topCenter,
                child: GestureDetector(
                  onTap: () async {
                    if (!loading) {
                      setState(() {
                        loading = true;
                        summarize = "";
                      });
                      int random = Random().nextInt(3);
                      setState(() {
                        randomInt = random;
                      });
                      summarize = await getDescription(random);
                      setState(() {
                        loading = false;
                      });
                    }
                  },
                  child: Container(
                    height: 75,
                    width: double.infinity,
                    color: Colors.blue,
                    child: Center(
                      child: !loading
                          ? Text(
                              'Metin Özeti için Tıklayın',
                            )
                          : Center(
                              child: CircularProgressIndicator(
                                color: Colors.white,
                              ),
                            ),
                    ),
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                child: Text("METİN"),
                color: Colors.amber,
                height: 50,
              ),
              Expanded(
                child: ListView(
                  children: [
                    Container(
                        child: Text(
                      descriptionList[randomInt],
                    )),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                child: Text("ÖZET"),
                color: Colors.amber,
                height: 50,
              ),
              Expanded(
                child: ListView(
                  children: [
                    Container(
                        child: Text(
                      summarize,
                    ))
                  ],
                ),
              ),
            ],
          ),
          GestureDetector(
            onTap: () {
              scanBeacon(context);
            },
            child: Container(
              width: double.infinity,
              height: 75,
              color: Colors.red,
              child: Center(child: Text("BEACON TARAMA")),
            ),
          ),
        ],
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
