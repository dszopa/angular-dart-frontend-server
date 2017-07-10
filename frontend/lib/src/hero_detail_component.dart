import 'dart:async';

import 'package:angular2/router.dart';
import 'package:angular2/platform/common.dart';

import 'hero_service.dart';
import 'hero.dart';
import 'package:angular2/angular2.dart';

@Component(
    selector: 'hero-detail',
    templateUrl: 'hero_detail_component.html',
    styleUrls: const ['hero_detail_component.css'],
    directives: const [COMMON_DIRECTIVES],
)
class HeroDetailComponent implements OnInit {
  final HeroService _heroService;
  final RouteParams _routeParams;
  final Location _location;

  HeroDetailComponent(this._heroService, this._routeParams, this._location);

  Hero hero;

  Future<Null> ngOnInit() async {
    var _id = _routeParams.get('id');
    var id = int.parse(_id ?? '', onError: (_) => null);
    if (id != null) hero = await (_heroService.getHero(id));
  }

  void goBack() => _location.back();
}