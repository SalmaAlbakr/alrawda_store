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
whatsUrl() async {
  final Uri url = Uri.parse('whatsapp://send?phone=+0201002095050&text=hello');
  if (!await launchUrl(url)) {
    var _url;
    throw Exception('Could not launch $_url');
  }
}

//googleMaps function
locationUrl(double latitude, double longitude) async {
  final Uri url =
      Uri.parse('https://www.google.com/maps/place/29%C2%B050'
          '36.8%22E/@29.8444797,31.2746954,17z/data=!3m1!4b1!4m4!3m3!8m2!3d29.8444797!4d31.2768841?hl=en$latitude,$longitude');
  if (!await launchUrl(url)) {
    var _url;
    throw Exception('Could not launch $_url');
  }
}


PhoneUrl(String phoneNumber) async {
  final Uri url =
      Uri.parse('tel:$phoneNumber'
      );
  if (!await launchUrl(url)) {
    var _url;
    throw Exception('Could not launch $_url');
  }
}










//location function
/*googleMapsUrl(double latitude, double longitude) async {
  final url = 'https://www.google.com/maps/place/29%C2%B050';
  '36.8%22E/@29.8444797,31.2746954,17z/data=!3m1!4b1!4m4!3m3!8m2!3d29.8444797!4d31.2768841?hl=en$latitude,$longitude';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}*/



/// TODO: location
/// TODO: phone number
