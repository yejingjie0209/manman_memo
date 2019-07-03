import 'package:manman_memo/model/weather.dart';

//{
//"reason": "查询成功",
//"result": [
//{
//"wid": "00",
//"weather": "晴"
//},
//{
//"wid": "01",
//"weather": "多云"
//},
//{
//"wid": "02",
//"weather": "阴"
//},
//{
//"wid": "03",
//"weather": "阵雨"
//},
//{
//"wid": "04",
//"weather": "雷阵雨"
//},
//{
//"wid": "05",
//"weather": "雷阵雨伴有冰雹"
//},
//{
//"wid": "06",
//"weather": "雨夹雪"
//},
//{
//"wid": "07",
//"weather": "小雨"
//},
//{
//"wid": "08",
//"weather": "中雨"
//},
//{
//"wid": "09",
//"weather": "大雨"
//},
//{
//"wid": "10",
//"weather": "暴雨"
//},
//{
//"wid": "11",
//"weather": "大暴雨"
//},
//{
//"wid": "12",
//"weather": "特大暴雨"
//},
//{
//"wid": "13",
//"weather": "阵雪"
//},
//{
//"wid": "14",
//"weather": "小雪"
//},
//{
//"wid": "15",
//"weather": "中雪"
//},
//{
//"wid": "16",
//"weather": "大雪"
//},
//{
//"wid": "17",
//"weather": "暴雪"
//},
//{
//"wid": "18",
//"weather": "雾"
//},
//{
//"wid": "19",
//"weather": "冻雨"
//},
//{
//"wid": "20",
//"weather": "沙尘暴"
//},
//{
//"wid": "21",
//"weather": "小到中雨"
//},
//{
//"wid": "22",
//"weather": "中到大雨"
//},
//{
//"wid": "23",
//"weather": "大到暴雨"
//},
//{
//"wid": "24",
//"weather": "暴雨到大暴雨"
//},
//{
//"wid": "25",
//"weather": "大暴雨到特大暴雨"
//},
//{
//"wid": "26",
//"weather": "小到中雪"
//},
//{
//"wid": "27",
//"weather": "中到大雪"
//},
//{
//"wid": "28",
//"weather": "大到暴雪"
//},
//{
//"wid": "29",
//"weather": "浮尘"
//},
//{
//"wid": "30",
//"weather": "扬沙"
//},
//{
//"wid": "31",
//"weather": "强沙尘暴"
//},
//{
//"wid": "53",
//"weather": "霾"
//}
//],
//"error_code": 0
//}
enum Time {
  NOW,
  TODAY,
  TOMORROW
}

class WeatherManager {
  List<String> getWeather(Result result, Time time) {
    var list = new List<String>();
    var t ;
    switch (time) {
      case Time.NOW:
        t = "今天";
        break;
      case Time.TODAY:
        break;
      case Time.TOMORROW:
        break;
    }
    result.future.forEach((item) {
      "老婆,今天天气：" + item.weather + "," + item.wid
    });
  }

  String getTemperatureMsg(String temperature) {
    List<String> list = temperature.split("/ 23\/25℃");
    StringBuffer sb = new StringBuffer("今天气温");
    if (list.length == 1) {
      sb.write(list[0] + "℃");
    } else {
      sb.write(list[0] + "~" + list[1] + "℃");
    }
  }

  String getWidMsg(Wid wid) {
    StringBuffer sb = new StringBuffer();
    var weather = int.parse(wid.day);
    if ((weather >= 3 && weather <= 12) || weather == 19 ||
        (weather >= 21 && weather <= 25)) {
      //雨
      sb.write("记得带伞");
    }

    if ((weather >= 13 && weather <= 17) || (weather >= 26 && weather <= 28)) {
      //雪
    }

    if ((weather == 53)) {
      //霾
      sb.write("，建议带好口罩出门");
    }
  }
}
