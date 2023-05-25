import 'package:url_launcher/url_launcher.dart';

//facebook function
facebookURL() async {
  final Uri url = Uri.parse(
      'https://www.facebook.com/profile.php?id=100010451593865&mibextid=LQQJ4d');
  if (!await launchUrl(url)) {
    var _url;
    throw Exception('Could not launch $_url');
  }
}

//whatsapp function
whatsUrl(String whatsNumber) async {
  final Uri url = Uri.parse('whatsapp://send?phone=+02$whatsNumber&text=hello');
  if (!await launchUrl(url)) {
    var _url;
    throw Exception('Could not launch $_url');
  }
}

//googleMaps function
locationUrl(String latitude, String longitude) async {
  final Uri url = Uri.parse('https://www.google.com/maps/place/29%C2%B050'
      '36.8%22E/@29.8444797,31.2746954,17z/data=!3m1!4b1!4m4!3m3!8m2!3d29.8444797!4d31.2768841?hl=en$latitude,$longitude');
  if (!await launchUrl(url)) {
    var _url;
    throw Exception('Could not launch $_url');
  }
}

//phone function
PhoneUrl(String phoneNumber) async {
  final Uri url = Uri.parse('tel:$phoneNumber');
  if (!await launchUrl(url)) {
    var _url;
    throw Exception('Could not launch $_url');
  }
}
