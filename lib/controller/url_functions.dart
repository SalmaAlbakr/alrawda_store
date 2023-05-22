import 'package:url_launcher/url_launcher.dart';

//facebook function
facebookURL() async {
  final Uri url = Uri.parse('https://www.facebook.com/102294387820839/posts/102325491151062/');
  if (!await launchUrl(url)) {
    var _url;
    throw Exception('Could not launch $_url');
  }
}

//whatsapp function
whatsUrl() async {
  final Uri url = Uri.parse('https://api.whatsapp.com/send?phone=201110955595&data=AWAOXEkE21AKO7N10CRQwaMG72HxmlFyVSO6C9BOvd4Jd8kYTRAwkLcPMp8SrYFnZTudoqFrcyaM-xUwkxUoWUMuETiiJx-fkOZzHzhPS7dvUlAnGW74FIG1JH_SuDg083LahFGkO2tAVa9NZJ3m0Jo5cGZTQINqQ63BG8csoULrxdVqNeEc0mxFnTG5OWyYbqBGcVwI0t-24M1fA8QeQqSRWwl2mBdvujoxaBIjfiI9kNS4oM2CbJIbAWrApCb6Pm27ND2VVhEVlK-zsJ0vTy3-_WBPU-8QLsu47NZjpQD9f8KdL5A&source=FB_Page&app=facebook&entry_point=page_cta&fbclid=IwAR21YKPWwMrusSOZRTVKN7cLWe6fFxko_N6OZpLQBw9nbOwzzzfkAyTLDPA');
  if (!await launchUrl(url)) {
    var _url;
    throw Exception('Could not launch $_url');
  }
}

//googleMaps function
locationUrl() async {
  final Uri url = Uri.parse('https://www.facebook.com/102294387820839/posts/102325491151062/');
  if (!await launchUrl(url)) {
    var _url;
    throw Exception('Could not launch $_url');
  }
}