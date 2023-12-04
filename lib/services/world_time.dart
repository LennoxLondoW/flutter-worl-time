import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {
  String location;
  String time = "";
  String flag;
  String url;
  bool isDaytime = true;

  WorldTime(this.location, this.flag, this.url);

  Future<void> getTime() async {
    try {
      //  make a network request
      var headersList = {
        'Accept': '*/*',
        'User-Agent': 'Thunder Client (https://www.thunderclient.com)'
      };
      var endpoint = Uri.parse("https://worldtimeapi.org/api/timezone/$url");

      var req = http.Request('GET', endpoint);
      req.headers.addAll(headersList);

      var res = await req.send();
      final resBody = await res.stream.bytesToString();

      Map data = jsonDecode(resBody);
      String datetime = data['datetime'];
      String utcOffset = data['utc_offset'].substring(1, 3);

      //creating a date time object
      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(utcOffset)));
      time = DateFormat.jm().format(now);
      isDaytime = now.hour > 6 && now.hour < 20;
    } catch (e) {
      time = "Could not get date time $e";
    }
  }
}
