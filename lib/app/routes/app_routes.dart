part of 'app_pages.dart';

abstract class Routes {
  static const landingScreen = _Paths.HOME;
  static const libraryScreen = _Paths.LIBRARY;
  static const articleTemplate1Screen = _Paths.ARTICLETEMPLATE1;
  static const articleTemplate2Screen = _Paths.ARTICLETEMPLATE2;
  static const articleTemplate3Screen = _Paths.ARTICLETEMPLATE3;
  static const articleTemplate4Screen = _Paths.ARTICLETEMPLATE4;
  static const articleTemplate5Screen = _Paths.ARTICLETEMPLATE5;
  static const articleTemplate6Screen = _Paths.ARTICLETEMPLATE6;
}

abstract class _Paths {
  static const HOME ='/home';
  static const LIBRARY = '/library';
  static const ARTICLETEMPLATE1 = '/articletemplate1';
  static const ARTICLETEMPLATE2 = '/articeltemplate2';
  static const ARTICLETEMPLATE3 = '/articletemplate3';
  static const ARTICLETEMPLATE4 = '/articletemplate4';
  static const ARTICLETEMPLATE5 = '/articletemplate5';
  static const ARTICLETEMPLATE6 = '/articletemplate6';
}