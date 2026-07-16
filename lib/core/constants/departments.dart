class Department {
  final String code;
  final String name;
  final String imageUrl;

  const Department({
    required this.code,
    required this.name,
    required this.imageUrl,
  });
}

abstract final class Departments {
  static const String wcyName = 'Wydział Cybernetyki';
  static const String wloName =
      'Wydział Bezpieczeństwa, Logistyki i Zarządzania';
  static const String welName = 'Wydział Elektroniki';
  static const String wigName = 'Wydział Inżynierii Lądowej i Geodezji';
  static const String wmeName = 'Wydział Inżynierii Mechanicznej';
  static const String wmlName = 'Wydział Mechatroniki, Uzbrojenia i Lotnictwa';
  static const String wtcName = 'Wydział Nowych Technologii i Chemii';
  static const String ioeName = 'Instytut Optoelektroniki';

  static const String wloImageUrl =
      'https://www.wojsko-polskie.pl/wat/u/41/70/4170c66b-50d7-46a7-ae5a-1fad62086fda/logo_wlo_kolor.png';

  static const String wcyImageUrl =
      'https://www.wojsko-polskie.pl/wat/u/ed/e8/ede86952-c130-4694-8254-774106f7db59/logo_wcy_kolor.png';

  static const String welImageUrl =
      'https://www.wojsko-polskie.pl/wat/u/0d/b3/0db32f82-fdda-4439-b336-fff4beb6cbb8/logo_wel_kolor.png';

  static const String wigImageUrl =
      'https://www.wojsko-polskie.pl/wat/u/18/b6/18b6ca31-3a20-4d00-9f13-ca9b37f249fd/logo_wig_kolor.png';

  static const String wmeImageUrl =
      'https://www.wojsko-polskie.pl/wat/u/58/d3/58d3a24e-4792-460e-a1ac-d5f67f9a0c2d/logo_wim_kolor_pl.png';

  static const String wmlImageUrl =
      'https://www.wojsko-polskie.pl/wat/u/16/11/1611d000-4bed-44f1-8671-5a3004823dbd/logo_wml_kolor.png';

  static const String wtcImageUrl =
      'https://www.wojsko-polskie.pl/wat/u/9e/13/9e131ed7-9924-4766-8f9f-90f04518fc36/logo_wtc_kolor.png';

  static const String ioeImageUrl =
      'https://www.wojsko-polskie.pl/wat/u/0e/76/0e765e3f-ffda-4710-a00a-81540b57a156/logo_ioe_kolor.png';

  static const List<Department> all = [
    Department(code: 'WCY', name: wcyName, imageUrl: wcyImageUrl),
    Department(code: 'WLO', name: wloName, imageUrl: wloImageUrl),
    Department(code: 'WEL', name: welName, imageUrl: welImageUrl),
    Department(code: 'WIG', name: wigName, imageUrl: wigImageUrl),
    Department(code: 'WME', name: wmeName, imageUrl: wmeImageUrl),
    Department(code: 'WML', name: wmlName, imageUrl: wmlImageUrl),
    Department(code: 'WTC', name: wtcName, imageUrl: wtcImageUrl),
    Department(code: 'IOE', name: ioeName, imageUrl: ioeImageUrl),
  ];
}
