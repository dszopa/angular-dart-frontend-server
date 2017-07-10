import 'dart:async';

import 'package:angular2/angular2.dart';
import 'package:angular2/router.dart';
import 'package:stream_transform/stream_transform.dart';

import 'hero_search_service.dart';
import 'hero.dart';

@Component(
  selector: 'hero-search',
  templateUrl: 'hero_search_component.html',
  styleUrls: const ['hero_search_component.css'],
  directives: const [CORE_DIRECTIVES],
  providers: const [HeroSearchService],
  pipes: const [COMMON_PIPES],
)
class HeroSearchComponent implements OnInit {
  HeroSearchService _heroSearchService;
  Router _router;

  Stream<List<Hero>> heroes;
  StreamController<String> _searchTerms = new StreamController<String>.broadcast();

  HeroSearchComponent(this._heroSearchService, this._router);

  // Push a search term into the stream
  void search(String term) => _searchTerms.add(term);

  // For a more in-depth explanation of what is going on here
  // consult this link: https://webdev.dartlang.org/angular/tutorial/toh-pt6#!#initialize-the-heroes-property-ngoninit
  Future<Null> ngOnInit() async {
    heroes = _searchTerms.stream
        .transform(debounce(new Duration(milliseconds: 300)))
        .distinct()
        .transform(switchMap((term) => term.isEmpty
            ? new Stream<List<Hero>>.fromIterable([<Hero>[]])
            : _heroSearchService.search(term).asStream()))
        .handleError((e) {
      print(e); // for demo purposes only
    });
  }

  void gotoDetail(Hero hero) {
    var link = [
        'HeroDetail',
        {'id': hero.id.toString()}
      ];
    _router.navigate(link);
  }
}