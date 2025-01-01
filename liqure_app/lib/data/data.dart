

import 'package:liqure_app/data/bottle.dart';

String beer(String beer)=>"images/beer/$beer";
String rum(String rum)=> "images/rum/$rum";
String whisky(String whisky)=> "images/whisky/$whisky";
String wine(String wine)=> "images/wine/$wine";

final beerList =[
  Bottle(name: "ABC", price: 4, imgUrl: beer("abc.jpg")),
  Bottle(name: "Heineken", price: 2, imgUrl: beer("heineken1.jpg")),
  Bottle(name: "Korona", price: 5, imgUrl: beer("korona.webp")),
  Bottle(name: "Tiger", price: 2, imgUrl: beer("tiger.jpg")),
  
];

final rumList = [
  Bottle(name: "Bumu", price: 13, imgUrl: rum("bumu.jpg")),
  // Bottle(name: "Captain Morrgan", price: 15, imgUrl: rum("captainMorgan.jpg")),
  // Bottle(name: "Crusty Jugger", price: 17, imgUrl: rum("ram1.jpg")),
  Bottle(name: "Old Monk", price: 16, imgUrl: rum("ramicon.jpg")),
];

final whiskyList =[
  // Bottle(name: "Blue Label", price: 30, imgUrl: whisky("bluelabel.jpg")),
  // Bottle(name: "Double Black", price: 20, imgUrl: whisky("doubleblk.webp")),
  // Bottle(name: "Jack Daniel", price: 18, imgUrl: whisky("whkynobg.png")),
  Bottle(name: "Jame Son", price: 22, imgUrl: whisky("jameson.webp")),
];

final wineList = [
  Bottle(name: "Red Wine", price: 300, imgUrl: wine('winenobg.png')),
  Bottle(name: "Sliver Oak", price: 270, imgUrl: wine('silverOak.jpg')),
  Bottle(name: "Six Seeds", price: 300, imgUrl: wine('sixseeds.jpg')),
  // Bottle(name: "Sparkling Rose", price: 300, imgUrl: wine('sparklingRoseWine.jpg')),

];