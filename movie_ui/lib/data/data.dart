

import 'package:movie_ui/data/movie.dart';

String img(String name)=> 'images/items/$name';

final trandings =[
  Movie("avanger", img('avanger.jpg')),
  Movie("avatar", img('avatar.jpg')),
  Movie("deadpool", img('deadpool.jpg')),
  Movie("joker", img('joker.jpg')),
  Movie("moana", img('moana.jpg')),
];

final movies = [

  Movie("oppoheimer", img('oppoheimer.jpg')),
  Movie("spinderman", img('spinderman.jpg')),
  Movie("venom", img('venom.jpg')),
  Movie("walle", img('walle.jpg')),
  Movie("wonderwoman", img('wondervoman.jpg')),

];

final tvs = [
  Movie("Lost", img("tvLost.jpg")),
  Movie("Power",img("tvPower.jpg"))
];

final sag = [
  Movie("After", img("sagafter.jpg")),
  Movie("The Creator", img("sagcreator.jpg")),
  Movie("Outsider", img("sagoutsider.jpg"))
];
