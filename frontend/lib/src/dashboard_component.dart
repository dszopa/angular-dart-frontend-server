import 'dart:async';

import 'package:angular2/angular2.dart';
import 'package:angular2/router.dart';

import 'hero.dart';
import 'hero_service.dart';


@Component(
  selector: 'my-dashboard',
  templateUrl: 'dashboard_component.html',
  directives: const [CORE_DIRECTIVES, ROUTER_DIRECTIVES],
)
class DashboardComponent implements OnInit {
  List<Hero> heroes;

  final HeroService _heroService;

  DashboardComponent(this._heroService);

  Future<Null> ngOnInit() async {
    heroes = (await _heroService.getHeroes()).skip(1).take(4).toList();
  }
}