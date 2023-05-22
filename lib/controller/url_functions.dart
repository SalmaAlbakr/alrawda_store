import 'package:url_launcher/url_launcher.dart';

//facebook function
facebookURL() async {
  final Uri url = Uri.parse('https://www.facebook.com/profile.php?id=100010451593865&mibextid=LQQJ4d');
  if (!await launchUrl(url)) {
    var _url;
    throw Exception('Could not launch $_url');
  }
}

//whatsapp function
whatsUrl() async {
  final Uri url = Uri.parse('whatsapp://send?phone=+0201156922122&text=hello');
  if (!await launchUrl(url)) {
    var _url;
    throw Exception('Could not launch $_url');
  }
}

//googleMaps function
locationUrl() async {
  final Uri url = Uri.parse('https://www.facebook.com/merna.gamal.184?mibextid=LQQJ4d');
  if (!await launchUrl(url)) {
    var _url;
    throw Exception('Could not launch $_url');
  }
}