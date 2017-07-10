import 'package:angular2/angular2.dart';
import 'package:angular2/router.dart';
import 'dart:async';

import 'hero.dart';
import 'hero_service.dart';

@Component(
  selector: 'my-heroes',
  templateUrl: 'heroes_component.html',
  styleUrls: const ['heroes_component.css'],
  directives: const [COMMON_DIRECTIVES],
  pipes: const [COMMON_PIPES],
)
class HeroesComponent implements OnInit {

  // Services
  final HeroService _heroService;
  final Router _router;

  // Constructors
  HeroesComponent(this._heroService, this._router);

  // Variables
  List<Hero> heroes;
  Hero selectedHero;

  // Methods
  void ngOnInit() {
      getHeroes();
  }

  Future<Null> getHeroes() async {
    heroes = await _heroService.getHeroes();
  }

  // Handlers
  void onSelect(Hero hero) {
    selectedHero = hero;
  }

  Future<Null> gotoDetail() => _router.navigate([
        'HeroDetail',
        {'id': selectedHero.id.toString()}
    ]);
}
