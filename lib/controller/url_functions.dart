import 'package:url_launcher/url_launcher.dart';

class AboutFunction {
  //facebook function
  facebookURL() async {
    final Uri url = await Uri.parse('https://www.facebook.com/Rawdakabel');
    if (!await launchUrl(url,
        mode: LaunchMode.externalApplication,
        webViewConfiguration: WebViewConfiguration(
          enableJavaScript: false,
        ))) {
      var _url;
      throw Exception('Could not launch $_url');
    }
  }

//whatsapp function
  whatsUrl(String whatsNumber) async {
    final Uri url =
        Uri.parse('whatsapp://send?phone=+02$whatsNumber&text=hello');
    if (!await launchUrl(url)) {
      var _url;
      throw Exception('Could not launch $_url');
    }
  }

  // location function
  locationFunction() async {
    String mapsUrl =
        'https://maps.app.goo.gl/KfAoMGGr5bDhE4UF7?fbclid=IwAR0-2VasUlFpsOUlWrwHwbSX96Y7zvDurIPiNWuHWHhpDHD7HjGgU8-UI_0&travelmode=driving';

    if (await canLaunch(mapsUrl)) {
      await launch(mapsUrl);
    } else {
      throw 'Could not launch $mapsUrl';
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
}
