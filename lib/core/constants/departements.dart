import 'package:wat_schedule/core/constants/constants.dart';

class Department {
  final String code;
  final String name;
  final String imageUrl;

  Department({
    required this.code,
    required this.name,
    required this.imageUrl,
  });
}

class Departments extends Constants {
  static const String WCY = 'Wydział Cybernetyki';
  static const String WLO = 'Wydział Bezpieczeństwa, Logistyki i Zarządzania';
  static const String WEL = 'Wydział Elektroniki';
  static const String WIG = 'Wydział Inżynierii Lądowej i Geodezji';
  static const String WIM = 'Wydział Inżynierii Mechanicznej';
  static const String WML = 'Wydział Mechatroniki, Uzbrojenia i Lotnictwa';
  static const String WTC = 'Wydział Nowych Technologii i Chemii';
  static const String IOE = 'Instytut Optoelektroniki';

  static const String WLOIMG =
      'https://www.wojsko-polskie.pl/wat/u/41/70/4170c66b-50d7-46a7-ae5a-1fad62086fda/logo_wlo_kolor.png';

  static const String WCYIMG =
      'https://www.wojsko-polskie.pl/wat/u/ed/e8/ede86952-c130-4694-8254-774106f7db59/logo_wcy_kolor.png';

  static const String WELIMG =
      'https://www.wojsko-polskie.pl/wat/u/ed/e8/ede86952-c130-4694-8254-774106f7db59/logo_wcy_kolor.png';

  static const String WIGIMG =
      'https://www.wojsko-polskie.pl/wat/u/18/b6/18b6ca31-3a20-4d00-9f13-ca9b37f249fd/logo_wig_kolor.png';

  static const String WIMIMG =
      'https://www.wojsko-polskie.pl/wat/u/58/d3/58d3a24e-4792-460e-a1ac-d5f67f9a0c2d/logo_wim_kolor_pl.png';

  static const String WMLIMG =
      'https://www.wojsko-polskie.pl/wat/u/16/11/1611d000-4bed-44f1-8671-5a3004823dbd/logo_wml_kolor.png';

  static const String WTCIMG =
      'https://www.wojsko-polskie.pl/wat/u/9e/13/9e131ed7-9924-4766-8f9f-90f04518fc36/logo_wtc_kolor.png';

  static const String IOEIMG =
      'https://www.wojsko-polskie.pl/wat/u/0e/76/0e765e3f-ffda-4710-a00a-81540b57a156/logo_ioe_kolor.png';

  List<Department> departments = [
    Department(code: 'WCY', name: WCY, imageUrl: WCYIMG),
    Department(code: 'WLO', name: WLO, imageUrl: WLOIMG),
    Department(code: 'WEL', name: WEL, imageUrl: WELIMG),
    Department(code: 'WIG', name: WIG, imageUrl: WIGIMG),
    Department(code: 'WIM', name: WIM, imageUrl: WIMIMG),
    Department(code: 'WML', name: WML, imageUrl: WMLIMG),
    Department(code: 'WTC', name: WTC, imageUrl: WTCIMG),
    Department(code: 'IOE', name: IOE, imageUrl: IOEIMG),
  ];
}
