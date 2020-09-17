import 'graphline.dart';
import 'post.dart';
import 'dart:convert';

/*
List<Post> parsePosts() {
  List<Post> togive;
  //ldata
  for (int i = 0; i < 4 /*bandnum()*/; i++) {
    Post x=new Post(
      ddata[i]["band"],
    ddata[i]["kodu"],
    ddata[i]["zaman"],
    (hourQuerry(itemQuerry(ddata, "band", 1), "zaman", time.toString()).length));
    for (int time = 0; time < 24; time++) {

    }
  }
 // final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();

  return parsed.map<Post>((json) => Post.fromJson(json)).toList();
}*/

List uniq(var DData, String sorgu) {
  List uniq = [];

  //print(DData["band"][1]);
  uniq.add(DData[0][sorgu]);

  // print(uniq);
  for (int ind = 0; ind < DData.length; ind++) {
    bool isUniq = true;

    for (int ind_A = 0; ind_A < uniq.length; ind_A++) {
      int dat = DData[ind][sorgu];
      if (uniq[ind_A] == dat) {
        isUniq = false;
      }
      //   print(isUniq);
      //   print("++"+uniq[ind_A].toString()+"++"+DData[ind]["band"].toString());
    }

    if (isUniq) {
      uniq.add(DData[ind][sorgu]);
      //print(uniq);
    }
  }

  return uniq;
}

int numQuerry(var ddata, String q1, int c1) {
  int x = 0;
  int counter = 0;
  while (x < ddata.length) {
    x++;
    if (ddata[x][q1] == c1) {
      counter++;
    }
  }
  return counter;
}

List itemQuerry(var ddata, String q1, int c1) {
  int x = 0;
  //int counter = 0;
  var a = [];

  while (x < ddata.length - 1) {
    x++;
    if (ddata[x][q1] == c1) {
      //counter++;
      var details = new Map();
      details["band"] = ddata[x]["band"];
      details["kodu"] = ddata[x]["kodu"];
      details["zaman"] = ddata[x]["zaman"];
      details["serinumarası"] = ddata[x]["serinumarası"];

      a.add(details);
    }
  }
  //print("a length IQ");
  //print(a.length);
  // print(a);

  return a;
}

List itemQuerryseri(var ddata, String q1, String c1) {
  int x = 0;
  //int counter = 0;
  var a = [];

  while (x < ddata.length - 1) {
    x++;

    if (ddata[x][q1] == c1) {
      //counter++;

      var details = new Map();
      details["band"] = ddata[x]["band"];
      details["kodu"] = ddata[x]["kodu"];
      details["zaman"] = ddata[x]["zaman"];
      details["serinumarası"] = ddata[x]["serinumarası"];

      a.add(details);
    }
  }
  //print("a length IQ");
  //print(a.length);
  //print(a);

  return a;
}

List hourQuerry(var ddata, String q1, String c1) {
  print("HQ");
  int x = 0;
  //int counter = 0;
  var a = [];
  //print(c1);
  if (c1.length == 1) {
    c1 += ":";
  }

//print(ddata[5][q1].substring(0,1));
  while (x < ddata.length - 1) {
    x++;
    if (c1.length == 2) {
      if (ddata[x][q1].substring(0, 2) == c1) {
        //counter++;
        var details = new Map();
        details["band"] = ddata[x]["band"];
        details["kodu"] = ddata[x]["kodu"];
        details["zaman"] = ddata[x]["zaman"];
        details["serinumarası"] = ddata[x]["serinumarası"];

        a.add(details);
      }
    }
  }
  //print("a length HQ");
  //print(a.length);
//  while (x<ddata.length-1){}

  //print(a.where((s)=>s["zaman"].substring(0, 1) =="20" ));
  //print(a);
  return a;
}

int hourQuerryint(var ddata, String q1, String c1) {
  print("HQint");
  int x = 0;
  int counter = 0;
//  var a = [];
  //print(c1);
  if (c1.length == 1) {
    c1 += ":";
  }

//print(ddata[5][q1].substring(0,1));
  while (x < ddata.length - 1) {
    x++;
    if (c1.length == 2) {
      if (ddata[x][q1].substring(0, 2) == c1) {
        counter++;
      }
    }
  }
  //print("a length HQ int");
  //print(counter);

  return counter;
}

List dataarray1() {
  //for dummy, band 1 graph
  List<TimeSeriesSales> ldata = [];
  for (int time = 0; time < 24; time++) {
    //ldata.add(hourQuerry(itemQuerry(ddata, "band", 1), "zaman", time.toString()).length);

    ldata.add(new TimeSeriesSales(
        new DateTime(2017, 9, 1, time),
        hourQuerry(itemQuerry(ddata, "band", 1), "zaman", time.toString())
            .length));
  }

  return ldata;
}

//stream filitrelemek bayaa ölümmm
Post dataarrayUrunkodu(var dataArray, int kodu) {
  //orijinal data arryi graphte kullanıyorsun
  //banda göre filitreleyip ver
  print("dataarrayUrunkodu");
  //List<Post> give = [];
  List<TimeSeriesSales> ldata = [];
  for (int time = 0; time < 24; time++) {
    //ldata.add(hourQuerry(itemQuerry(ddata, "band", 1), "zaman", time.toString()).length);

    ldata.add(new TimeSeriesSales(
        new DateTime(2017, 9, 1, time),
        hourQuerry(
                itemQuerry(dataArray, "kodu", kodu), "zaman", time.toString())
            .length));
    //print(hourQuerry(
    //itemQuerry(dataArray, "kodu", kodu), "zaman", time.toString()));
  }

  Post newpost = new Post(kodu: kodu, graphy: ldata);
  //give.add(newpost);

  return newpost;
}

Post dataarray(var dataArray, int band) {
  //orijinal data arryi graphte kullanıyorsun
  //banda göre filitreleyip ver

  //List<Post> give = [];
  List<TimeSeriesSales> ldata = [];
  for (int time = 0; time < 24; time++) {
    //ldata.add(hourQuerry(itemQuerry(ddata, "band", 1), "zaman", time.toString()).length);

    ldata.add(new TimeSeriesSales(
        new DateTime(2017, 9, 1, time),
        hourQuerry(
                itemQuerry(dataArray, "band", band), "zaman", time.toString())
            .length));
  }
  Post newpost = new Post(band: band, graphy: ldata);
  //give.add(newpost);

  return newpost;
}

//look 4 how many different product code and band no
//these are hard coded
List<Post> parsePosts(var dataArray) {
  List<Post> give = [];

  give.add(dataarray(dataArray, 1));
  give.add(dataarray(dataArray, 2));
  give.add(dataarray(dataArray, 3));
  give.add(dataarray(dataArray, 4));

  return give;
}

///////////////////////////////////////////////////////////////////unique item kodu listesi çıkart oradan al
List<Post> parsePostsUrunkodu(var dataArray) {
  List<Post> give = [];
  List range = uniq(dataArray, "kodu");
  for (int x in range) {
    give.add(dataarrayUrunkodu(dataArray, x));
  }
  print(range);
  return give;
}

getMockdataAsStream() {
  List<TimeSeriesSales> ldata = dataarray1();
  return new Stream.fromIterable(ldata);
}

void addpost(var x) {}

//print(hourQuerry(itemQuerry( ddata,"band", 1),"zaman", "5").length);
//print(hourQuerry(itemQuerry( ddata,"band", 1),"zaman", "8"));

var ddata = [
  {"band": 2, "kodu": 4, "zaman": "6:11", "serinumarası": "60-178-5272"},
  {"band": 1, "kodu": 8, "zaman": "19:41", "serinumarası": "62-354-6421"},
  {"band": 2, "kodu": 7, "zaman": "17:52", "serinumarası": "69-721-3752"},
  {"band": 1, "kodu": 14, "zaman": "4:26", "serinumarası": "52-839-0845"},
  {"band": 4, "kodu": 21, "zaman": "3:31", "serinumarası": "19-409-8426"},
  {"band": 3, "kodu": 6, "zaman": "4:24", "serinumarası": "01-269-6024"},
  {"band": 3, "kodu": 5, "zaman": "15:55", "serinumarası": "81-701-8690"},
  {"band": 0, "kodu": 19, "zaman": "11:59", "serinumarası": "42-794-1660"},
  {"band": 3, "kodu": 6, "zaman": "5:58", "serinumarası": "10-590-1977"},
  {"band": 2, "kodu": 20, "zaman": "1:23", "serinumarası": "63-904-5613"},
  {"band": 0, "kodu": 21, "zaman": "22:09", "serinumarası": "06-097-9351"},
  {"band": 3, "kodu": 3, "zaman": "17:32", "serinumarası": "03-526-5505"},
  {"band": 4, "kodu": 19, "zaman": "1:12", "serinumarası": "33-816-7556"},
  {"band": 3, "kodu": 13, "zaman": "1:20", "serinumarası": "51-823-4053"},
  {"band": 1, "kodu": 8, "zaman": "0:41", "serinumarası": "35-651-2779"},
  {"band": 1, "kodu": 8, "zaman": "6:55", "serinumarası": "19-981-1853"},
  {"band": 2, "kodu": 15, "zaman": "19:08", "serinumarası": "96-198-4645"},
  {"band": 1, "kodu": 0, "zaman": "2:16", "serinumarası": "34-920-7978"},
  {"band": 2, "kodu": 12, "zaman": "1:50", "serinumarası": "24-047-2744"},
  {"band": 0, "kodu": 9, "zaman": "13:43", "serinumarası": "59-495-0158"},
  {"band": 4, "kodu": 6, "zaman": "15:01", "serinumarası": "27-229-2364"},
  {"band": 1, "kodu": 13, "zaman": "8:32", "serinumarası": "10-704-5094"},
  {"band": 1, "kodu": 1, "zaman": "2:09", "serinumarası": "06-228-3670"},
  {"band": 3, "kodu": 20, "zaman": "13:06", "serinumarası": "76-026-6655"},
  {"band": 3, "kodu": 2, "zaman": "1:28", "serinumarası": "77-712-2788"},
  {"band": 1, "kodu": 8, "zaman": "16:59", "serinumarası": "17-212-9459"},
  {"band": 4, "kodu": 1, "zaman": "16:39", "serinumarası": "28-969-9382"},
  {"band": 2, "kodu": 7, "zaman": "18:38", "serinumarası": "18-380-6332"},
  {"band": 0, "kodu": 10, "zaman": "5:59", "serinumarası": "73-627-4739"},
  {"band": 1, "kodu": 9, "zaman": "3:53", "serinumarası": "70-058-1619"},
  {"band": 4, "kodu": 2, "zaman": "20:56", "serinumarası": "35-982-4455"},
  {"band": 0, "kodu": 8, "zaman": "5:45", "serinumarası": "71-644-5404"},
  {"band": 0, "kodu": 24, "zaman": "4:37", "serinumarası": "37-250-1784"},
  {"band": 0, "kodu": 8, "zaman": "8:44", "serinumarası": "81-649-8791"},
  {"band": 2, "kodu": 22, "zaman": "2:27", "serinumarası": "83-718-7695"},
  {"band": 0, "kodu": 13, "zaman": "22:18", "serinumarası": "51-969-1598"},
  {"band": 0, "kodu": 0, "zaman": "6:54", "serinumarası": "97-408-8149"},
  {"band": 1, "kodu": 20, "zaman": "14:04", "serinumarası": "02-011-7779"},
  {"band": 1, "kodu": 4, "zaman": "15:45", "serinumarası": "73-609-9822"},
  {"band": 4, "kodu": 10, "zaman": "6:03", "serinumarası": "94-147-5485"},
  {"band": 0, "kodu": 13, "zaman": "14:05", "serinumarası": "21-003-7142"},
  {"band": 3, "kodu": 20, "zaman": "18:38", "serinumarası": "50-101-6146"},
  {"band": 1, "kodu": 7, "zaman": "4:58", "serinumarası": "84-144-0490"},
  {"band": 3, "kodu": 7, "zaman": "9:57", "serinumarası": "55-131-0706"},
  {"band": 0, "kodu": 13, "zaman": "3:46", "serinumarası": "25-690-7710"},
  {"band": 2, "kodu": 21, "zaman": "6:46", "serinumarası": "47-382-2947"},
  {"band": 4, "kodu": 13, "zaman": "15:18", "serinumarası": "03-701-3929"},
  {"band": 2, "kodu": 12, "zaman": "10:25", "serinumarası": "11-792-2854"},
  {"band": 3, "kodu": 17, "zaman": "6:59", "serinumarası": "76-360-2083"},
  {"band": 0, "kodu": 22, "zaman": "23:36", "serinumarası": "14-070-0748"},
  {"band": 4, "kodu": 3, "zaman": "2:07", "serinumarası": "70-827-8933"},
  {"band": 3, "kodu": 23, "zaman": "2:48", "serinumarası": "85-300-4003"},
  {"band": 3, "kodu": 22, "zaman": "2:01", "serinumarası": "18-573-1026"},
  {"band": 4, "kodu": 0, "zaman": "3:51", "serinumarası": "25-196-0216"},
  {"band": 1, "kodu": 19, "zaman": "4:13", "serinumarası": "93-610-5191"},
  {"band": 1, "kodu": 4, "zaman": "5:55", "serinumarası": "34-615-2356"},
  {"band": 2, "kodu": 2, "zaman": "12:56", "serinumarası": "55-837-3588"},
  {"band": 4, "kodu": 16, "zaman": "8:55", "serinumarası": "18-162-8570"},
  {"band": 2, "kodu": 12, "zaman": "5:50", "serinumarası": "08-394-4891"},
  {"band": 4, "kodu": 16, "zaman": "11:19", "serinumarası": "64-852-1998"},
  {"band": 4, "kodu": 1, "zaman": "4:01", "serinumarası": "30-978-5818"},
  {"band": 0, "kodu": 7, "zaman": "14:18", "serinumarası": "97-163-4403"},
  {"band": 2, "kodu": 10, "zaman": "21:51", "serinumarası": "54-717-2199"},
  {"band": 1, "kodu": 24, "zaman": "13:38", "serinumarası": "64-620-2847"},
  {"band": 0, "kodu": 11, "zaman": "14:24", "serinumarası": "90-291-5979"},
  {"band": 4, "kodu": 23, "zaman": "9:35", "serinumarası": "22-224-8078"},
  {"band": 2, "kodu": 24, "zaman": "19:54", "serinumarası": "97-973-8961"},
  {"band": 0, "kodu": 2, "zaman": "8:18", "serinumarası": "94-388-7979"},
  {"band": 4, "kodu": 22, "zaman": "21:29", "serinumarası": "00-574-2941"},
  {"band": 1, "kodu": 17, "zaman": "1:20", "serinumarası": "81-692-1889"},
  {"band": 2, "kodu": 5, "zaman": "15:38", "serinumarası": "68-613-2795"},
  {"band": 2, "kodu": 17, "zaman": "13:54", "serinumarası": "28-734-5212"},
  {"band": 0, "kodu": 21, "zaman": "22:58", "serinumarası": "25-742-7296"},
  {"band": 3, "kodu": 16, "zaman": "11:55", "serinumarası": "31-730-7440"},
  {"band": 4, "kodu": 22, "zaman": "5:45", "serinumarası": "18-460-2938"},
  {"band": 0, "kodu": 19, "zaman": "20:07", "serinumarası": "84-362-9997"},
  {"band": 1, "kodu": 15, "zaman": "3:27", "serinumarası": "80-456-1938"},
  {"band": 4, "kodu": 20, "zaman": "18:51", "serinumarası": "50-807-4896"},
  {"band": 4, "kodu": 23, "zaman": "3:24", "serinumarası": "60-725-0706"},
  {"band": 1, "kodu": 5, "zaman": "11:27", "serinumarası": "75-109-5079"},
  {"band": 1, "kodu": 12, "zaman": "7:11", "serinumarası": "55-316-7825"},
  {"band": 0, "kodu": 2, "zaman": "1:29", "serinumarası": "05-470-4660"},
  {"band": 0, "kodu": 16, "zaman": "9:27", "serinumarası": "04-061-0945"},
  {"band": 4, "kodu": 13, "zaman": "16:02", "serinumarası": "21-242-5696"},
  {"band": 2, "kodu": 7, "zaman": "10:35", "serinumarası": "98-886-9531"},
  {"band": 1, "kodu": 14, "zaman": "2:26", "serinumarası": "50-389-5200"},
  {"band": 0, "kodu": 2, "zaman": "5:42", "serinumarası": "37-110-1914"},
  {"band": 4, "kodu": 21, "zaman": "7:46", "serinumarası": "77-452-8090"},
  {"band": 0, "kodu": 22, "zaman": "13:43", "serinumarası": "96-758-2492"},
  {"band": 1, "kodu": 20, "zaman": "15:11", "serinumarası": "09-842-5582"},
  {"band": 3, "kodu": 12, "zaman": "21:50", "serinumarası": "69-180-6234"},
  {"band": 0, "kodu": 4, "zaman": "10:22", "serinumarası": "41-536-8985"},
  {"band": 3, "kodu": 17, "zaman": "2:54", "serinumarası": "99-952-1634"},
  {"band": 0, "kodu": 22, "zaman": "9:58", "serinumarası": "53-526-5418"},
  {"band": 1, "kodu": 5, "zaman": "6:42", "serinumarası": "62-956-2490"},
  {"band": 4, "kodu": 0, "zaman": "13:18", "serinumarası": "05-016-8798"},
  {"band": 1, "kodu": 15, "zaman": "7:34", "serinumarası": "67-978-0043"},
  {"band": 0, "kodu": 13, "zaman": "17:01", "serinumarası": "87-617-5538"},
  {"band": 3, "kodu": 18, "zaman": "14:12", "serinumarası": "14-675-5070"},
  {"band": 1, "kodu": 20, "zaman": "0:37", "serinumarası": "28-114-0523"},
  {"band": 0, "kodu": 24, "zaman": "3:42", "serinumarası": "60-050-0912"},
  {"band": 4, "kodu": 7, "zaman": "7:25", "serinumarası": "78-681-2930"},
  {"band": 4, "kodu": 12, "zaman": "23:13", "serinumarası": "74-365-0144"},
  {"band": 4, "kodu": 7, "zaman": "7:13", "serinumarası": "41-347-3367"},
  {"band": 0, "kodu": 12, "zaman": "2:36", "serinumarası": "31-911-6497"},
  {"band": 2, "kodu": 21, "zaman": "14:13", "serinumarası": "45-875-0999"},
  {"band": 1, "kodu": 14, "zaman": "19:55", "serinumarası": "76-515-6787"},
  {"band": 1, "kodu": 9, "zaman": "16:43", "serinumarası": "71-491-0119"},
  {"band": 2, "kodu": 5, "zaman": "3:14", "serinumarası": "14-671-2038"},
  {"band": 1, "kodu": 3, "zaman": "10:55", "serinumarası": "97-864-8894"},
  {"band": 1, "kodu": 5, "zaman": "22:52", "serinumarası": "51-073-3397"},
  {"band": 3, "kodu": 18, "zaman": "20:54", "serinumarası": "59-000-7263"},
  {"band": 0, "kodu": 0, "zaman": "20:46", "serinumarası": "91-270-5582"},
  {"band": 2, "kodu": 14, "zaman": "19:21", "serinumarası": "74-013-9867"},
  {"band": 2, "kodu": 8, "zaman": "19:17", "serinumarası": "02-362-0096"},
  {"band": 3, "kodu": 15, "zaman": "13:24", "serinumarası": "30-399-2193"},
  {"band": 0, "kodu": 8, "zaman": "19:44", "serinumarası": "96-896-6449"},
  {"band": 4, "kodu": 12, "zaman": "12:06", "serinumarası": "71-228-0714"},
  {"band": 2, "kodu": 2, "zaman": "5:11", "serinumarası": "67-472-3454"},
  {"band": 0, "kodu": 24, "zaman": "11:28", "serinumarası": "45-722-3121"},
  {"band": 0, "kodu": 24, "zaman": "0:15", "serinumarası": "49-926-4414"},
  {"band": 0, "kodu": 18, "zaman": "11:44", "serinumarası": "87-074-5131"},
  {"band": 0, "kodu": 8, "zaman": "20:12", "serinumarası": "92-153-4335"},
  {"band": 0, "kodu": 13, "zaman": "22:44", "serinumarası": "40-522-3189"},
  {"band": 0, "kodu": 7, "zaman": "17:57", "serinumarası": "72-992-2964"},
  {"band": 2, "kodu": 5, "zaman": "19:26", "serinumarası": "46-488-1889"},
  {"band": 4, "kodu": 13, "zaman": "9:29", "serinumarası": "35-102-2935"},
  {"band": 2, "kodu": 17, "zaman": "13:04", "serinumarası": "10-476-2907"},
  {"band": 1, "kodu": 5, "zaman": "16:40", "serinumarası": "37-331-0853"},
  {"band": 3, "kodu": 7, "zaman": "20:10", "serinumarası": "47-191-8221"},
  {"band": 4, "kodu": 19, "zaman": "23:12", "serinumarası": "56-475-9853"},
  {"band": 4, "kodu": 2, "zaman": "7:53", "serinumarası": "71-264-8333"},
  {"band": 4, "kodu": 2, "zaman": "8:55", "serinumarası": "99-954-6616"},
  {"band": 4, "kodu": 9, "zaman": "1:17", "serinumarası": "49-876-2895"},
  {"band": 3, "kodu": 21, "zaman": "15:10", "serinumarası": "15-737-6936"},
  {"band": 4, "kodu": 3, "zaman": "7:34", "serinumarası": "89-308-6661"},
  {"band": 0, "kodu": 18, "zaman": "12:17", "serinumarası": "63-404-9991"},
  {"band": 2, "kodu": 8, "zaman": "20:01", "serinumarası": "05-714-9589"},
  {"band": 4, "kodu": 14, "zaman": "23:10", "serinumarası": "24-795-5188"},
  {"band": 0, "kodu": 10, "zaman": "21:33", "serinumarası": "04-267-0476"},
  {"band": 2, "kodu": 23, "zaman": "14:38", "serinumarası": "73-385-4331"},
  {"band": 2, "kodu": 20, "zaman": "20:29", "serinumarası": "68-706-5655"},
  {"band": 4, "kodu": 8, "zaman": "2:02", "serinumarası": "19-893-7462"},
  {"band": 0, "kodu": 24, "zaman": "0:15", "serinumarası": "38-772-1818"},
  {"band": 0, "kodu": 21, "zaman": "1:37", "serinumarası": "85-648-9188"},
  {"band": 4, "kodu": 20, "zaman": "23:04", "serinumarası": "40-878-4408"},
  {"band": 3, "kodu": 2, "zaman": "18:40", "serinumarası": "66-662-7563"},
  {"band": 2, "kodu": 0, "zaman": "18:11", "serinumarası": "25-115-4523"},
  {"band": 1, "kodu": 1, "zaman": "22:37", "serinumarası": "96-115-3525"},
  {"band": 4, "kodu": 20, "zaman": "1:28", "serinumarası": "67-058-6095"},
  {"band": 2, "kodu": 16, "zaman": "20:02", "serinumarası": "38-590-7631"},
  {"band": 1, "kodu": 16, "zaman": "6:44", "serinumarası": "47-015-2454"},
  {"band": 2, "kodu": 8, "zaman": "22:42", "serinumarası": "00-533-0953"},
  {"band": 3, "kodu": 1, "zaman": "19:24", "serinumarası": "00-340-9921"},
  {"band": 1, "kodu": 14, "zaman": "19:57", "serinumarası": "45-067-5782"},
  {"band": 0, "kodu": 19, "zaman": "11:17", "serinumarası": "03-245-5217"},
  {"band": 2, "kodu": 12, "zaman": "9:12", "serinumarası": "59-145-6458"},
  {"band": 3, "kodu": 14, "zaman": "18:33", "serinumarası": "06-168-4007"},
  {"band": 3, "kodu": 8, "zaman": "5:51", "serinumarası": "00-796-1059"},
  {"band": 1, "kodu": 3, "zaman": "7:35", "serinumarası": "24-032-2789"},
  {"band": 1, "kodu": 11, "zaman": "22:55", "serinumarası": "67-524-7305"},
  {"band": 0, "kodu": 24, "zaman": "2:33", "serinumarası": "00-950-5289"},
  {"band": 0, "kodu": 12, "zaman": "2:03", "serinumarası": "65-089-8871"},
  {"band": 2, "kodu": 20, "zaman": "6:04", "serinumarası": "81-527-2422"},
  {"band": 2, "kodu": 8, "zaman": "23:39", "serinumarası": "45-873-3768"},
  {"band": 1, "kodu": 11, "zaman": "1:33", "serinumarası": "60-254-8911"},
  {"band": 4, "kodu": 10, "zaman": "14:10", "serinumarası": "89-464-3057"},
  {"band": 1, "kodu": 4, "zaman": "22:56", "serinumarası": "95-924-0849"},
  {"band": 1, "kodu": 17, "zaman": "14:18", "serinumarası": "08-397-8571"},
  {"band": 4, "kodu": 22, "zaman": "18:04", "serinumarası": "67-655-6700"},
  {"band": 3, "kodu": 4, "zaman": "13:56", "serinumarası": "94-743-6644"},
  {"band": 3, "kodu": 19, "zaman": "19:58", "serinumarası": "17-667-6626"},
  {"band": 4, "kodu": 19, "zaman": "22:08", "serinumarası": "25-186-4402"},
  {"band": 1, "kodu": 18, "zaman": "19:38", "serinumarası": "63-772-2788"},
  {"band": 2, "kodu": 13, "zaman": "0:08", "serinumarası": "58-895-0554"},
  {"band": 3, "kodu": 24, "zaman": "18:38", "serinumarası": "35-196-9580"},
  {"band": 3, "kodu": 14, "zaman": "7:16", "serinumarası": "48-467-6300"},
  {"band": 2, "kodu": 4, "zaman": "1:22", "serinumarası": "57-047-7156"},
  {"band": 2, "kodu": 11, "zaman": "7:25", "serinumarası": "52-206-7085"},
  {"band": 4, "kodu": 7, "zaman": "15:13", "serinumarası": "28-950-1700"},
  {"band": 0, "kodu": 7, "zaman": "14:45", "serinumarası": "95-272-2535"},
  {"band": 1, "kodu": 14, "zaman": "6:25", "serinumarası": "97-236-6332"},
  {"band": 1, "kodu": 0, "zaman": "22:53", "serinumarası": "09-341-5029"},
  {"band": 2, "kodu": 1, "zaman": "16:10", "serinumarası": "49-776-8936"},
  {"band": 4, "kodu": 5, "zaman": "17:12", "serinumarası": "95-096-9045"},
  {"band": 1, "kodu": 4, "zaman": "8:31", "serinumarası": "64-747-2470"},
  {"band": 0, "kodu": 14, "zaman": "11:27", "serinumarası": "30-863-3304"},
  {"band": 4, "kodu": 18, "zaman": "22:34", "serinumarası": "42-425-3975"},
  {"band": 0, "kodu": 9, "zaman": "5:28", "serinumarası": "49-812-4995"},
  {"band": 3, "kodu": 7, "zaman": "13:49", "serinumarası": "23-320-4729"},
  {"band": 4, "kodu": 5, "zaman": "10:06", "serinumarası": "41-427-8379"},
  {"band": 2, "kodu": 4, "zaman": "18:56", "serinumarası": "78-091-6658"},
  {"band": 3, "kodu": 9, "zaman": "14:43", "serinumarası": "47-583-2902"},
  {"band": 2, "kodu": 22, "zaman": "1:00", "serinumarası": "75-105-8334"},
  {"band": 1, "kodu": 9, "zaman": "0:29", "serinumarası": "73-827-5555"},
  {"band": 3, "kodu": 7, "zaman": "5:44", "serinumarası": "72-125-9107"},
  {"band": 2, "kodu": 6, "zaman": "7:31", "serinumarası": "39-604-1792"},
  {"band": 1, "kodu": 12, "zaman": "13:06", "serinumarası": "25-402-8647"},
  {"band": 3, "kodu": 24, "zaman": "10:58", "serinumarası": "71-824-0306"},
  {"band": 0, "kodu": 11, "zaman": "8:20", "serinumarası": "93-023-1188"},
  {"band": 3, "kodu": 15, "zaman": "2:21", "serinumarası": "38-390-9943"},
  {"band": 4, "kodu": 17, "zaman": "21:40", "serinumarası": "60-854-4189"},
  {"band": 0, "kodu": 22, "zaman": "21:01", "serinumarası": "18-166-6060"},
  {"band": 1, "kodu": 2, "zaman": "13:34", "serinumarası": "04-853-8938"},
  {"band": 0, "kodu": 21, "zaman": "20:07", "serinumarası": "50-816-6573"},
  {"band": 1, "kodu": 18, "zaman": "19:53", "serinumarası": "32-041-5641"},
  {"band": 0, "kodu": 24, "zaman": "5:25", "serinumarası": "10-518-8737"},
  {"band": 0, "kodu": 9, "zaman": "4:24", "serinumarası": "39-466-6166"},
  {"band": 1, "kodu": 10, "zaman": "7:59", "serinumarası": "56-415-5986"},
  {"band": 3, "kodu": 20, "zaman": "20:21", "serinumarası": "60-330-0171"},
  {"band": 2, "kodu": 21, "zaman": "3:58", "serinumarası": "39-062-8860"},
  {"band": 3, "kodu": 16, "zaman": "19:36", "serinumarası": "47-221-2668"},
  {"band": 4, "kodu": 3, "zaman": "15:21", "serinumarası": "97-578-2927"},
  {"band": 0, "kodu": 10, "zaman": "12:09", "serinumarası": "23-463-8530"},
  {"band": 1, "kodu": 19, "zaman": "21:35", "serinumarası": "49-317-4715"},
  {"band": 3, "kodu": 11, "zaman": "20:26", "serinumarası": "66-467-6832"},
  {"band": 3, "kodu": 3, "zaman": "8:21", "serinumarası": "12-331-2927"},
  {"band": 0, "kodu": 15, "zaman": "15:59", "serinumarası": "77-293-4554"},
  {"band": 1, "kodu": 6, "zaman": "5:28", "serinumarası": "12-735-4286"},
  {"band": 1, "kodu": 20, "zaman": "22:30", "serinumarası": "45-379-7248"},
  {"band": 3, "kodu": 23, "zaman": "12:36", "serinumarası": "23-829-7512"},
  {"band": 1, "kodu": 8, "zaman": "6:21", "serinumarası": "88-291-4027"},
  {"band": 1, "kodu": 17, "zaman": "9:13", "serinumarası": "44-088-8374"},
  {"band": 0, "kodu": 21, "zaman": "20:26", "serinumarası": "33-032-5058"},
  {"band": 0, "kodu": 20, "zaman": "8:11", "serinumarası": "50-150-7231"},
  {"band": 1, "kodu": 4, "zaman": "4:01", "serinumarası": "78-640-5930"},
  {"band": 2, "kodu": 21, "zaman": "9:43", "serinumarası": "23-242-9478"},
  {"band": 1, "kodu": 14, "zaman": "10:26", "serinumarası": "84-324-1885"},
  {"band": 2, "kodu": 24, "zaman": "1:10", "serinumarası": "09-401-1945"},
  {"band": 3, "kodu": 12, "zaman": "1:13", "serinumarası": "04-544-5814"},
  {"band": 4, "kodu": 15, "zaman": "5:10", "serinumarası": "08-022-9389"},
  {"band": 3, "kodu": 1, "zaman": "4:25", "serinumarası": "32-752-0429"},
  {"band": 4, "kodu": 9, "zaman": "1:17", "serinumarası": "47-714-4597"},
  {"band": 0, "kodu": 21, "zaman": "3:33", "serinumarası": "43-468-1534"},
  {"band": 1, "kodu": 24, "zaman": "11:58", "serinumarası": "89-321-2921"},
  {"band": 1, "kodu": 10, "zaman": "2:21", "serinumarası": "11-638-7669"},
  {"band": 1, "kodu": 18, "zaman": "11:58", "serinumarası": "84-661-1390"},
  {"band": 3, "kodu": 6, "zaman": "21:17", "serinumarası": "37-201-8004"},
  {"band": 4, "kodu": 15, "zaman": "20:24", "serinumarası": "50-493-4605"},
  {"band": 1, "kodu": 1, "zaman": "20:06", "serinumarası": "03-586-8628"},
  {"band": 3, "kodu": 7, "zaman": "4:14", "serinumarası": "69-455-0367"},
  {"band": 1, "kodu": 17, "zaman": "22:00", "serinumarası": "31-992-7254"},
  {"band": 4, "kodu": 14, "zaman": "17:27", "serinumarası": "29-895-6767"},
  {"band": 3, "kodu": 24, "zaman": "19:22", "serinumarası": "39-304-1858"},
  {"band": 0, "kodu": 3, "zaman": "21:28", "serinumarası": "57-562-0275"},
  {"band": 2, "kodu": 5, "zaman": "7:17", "serinumarası": "78-129-6321"},
  {"band": 3, "kodu": 3, "zaman": "21:14", "serinumarası": "28-147-4480"},
  {"band": 1, "kodu": 3, "zaman": "13:38", "serinumarası": "54-142-8567"},
  {"band": 2, "kodu": 5, "zaman": "19:07", "serinumarası": "52-186-0236"},
  {"band": 4, "kodu": 1, "zaman": "18:39", "serinumarası": "83-955-4596"},
  {"band": 2, "kodu": 13, "zaman": "2:57", "serinumarası": "83-744-2446"},
  {"band": 4, "kodu": 5, "zaman": "20:37", "serinumarası": "71-831-4528"},
  {"band": 0, "kodu": 11, "zaman": "11:53", "serinumarası": "55-286-0960"},
  {"band": 0, "kodu": 1, "zaman": "19:31", "serinumarası": "29-270-6861"},
  {"band": 2, "kodu": 22, "zaman": "3:53", "serinumarası": "26-566-0429"},
  {"band": 3, "kodu": 24, "zaman": "16:40", "serinumarası": "67-258-3266"},
  {"band": 3, "kodu": 16, "zaman": "9:54", "serinumarası": "15-515-6682"},
  {"band": 3, "kodu": 4, "zaman": "20:28", "serinumarası": "92-534-3300"},
  {"band": 3, "kodu": 11, "zaman": "10:51", "serinumarası": "23-859-1133"},
  {"band": 2, "kodu": 7, "zaman": "15:27", "serinumarası": "56-781-2326"},
  {"band": 1, "kodu": 2, "zaman": "20:35", "serinumarası": "01-878-1110"},
  {"band": 1, "kodu": 12, "zaman": "8:10", "serinumarası": "11-144-3367"},
  {"band": 1, "kodu": 2, "zaman": "3:16", "serinumarası": "52-614-1305"},
  {"band": 1, "kodu": 18, "zaman": "5:33", "serinumarası": "10-125-4574"},
  {"band": 0, "kodu": 21, "zaman": "17:09", "serinumarası": "85-970-0967"},
  {"band": 2, "kodu": 4, "zaman": "5:00", "serinumarası": "67-388-5631"},
  {"band": 2, "kodu": 13, "zaman": "10:31", "serinumarası": "21-838-9014"},
  {"band": 2, "kodu": 14, "zaman": "14:35", "serinumarası": "39-596-8947"},
  {"band": 2, "kodu": 20, "zaman": "0:16", "serinumarası": "83-048-7618"},
  {"band": 2, "kodu": 4, "zaman": "13:23", "serinumarası": "80-810-9426"},
  {"band": 3, "kodu": 23, "zaman": "22:07", "serinumarası": "44-768-5958"},
  {"band": 2, "kodu": 21, "zaman": "18:42", "serinumarası": "99-146-1789"},
  {"band": 1, "kodu": 18, "zaman": "9:52", "serinumarası": "74-550-4793"},
  {"band": 1, "kodu": 5, "zaman": "4:11", "serinumarası": "93-042-9009"},
  {"band": 3, "kodu": 8, "zaman": "7:46", "serinumarası": "84-679-0141"},
  {"band": 1, "kodu": 22, "zaman": "13:48", "serinumarası": "05-173-9616"},
  {"band": 0, "kodu": 3, "zaman": "8:52", "serinumarası": "31-025-7569"},
  {"band": 0, "kodu": 15, "zaman": "18:03", "serinumarası": "80-843-5062"},
  {"band": 4, "kodu": 5, "zaman": "20:24", "serinumarası": "41-171-1929"},
  {"band": 0, "kodu": 17, "zaman": "21:53", "serinumarası": "89-518-8420"},
  {"band": 0, "kodu": 19, "zaman": "23:07", "serinumarası": "72-650-1528"},
  {"band": 3, "kodu": 5, "zaman": "17:49", "serinumarası": "50-659-8476"},
  {"band": 0, "kodu": 13, "zaman": "6:26", "serinumarası": "05-418-2915"},
  {"band": 2, "kodu": 18, "zaman": "17:15", "serinumarası": "38-131-4969"},
  {"band": 2, "kodu": 10, "zaman": "19:45", "serinumarası": "64-555-1089"},
  {"band": 4, "kodu": 13, "zaman": "22:49", "serinumarası": "71-110-7194"},
  {"band": 0, "kodu": 13, "zaman": "21:21", "serinumarası": "39-591-5492"},
  {"band": 1, "kodu": 12, "zaman": "6:46", "serinumarası": "21-579-8294"},
  {"band": 1, "kodu": 10, "zaman": "12:35", "serinumarası": "03-304-3184"},
  {"band": 3, "kodu": 13, "zaman": "21:00", "serinumarası": "88-749-4757"},
  {"band": 0, "kodu": 8, "zaman": "19:57", "serinumarası": "65-841-6526"},
  {"band": 0, "kodu": 20, "zaman": "1:44", "serinumarası": "37-299-8628"},
  {"band": 2, "kodu": 10, "zaman": "22:48", "serinumarası": "27-074-3046"},
  {"band": 2, "kodu": 3, "zaman": "2:57", "serinumarası": "95-395-6807"},
  {"band": 0, "kodu": 0, "zaman": "6:44", "serinumarası": "45-358-5075"},
  {"band": 0, "kodu": 21, "zaman": "0:11", "serinumarası": "00-009-3894"},
  {"band": 1, "kodu": 13, "zaman": "23:29", "serinumarası": "44-931-2949"},
  {"band": 2, "kodu": 23, "zaman": "23:22", "serinumarası": "32-294-7550"},
  {"band": 3, "kodu": 19, "zaman": "9:31", "serinumarası": "97-819-9377"},
  {"band": 2, "kodu": 1, "zaman": "19:21", "serinumarası": "16-304-5045"},
  {"band": 4, "kodu": 16, "zaman": "9:54", "serinumarası": "38-135-5774"},
  {"band": 1, "kodu": 4, "zaman": "10:29", "serinumarası": "68-872-1458"},
  {"band": 4, "kodu": 2, "zaman": "16:12", "serinumarası": "75-585-5433"},
  {"band": 0, "kodu": 12, "zaman": "17:47", "serinumarası": "24-051-2378"},
  {"band": 4, "kodu": 15, "zaman": "17:44", "serinumarası": "03-027-6225"},
  {"band": 0, "kodu": 17, "zaman": "12:43", "serinumarası": "89-690-2703"},
  {"band": 4, "kodu": 19, "zaman": "14:15", "serinumarası": "88-024-6357"},
  {"band": 1, "kodu": 17, "zaman": "8:59", "serinumarası": "09-189-6348"},
  {"band": 4, "kodu": 12, "zaman": "1:00", "serinumarası": "54-477-3605"},
  {"band": 1, "kodu": 16, "zaman": "19:29", "serinumarası": "99-379-0879"},
  {"band": 1, "kodu": 13, "zaman": "20:39", "serinumarası": "27-597-0647"},
  {"band": 2, "kodu": 2, "zaman": "5:46", "serinumarası": "81-240-3238"},
  {"band": 0, "kodu": 6, "zaman": "1:45", "serinumarası": "72-063-5119"},
  {"band": 0, "kodu": 22, "zaman": "8:31", "serinumarası": "53-270-0989"},
  {"band": 2, "kodu": 2, "zaman": "22:21", "serinumarası": "54-505-0881"},
  {"band": 3, "kodu": 18, "zaman": "7:45", "serinumarası": "80-113-1106"},
  {"band": 3, "kodu": 14, "zaman": "8:19", "serinumarası": "78-266-3155"},
  {"band": 2, "kodu": 11, "zaman": "2:51", "serinumarası": "87-485-4801"},
  {"band": 2, "kodu": 12, "zaman": "20:17", "serinumarası": "68-814-5745"},
  {"band": 2, "kodu": 11, "zaman": "18:03", "serinumarası": "95-787-2565"},
  {"band": 2, "kodu": 19, "zaman": "13:37", "serinumarası": "16-934-9974"},
  {"band": 2, "kodu": 4, "zaman": "4:55", "serinumarası": "89-338-7434"},
  {"band": 3, "kodu": 9, "zaman": "20:16", "serinumarası": "34-467-2494"},
  {"band": 3, "kodu": 19, "zaman": "9:34", "serinumarası": "86-843-5549"},
  {"band": 2, "kodu": 19, "zaman": "11:27", "serinumarası": "82-024-5575"},
  {"band": 4, "kodu": 0, "zaman": "9:23", "serinumarası": "19-864-2239"},
  {"band": 2, "kodu": 11, "zaman": "23:29", "serinumarası": "21-565-3051"},
  {"band": 3, "kodu": 19, "zaman": "19:53", "serinumarası": "82-455-8324"},
  {"band": 0, "kodu": 17, "zaman": "6:46", "serinumarası": "63-616-4389"},
  {"band": 1, "kodu": 4, "zaman": "13:24", "serinumarası": "41-491-2940"},
  {"band": 4, "kodu": 19, "zaman": "1:39", "serinumarası": "76-045-0500"},
  {"band": 0, "kodu": 1, "zaman": "3:10", "serinumarası": "74-096-1241"},
  {"band": 3, "kodu": 23, "zaman": "2:59", "serinumarası": "27-436-4361"},
  {"band": 4, "kodu": 3, "zaman": "4:02", "serinumarası": "83-036-3037"},
  {"band": 0, "kodu": 10, "zaman": "15:23", "serinumarası": "21-062-9898"},
  {"band": 0, "kodu": 1, "zaman": "18:15", "serinumarası": "78-488-2046"},
  {"band": 3, "kodu": 17, "zaman": "15:01", "serinumarası": "64-216-8142"},
  {"band": 2, "kodu": 0, "zaman": "21:59", "serinumarası": "74-945-4175"},
  {"band": 1, "kodu": 21, "zaman": "23:46", "serinumarası": "03-158-3575"},
  {"band": 0, "kodu": 7, "zaman": "13:05", "serinumarası": "79-914-1925"},
  {"band": 0, "kodu": 3, "zaman": "6:13", "serinumarası": "41-432-4305"},
  {"band": 3, "kodu": 9, "zaman": "18:53", "serinumarası": "76-300-0200"},
  {"band": 2, "kodu": 1, "zaman": "11:57", "serinumarası": "54-074-1784"},
  {"band": 0, "kodu": 19, "zaman": "2:20", "serinumarası": "83-829-8749"},
  {"band": 4, "kodu": 21, "zaman": "7:55", "serinumarası": "39-303-2485"},
  {"band": 4, "kodu": 20, "zaman": "21:28", "serinumarası": "06-504-4375"},
  {"band": 0, "kodu": 19, "zaman": "0:17", "serinumarası": "10-412-0868"},
  {"band": 3, "kodu": 24, "zaman": "2:29", "serinumarası": "17-600-3369"},
  {"band": 4, "kodu": 6, "zaman": "10:08", "serinumarası": "31-704-5926"},
  {"band": 4, "kodu": 9, "zaman": "13:45", "serinumarası": "22-825-7965"},
  {"band": 4, "kodu": 11, "zaman": "12:06", "serinumarası": "00-330-1693"},
  {"band": 3, "kodu": 0, "zaman": "22:48", "serinumarası": "40-428-7318"},
  {"band": 1, "kodu": 0, "zaman": "12:21", "serinumarası": "20-225-6426"},
  {"band": 0, "kodu": 22, "zaman": "2:02", "serinumarası": "39-372-6288"},
  {"band": 0, "kodu": 5, "zaman": "8:24", "serinumarası": "58-334-4510"},
  {"band": 1, "kodu": 23, "zaman": "2:56", "serinumarası": "10-464-6735"},
  {"band": 3, "kodu": 20, "zaman": "9:44", "serinumarası": "87-533-9316"},
  {"band": 1, "kodu": 16, "zaman": "9:29", "serinumarası": "27-140-2406"},
  {"band": 1, "kodu": 11, "zaman": "14:55", "serinumarası": "72-215-4532"},
  {"band": 1, "kodu": 19, "zaman": "4:40", "serinumarası": "17-238-9431"},
  {"band": 1, "kodu": 0, "zaman": "6:03", "serinumarası": "12-645-9973"},
  {"band": 2, "kodu": 24, "zaman": "15:49", "serinumarası": "61-098-4778"},
  {"band": 3, "kodu": 16, "zaman": "9:13", "serinumarası": "55-966-6296"},
  {"band": 2, "kodu": 7, "zaman": "8:37", "serinumarası": "12-856-0925"},
  {"band": 3, "kodu": 13, "zaman": "20:37", "serinumarası": "64-065-8544"},
  {"band": 0, "kodu": 4, "zaman": "6:03", "serinumarası": "90-758-9211"},
  {"band": 0, "kodu": 11, "zaman": "12:09", "serinumarası": "00-027-4609"},
  {"band": 2, "kodu": 0, "zaman": "20:04", "serinumarası": "06-291-8763"},
  {"band": 3, "kodu": 10, "zaman": "14:34", "serinumarası": "77-684-8318"},
  {"band": 3, "kodu": 17, "zaman": "13:23", "serinumarası": "90-971-7925"},
  {"band": 0, "kodu": 21, "zaman": "20:47", "serinumarası": "00-698-5977"},
  {"band": 0, "kodu": 9, "zaman": "7:00", "serinumarası": "36-017-0164"},
  {"band": 0, "kodu": 19, "zaman": "15:46", "serinumarası": "53-497-6648"},
  {"band": 3, "kodu": 10, "zaman": "19:46", "serinumarası": "05-714-0491"},
  {"band": 4, "kodu": 14, "zaman": "17:00", "serinumarası": "76-030-6995"},
  {"band": 2, "kodu": 2, "zaman": "18:12", "serinumarası": "87-392-3462"},
  {"band": 2, "kodu": 5, "zaman": "16:58", "serinumarası": "07-392-5137"},
  {"band": 4, "kodu": 5, "zaman": "5:42", "serinumarası": "13-018-4802"},
  {"band": 2, "kodu": 18, "zaman": "17:44", "serinumarası": "56-904-8294"},
  {"band": 2, "kodu": 9, "zaman": "11:20", "serinumarası": "57-619-2202"},
  {"band": 3, "kodu": 2, "zaman": "9:51", "serinumarası": "29-484-3149"},
  {"band": 0, "kodu": 18, "zaman": "6:00", "serinumarası": "33-659-0467"},
  {"band": 3, "kodu": 4, "zaman": "6:32", "serinumarası": "43-179-5742"},
  {"band": 1, "kodu": 11, "zaman": "3:32", "serinumarası": "46-469-5852"},
  {"band": 2, "kodu": 23, "zaman": "11:48", "serinumarası": "63-450-2519"},
  {"band": 1, "kodu": 20, "zaman": "23:25", "serinumarası": "02-403-8716"},
  {"band": 1, "kodu": 11, "zaman": "6:56", "serinumarası": "08-330-6637"},
  {"band": 2, "kodu": 23, "zaman": "16:29", "serinumarası": "97-416-4562"},
  {"band": 1, "kodu": 6, "zaman": "18:09", "serinumarası": "64-258-1566"},
  {"band": 4, "kodu": 1, "zaman": "6:17", "serinumarası": "83-815-8231"},
  {"band": 0, "kodu": 15, "zaman": "12:25", "serinumarası": "16-195-2359"},
  {"band": 3, "kodu": 18, "zaman": "20:24", "serinumarası": "02-823-0719"},
  {"band": 0, "kodu": 24, "zaman": "21:54", "serinumarası": "09-927-3230"},
  {"band": 4, "kodu": 12, "zaman": "10:12", "serinumarası": "30-943-3231"},
  {"band": 4, "kodu": 10, "zaman": "19:31", "serinumarası": "92-131-1963"},
  {"band": 1, "kodu": 17, "zaman": "5:29", "serinumarası": "55-495-0766"},
  {"band": 0, "kodu": 7, "zaman": "7:33", "serinumarası": "39-977-9059"},
  {"band": 4, "kodu": 15, "zaman": "9:09", "serinumarası": "83-667-0242"},
  {"band": 1, "kodu": 19, "zaman": "3:05", "serinumarası": "75-939-1908"},
  {"band": 4, "kodu": 16, "zaman": "12:39", "serinumarası": "64-401-7856"},
  {"band": 1, "kodu": 7, "zaman": "7:49", "serinumarası": "44-850-3231"},
  {"band": 2, "kodu": 3, "zaman": "2:32", "serinumarası": "08-019-3606"},
  {"band": 4, "kodu": 13, "zaman": "4:15", "serinumarası": "80-165-7456"},
  {"band": 2, "kodu": 18, "zaman": "19:31", "serinumarası": "39-807-1748"},
  {"band": 3, "kodu": 0, "zaman": "5:24", "serinumarası": "52-890-3062"},
  {"band": 2, "kodu": 22, "zaman": "16:33", "serinumarası": "21-251-6024"},
  {"band": 1, "kodu": 3, "zaman": "1:44", "serinumarası": "75-269-3207"},
  {"band": 0, "kodu": 11, "zaman": "5:08", "serinumarası": "83-207-9002"},
  {"band": 4, "kodu": 20, "zaman": "3:07", "serinumarası": "32-298-0483"},
  {"band": 0, "kodu": 3, "zaman": "11:39", "serinumarası": "28-381-7234"},
  {"band": 2, "kodu": 8, "zaman": "22:02", "serinumarası": "26-481-3073"},
  {"band": 0, "kodu": 9, "zaman": "23:11", "serinumarası": "79-568-4640"},
  {"band": 0, "kodu": 15, "zaman": "9:50", "serinumarası": "07-080-3720"},
  {"band": 3, "kodu": 9, "zaman": "8:29", "serinumarası": "05-331-0720"},
  {"band": 4, "kodu": 13, "zaman": "14:14", "serinumarası": "21-607-7786"},
  {"band": 0, "kodu": 2, "zaman": "3:49", "serinumarası": "93-432-1660"},
  {"band": 2, "kodu": 20, "zaman": "5:45", "serinumarası": "37-819-7935"},
  {"band": 2, "kodu": 1, "zaman": "4:53", "serinumarası": "75-699-9660"},
  {"band": 2, "kodu": 4, "zaman": "6:53", "serinumarası": "78-149-7727"},
  {"band": 2, "kodu": 15, "zaman": "2:48", "serinumarası": "45-756-6233"},
  {"band": 0, "kodu": 6, "zaman": "4:05", "serinumarası": "80-851-1027"},
  {"band": 3, "kodu": 2, "zaman": "19:37", "serinumarası": "28-115-0752"},
  {"band": 3, "kodu": 10, "zaman": "6:22", "serinumarası": "53-562-3789"},
  {"band": 4, "kodu": 15, "zaman": "12:22", "serinumarası": "58-781-3475"},
  {"band": 4, "kodu": 10, "zaman": "18:15", "serinumarası": "28-781-4957"},
  {"band": 2, "kodu": 21, "zaman": "22:45", "serinumarası": "25-276-8070"},
  {"band": 2, "kodu": 10, "zaman": "4:18", "serinumarası": "51-566-3400"},
  {"band": 2, "kodu": 22, "zaman": "16:29", "serinumarası": "75-749-0270"},
  {"band": 4, "kodu": 10, "zaman": "19:59", "serinumarası": "02-211-9821"},
  {"band": 1, "kodu": 4, "zaman": "11:47", "serinumarası": "44-195-9831"},
  {"band": 4, "kodu": 16, "zaman": "12:14", "serinumarası": "91-398-3961"},
  {"band": 2, "kodu": 18, "zaman": "6:04", "serinumarası": "25-998-4805"},
  {"band": 4, "kodu": 14, "zaman": "7:48", "serinumarası": "70-320-5936"},
  {"band": 0, "kodu": 24, "zaman": "3:32", "serinumarası": "36-017-6582"},
  {"band": 3, "kodu": 14, "zaman": "22:11", "serinumarası": "69-572-7334"},
  {"band": 4, "kodu": 16, "zaman": "7:27", "serinumarası": "81-921-5391"},
  {"band": 2, "kodu": 3, "zaman": "15:06", "serinumarası": "72-499-3255"},
  {"band": 2, "kodu": 20, "zaman": "13:28", "serinumarası": "06-587-1945"},
  {"band": 2, "kodu": 17, "zaman": "16:03", "serinumarası": "48-609-6989"},
  {"band": 3, "kodu": 13, "zaman": "22:48", "serinumarası": "04-443-2988"},
  {"band": 3, "kodu": 17, "zaman": "16:40", "serinumarası": "74-392-7540"},
  {"band": 3, "kodu": 9, "zaman": "18:17", "serinumarası": "76-131-9444"},
  {"band": 0, "kodu": 17, "zaman": "18:30", "serinumarası": "37-641-0406"},
  {"band": 4, "kodu": 15, "zaman": "12:23", "serinumarası": "73-154-2915"},
  {"band": 3, "kodu": 5, "zaman": "4:28", "serinumarası": "10-131-4795"},
  {"band": 3, "kodu": 10, "zaman": "15:05", "serinumarası": "86-268-4306"},
  {"band": 3, "kodu": 11, "zaman": "20:22", "serinumarası": "39-073-6806"},
  {"band": 1, "kodu": 23, "zaman": "21:29", "serinumarası": "89-962-3935"},
  {"band": 1, "kodu": 11, "zaman": "16:50", "serinumarası": "95-434-9692"},
  {"band": 2, "kodu": 0, "zaman": "16:10", "serinumarası": "75-363-7790"},
  {"band": 0, "kodu": 5, "zaman": "16:12", "serinumarası": "34-887-6213"},
  {"band": 1, "kodu": 1, "zaman": "17:51", "serinumarası": "53-062-2061"},
  {"band": 0, "kodu": 12, "zaman": "19:54", "serinumarası": "97-246-6865"},
  {"band": 2, "kodu": 3, "zaman": "14:55", "serinumarası": "35-837-7442"},
  {"band": 4, "kodu": 23, "zaman": "3:48", "serinumarası": "66-742-1614"},
  {"band": 3, "kodu": 17, "zaman": "0:46", "serinumarası": "28-460-0901"},
  {"band": 0, "kodu": 12, "zaman": "5:17", "serinumarası": "79-137-0486"},
  {"band": 3, "kodu": 24, "zaman": "22:50", "serinumarası": "57-444-0076"},
  {"band": 2, "kodu": 11, "zaman": "0:36", "serinumarası": "69-989-1347"},
  {"band": 4, "kodu": 9, "zaman": "15:09", "serinumarası": "93-256-7194"},
  {"band": 3, "kodu": 24, "zaman": "11:00", "serinumarası": "97-742-2874"},
  {"band": 1, "kodu": 4, "zaman": "20:45", "serinumarası": "44-140-1885"},
  {"band": 1, "kodu": 6, "zaman": "10:26", "serinumarası": "90-717-5063"},
  {"band": 1, "kodu": 9, "zaman": "12:48", "serinumarası": "35-625-4201"},
  {"band": 0, "kodu": 21, "zaman": "13:27", "serinumarası": "70-985-3368"},
  {"band": 0, "kodu": 1, "zaman": "6:47", "serinumarası": "14-390-1417"},
  {"band": 1, "kodu": 1, "zaman": "10:48", "serinumarası": "62-930-1788"},
  {"band": 2, "kodu": 5, "zaman": "11:26", "serinumarası": "79-110-0272"},
  {"band": 4, "kodu": 19, "zaman": "21:13", "serinumarası": "75-095-8546"},
  {"band": 4, "kodu": 23, "zaman": "17:27", "serinumarası": "10-027-2417"},
  {"band": 3, "kodu": 7, "zaman": "23:04", "serinumarası": "83-064-3600"},
  {"band": 3, "kodu": 8, "zaman": "20:33", "serinumarası": "66-295-8929"},
  {"band": 1, "kodu": 4, "zaman": "18:10", "serinumarası": "53-715-4882"},
  {"band": 4, "kodu": 11, "zaman": "19:24", "serinumarası": "90-795-5253"},
  {"band": 3, "kodu": 7, "zaman": "19:19", "serinumarası": "87-263-0562"},
  {"band": 2, "kodu": 19, "zaman": "6:54", "serinumarası": "99-217-3123"},
  {"band": 2, "kodu": 16, "zaman": "19:58", "serinumarası": "80-704-8807"},
  {"band": 1, "kodu": 23, "zaman": "9:18", "serinumarası": "67-646-3199"},
  {"band": 0, "kodu": 16, "zaman": "10:50", "serinumarası": "69-221-7513"},
  {"band": 2, "kodu": 10, "zaman": "3:12", "serinumarası": "76-139-5672"},
  {"band": 0, "kodu": 10, "zaman": "9:07", "serinumarası": "69-505-2511"},
  {"band": 4, "kodu": 23, "zaman": "4:00", "serinumarası": "05-482-6008"},
  {"band": 0, "kodu": 9, "zaman": "16:24", "serinumarası": "71-466-7173"},
  {"band": 4, "kodu": 24, "zaman": "15:06", "serinumarası": "55-412-6315"},
  {"band": 2, "kodu": 20, "zaman": "23:29", "serinumarası": "46-011-9474"},
  {"band": 3, "kodu": 12, "zaman": "16:01", "serinumarası": "57-592-1054"},
  {"band": 3, "kodu": 9, "zaman": "19:10", "serinumarası": "92-943-3954"},
  {"band": 3, "kodu": 11, "zaman": "2:53", "serinumarası": "00-113-2377"},
  {"band": 1, "kodu": 1, "zaman": "23:17", "serinumarası": "60-212-7033"},
  {"band": 1, "kodu": 11, "zaman": "8:11", "serinumarası": "92-604-0626"},
  {"band": 3, "kodu": 3, "zaman": "19:18", "serinumarası": "73-281-1135"},
  {"band": 1, "kodu": 16, "zaman": "5:41", "serinumarası": "72-077-6780"},
  {"band": 2, "kodu": 13, "zaman": "18:49", "serinumarası": "79-639-0813"},
  {"band": 1, "kodu": 20, "zaman": "5:22", "serinumarası": "47-161-8768"},
  {"band": 1, "kodu": 24, "zaman": "8:32", "serinumarası": "02-610-1085"},
  {"band": 4, "kodu": 17, "zaman": "16:10", "serinumarası": "63-815-1950"},
  {"band": 2, "kodu": 8, "zaman": "3:16", "serinumarası": "20-788-9723"},
  {"band": 3, "kodu": 20, "zaman": "3:08", "serinumarası": "57-693-0018"},
  {"band": 4, "kodu": 14, "zaman": "9:14", "serinumarası": "85-155-6855"},
  {"band": 3, "kodu": 14, "zaman": "17:51", "serinumarası": "83-386-1460"},
  {"band": 1, "kodu": 12, "zaman": "12:29", "serinumarası": "05-530-1592"},
  {"band": 0, "kodu": 3, "zaman": "12:13", "serinumarası": "34-737-9558"},
  {"band": 4, "kodu": 17, "zaman": "18:37", "serinumarası": "98-452-3317"},
  {"band": 3, "kodu": 23, "zaman": "4:14", "serinumarası": "43-284-6338"},
  {"band": 4, "kodu": 6, "zaman": "6:20", "serinumarası": "77-842-6499"},
  {"band": 1, "kodu": 15, "zaman": "4:52", "serinumarası": "31-204-5792"},
  {"band": 2, "kodu": 17, "zaman": "11:14", "serinumarası": "69-598-3894"},
  {"band": 2, "kodu": 9, "zaman": "14:29", "serinumarası": "10-190-5130"},
  {"band": 2, "kodu": 3, "zaman": "21:01", "serinumarası": "72-776-1801"},
  {"band": 4, "kodu": 13, "zaman": "18:11", "serinumarası": "73-241-6262"},
  {"band": 2, "kodu": 4, "zaman": "16:06", "serinumarası": "10-690-5701"},
  {"band": 0, "kodu": 23, "zaman": "14:19", "serinumarası": "37-449-3494"},
  {"band": 4, "kodu": 16, "zaman": "7:31", "serinumarası": "09-926-3539"},
  {"band": 4, "kodu": 20, "zaman": "12:06", "serinumarası": "56-069-3512"},
  {"band": 3, "kodu": 23, "zaman": "19:55", "serinumarası": "77-537-5584"},
  {"band": 0, "kodu": 4, "zaman": "7:48", "serinumarası": "61-830-8443"},
  {"band": 4, "kodu": 9, "zaman": "18:07", "serinumarası": "81-479-2827"},
  {"band": 1, "kodu": 18, "zaman": "22:05", "serinumarası": "50-775-6403"},
  {"band": 0, "kodu": 18, "zaman": "14:09", "serinumarası": "27-388-8038"},
  {"band": 2, "kodu": 13, "zaman": "6:46", "serinumarası": "59-254-3792"},
  {"band": 3, "kodu": 14, "zaman": "7:04", "serinumarası": "73-277-3312"},
  {"band": 1, "kodu": 7, "zaman": "13:37", "serinumarası": "73-528-8665"},
  {"band": 1, "kodu": 24, "zaman": "16:12", "serinumarası": "47-036-0477"},
  {"band": 4, "kodu": 12, "zaman": "20:38", "serinumarası": "77-109-8325"},
  {"band": 3, "kodu": 2, "zaman": "6:46", "serinumarası": "50-119-3318"},
  {"band": 2, "kodu": 11, "zaman": "2:10", "serinumarası": "44-501-2117"},
  {"band": 0, "kodu": 22, "zaman": "10:47", "serinumarası": "42-193-7147"},
  {"band": 0, "kodu": 16, "zaman": "10:40", "serinumarası": "33-573-3197"},
  {"band": 4, "kodu": 17, "zaman": "23:11", "serinumarası": "68-720-3590"},
  {"band": 2, "kodu": 22, "zaman": "20:35", "serinumarası": "85-374-5826"},
  {"band": 4, "kodu": 17, "zaman": "23:20", "serinumarası": "45-076-3666"},
  {"band": 4, "kodu": 8, "zaman": "6:08", "serinumarası": "69-788-0606"},
  {"band": 4, "kodu": 10, "zaman": "0:56", "serinumarası": "23-897-0073"},
  {"band": 2, "kodu": 2, "zaman": "9:56", "serinumarası": "43-994-7898"},
  {"band": 3, "kodu": 4, "zaman": "5:00", "serinumarası": "43-935-9627"},
  {"band": 4, "kodu": 23, "zaman": "7:28", "serinumarası": "24-744-1758"},
  {"band": 0, "kodu": 11, "zaman": "13:58", "serinumarası": "61-145-2518"},
  {"band": 4, "kodu": 2, "zaman": "20:45", "serinumarası": "12-234-9810"},
  {"band": 0, "kodu": 22, "zaman": "19:52", "serinumarası": "29-320-1590"},
  {"band": 4, "kodu": 13, "zaman": "3:15", "serinumarası": "65-273-0675"},
  {"band": 3, "kodu": 14, "zaman": "4:01", "serinumarası": "80-057-6115"},
  {"band": 4, "kodu": 10, "zaman": "7:42", "serinumarası": "35-951-3711"},
  {"band": 1, "kodu": 6, "zaman": "19:21", "serinumarası": "49-409-5679"},
  {"band": 1, "kodu": 5, "zaman": "5:46", "serinumarası": "28-659-8917"},
  {"band": 3, "kodu": 15, "zaman": "23:11", "serinumarası": "29-720-3414"},
  {"band": 3, "kodu": 16, "zaman": "18:04", "serinumarası": "88-910-8200"},
  {"band": 4, "kodu": 1, "zaman": "9:16", "serinumarası": "05-329-1427"},
  {"band": 0, "kodu": 8, "zaman": "6:47", "serinumarası": "45-909-1162"},
  {"band": 0, "kodu": 17, "zaman": "0:11", "serinumarası": "16-170-8332"},
  {"band": 2, "kodu": 4, "zaman": "1:24", "serinumarası": "29-918-6424"},
  {"band": 2, "kodu": 1, "zaman": "20:23", "serinumarası": "58-094-3124"},
  {"band": 1, "kodu": 8, "zaman": "2:35", "serinumarası": "35-867-6918"},
  {"band": 0, "kodu": 23, "zaman": "19:20", "serinumarası": "02-415-3805"},
  {"band": 4, "kodu": 10, "zaman": "20:15", "serinumarası": "39-839-5555"},
  {"band": 0, "kodu": 20, "zaman": "4:55", "serinumarası": "24-799-2681"},
  {"band": 1, "kodu": 2, "zaman": "20:46", "serinumarası": "47-028-1387"},
  {"band": 2, "kodu": 13, "zaman": "13:01", "serinumarası": "11-731-7394"},
  {"band": 2, "kodu": 1, "zaman": "23:52", "serinumarası": "08-458-5254"},
  {"band": 2, "kodu": 14, "zaman": "1:38", "serinumarası": "38-432-9525"},
  {"band": 3, "kodu": 22, "zaman": "13:26", "serinumarası": "15-725-1927"},
  {"band": 3, "kodu": 18, "zaman": "23:35", "serinumarası": "14-841-4034"},
  {"band": 1, "kodu": 7, "zaman": "22:26", "serinumarası": "59-207-6277"},
  {"band": 4, "kodu": 17, "zaman": "4:22", "serinumarası": "28-503-6640"},
  {"band": 3, "kodu": 14, "zaman": "10:43", "serinumarası": "14-638-3932"},
  {"band": 4, "kodu": 6, "zaman": "4:24", "serinumarası": "41-884-7052"},
  {"band": 3, "kodu": 15, "zaman": "2:42", "serinumarası": "12-030-7647"},
  {"band": 0, "kodu": 0, "zaman": "12:21", "serinumarası": "39-109-1999"},
  {"band": 2, "kodu": 16, "zaman": "2:20", "serinumarası": "04-061-5458"},
  {"band": 0, "kodu": 24, "zaman": "2:17", "serinumarası": "64-965-2386"},
  {"band": 0, "kodu": 11, "zaman": "10:35", "serinumarası": "15-307-3524"},
  {"band": 3, "kodu": 2, "zaman": "6:31", "serinumarası": "18-276-2140"},
  {"band": 1, "kodu": 14, "zaman": "23:35", "serinumarası": "79-906-4713"},
  {"band": 2, "kodu": 9, "zaman": "18:11", "serinumarası": "46-264-7612"},
  {"band": 0, "kodu": 16, "zaman": "11:47", "serinumarası": "47-522-2512"},
  {"band": 3, "kodu": 20, "zaman": "1:45", "serinumarası": "28-337-1267"},
  {"band": 0, "kodu": 1, "zaman": "0:24", "serinumarası": "69-385-9875"},
  {"band": 3, "kodu": 17, "zaman": "1:48", "serinumarası": "95-269-2960"},
  {"band": 4, "kodu": 14, "zaman": "0:50", "serinumarası": "35-842-3391"},
  {"band": 4, "kodu": 14, "zaman": "8:51", "serinumarası": "02-256-5424"},
  {"band": 1, "kodu": 18, "zaman": "8:29", "serinumarası": "40-379-2777"},
  {"band": 1, "kodu": 10, "zaman": "17:24", "serinumarası": "44-756-5722"},
  {"band": 4, "kodu": 0, "zaman": "9:33", "serinumarası": "20-534-7800"},
  {"band": 4, "kodu": 19, "zaman": "4:30", "serinumarası": "20-973-3282"},
  {"band": 3, "kodu": 9, "zaman": "8:33", "serinumarası": "52-300-5330"},
  {"band": 2, "kodu": 10, "zaman": "7:14", "serinumarası": "39-257-1123"},
  {"band": 2, "kodu": 19, "zaman": "21:39", "serinumarası": "93-887-5425"},
  {"band": 4, "kodu": 5, "zaman": "17:10", "serinumarası": "32-798-9821"},
  {"band": 4, "kodu": 8, "zaman": "13:39", "serinumarası": "03-505-9299"},
  {"band": 0, "kodu": 11, "zaman": "7:26", "serinumarası": "80-908-7391"},
  {"band": 1, "kodu": 6, "zaman": "9:52", "serinumarası": "22-668-3833"},
  {"band": 0, "kodu": 7, "zaman": "0:06", "serinumarası": "72-275-0554"},
  {"band": 4, "kodu": 9, "zaman": "13:59", "serinumarası": "38-046-5915"},
  {"band": 0, "kodu": 18, "zaman": "20:29", "serinumarası": "66-229-3802"},
  {"band": 0, "kodu": 20, "zaman": "22:25", "serinumarası": "09-223-3925"},
  {"band": 0, "kodu": 19, "zaman": "21:11", "serinumarası": "33-851-0562"},
  {"band": 2, "kodu": 1, "zaman": "12:59", "serinumarası": "60-442-2005"},
  {"band": 0, "kodu": 24, "zaman": "3:45", "serinumarası": "59-547-5090"},
  {"band": 2, "kodu": 21, "zaman": "19:19", "serinumarası": "65-726-5218"},
  {"band": 3, "kodu": 23, "zaman": "7:17", "serinumarası": "17-119-4233"},
  {"band": 2, "kodu": 13, "zaman": "2:46", "serinumarası": "13-838-4890"},
  {"band": 0, "kodu": 22, "zaman": "12:32", "serinumarası": "80-296-2711"},
  {"band": 0, "kodu": 17, "zaman": "14:17", "serinumarası": "54-669-3452"},
  {"band": 1, "kodu": 3, "zaman": "21:24", "serinumarası": "86-721-9265"},
  {"band": 0, "kodu": 1, "zaman": "21:59", "serinumarası": "95-151-4718"},
  {"band": 4, "kodu": 17, "zaman": "0:28", "serinumarası": "11-296-6752"},
  {"band": 2, "kodu": 15, "zaman": "21:39", "serinumarası": "50-922-9253"},
  {"band": 3, "kodu": 8, "zaman": "10:04", "serinumarası": "91-797-9318"},
  {"band": 1, "kodu": 10, "zaman": "23:27", "serinumarası": "58-199-2500"},
  {"band": 2, "kodu": 6, "zaman": "9:21", "serinumarası": "12-703-0891"},
  {"band": 3, "kodu": 3, "zaman": "1:39", "serinumarası": "69-035-2217"},
  {"band": 2, "kodu": 13, "zaman": "16:17", "serinumarası": "28-196-3470"},
  {"band": 0, "kodu": 15, "zaman": "0:28", "serinumarası": "36-801-0455"},
  {"band": 1, "kodu": 21, "zaman": "7:18", "serinumarası": "70-590-2053"},
  {"band": 4, "kodu": 22, "zaman": "13:03", "serinumarası": "17-379-9368"},
  {"band": 4, "kodu": 21, "zaman": "20:13", "serinumarası": "18-413-3013"},
  {"band": 1, "kodu": 18, "zaman": "21:08", "serinumarası": "47-801-3170"},
  {"band": 4, "kodu": 21, "zaman": "10:10", "serinumarası": "85-257-0435"},
  {"band": 2, "kodu": 23, "zaman": "9:29", "serinumarası": "86-936-0676"},
  {"band": 1, "kodu": 6, "zaman": "6:39", "serinumarası": "63-281-2903"},
  {"band": 1, "kodu": 9, "zaman": "12:36", "serinumarası": "74-123-7430"},
  {"band": 2, "kodu": 13, "zaman": "20:14", "serinumarası": "63-152-4228"},
  {"band": 3, "kodu": 22, "zaman": "16:10", "serinumarası": "14-206-6053"},
  {"band": 1, "kodu": 3, "zaman": "5:40", "serinumarası": "41-919-4886"},
  {"band": 0, "kodu": 11, "zaman": "13:30", "serinumarası": "39-430-1773"},
  {"band": 2, "kodu": 0, "zaman": "20:48", "serinumarası": "52-530-6844"},
  {"band": 2, "kodu": 9, "zaman": "11:47", "serinumarası": "02-825-9052"},
  {"band": 0, "kodu": 4, "zaman": "7:38", "serinumarası": "12-905-9064"},
  {"band": 4, "kodu": 6, "zaman": "12:43", "serinumarası": "26-647-7441"},
  {"band": 3, "kodu": 16, "zaman": "9:36", "serinumarası": "91-428-9358"},
  {"band": 0, "kodu": 0, "zaman": "1:40", "serinumarası": "13-799-9853"},
  {"band": 4, "kodu": 21, "zaman": "6:56", "serinumarası": "10-360-5975"},
  {"band": 4, "kodu": 9, "zaman": "20:40", "serinumarası": "33-815-9608"},
  {"band": 2, "kodu": 10, "zaman": "22:51", "serinumarası": "13-527-5113"},
  {"band": 1, "kodu": 5, "zaman": "8:20", "serinumarası": "80-335-8234"},
  {"band": 0, "kodu": 4, "zaman": "3:53", "serinumarası": "34-233-6926"},
  {"band": 4, "kodu": 4, "zaman": "8:19", "serinumarası": "56-981-3442"},
  {"band": 2, "kodu": 6, "zaman": "18:47", "serinumarası": "56-544-6826"},
  {"band": 0, "kodu": 18, "zaman": "2:18", "serinumarası": "80-680-0994"},
  {"band": 4, "kodu": 23, "zaman": "10:42", "serinumarası": "18-919-0600"},
  {"band": 0, "kodu": 4, "zaman": "10:15", "serinumarası": "14-480-7754"},
  {"band": 0, "kodu": 5, "zaman": "15:29", "serinumarası": "50-580-7696"},
  {"band": 3, "kodu": 23, "zaman": "22:45", "serinumarası": "74-472-6389"},
  {"band": 1, "kodu": 18, "zaman": "4:57", "serinumarası": "74-188-0002"},
  {"band": 1, "kodu": 7, "zaman": "6:03", "serinumarası": "71-568-4183"},
  {"band": 0, "kodu": 24, "zaman": "13:00", "serinumarası": "46-205-9924"},
  {"band": 0, "kodu": 15, "zaman": "8:22", "serinumarası": "86-023-5379"},
  {"band": 1, "kodu": 9, "zaman": "3:29", "serinumarası": "47-798-4797"},
  {"band": 3, "kodu": 20, "zaman": "20:34", "serinumarası": "80-910-2292"},
  {"band": 2, "kodu": 5, "zaman": "22:42", "serinumarası": "66-707-4383"},
  {"band": 0, "kodu": 5, "zaman": "9:36", "serinumarası": "72-579-1542"},
  {"band": 4, "kodu": 18, "zaman": "7:28", "serinumarası": "27-325-0735"},
  {"band": 2, "kodu": 1, "zaman": "12:32", "serinumarası": "27-852-1925"},
  {"band": 4, "kodu": 4, "zaman": "3:43", "serinumarası": "85-257-8265"},
  {"band": 1, "kodu": 12, "zaman": "19:48", "serinumarası": "23-657-9436"},
  {"band": 4, "kodu": 7, "zaman": "18:33", "serinumarası": "09-784-9424"},
  {"band": 0, "kodu": 11, "zaman": "23:46", "serinumarası": "57-550-7858"},
  {"band": 1, "kodu": 13, "zaman": "12:04", "serinumarası": "84-265-8349"},
  {"band": 3, "kodu": 2, "zaman": "7:01", "serinumarası": "54-231-9852"},
  {"band": 0, "kodu": 7, "zaman": "4:12", "serinumarası": "96-421-4949"},
  {"band": 2, "kodu": 1, "zaman": "6:34", "serinumarası": "72-008-1165"},
  {"band": 2, "kodu": 5, "zaman": "21:45", "serinumarası": "85-739-0827"},
  {"band": 3, "kodu": 11, "zaman": "19:48", "serinumarası": "22-669-1639"},
  {"band": 2, "kodu": 12, "zaman": "6:57", "serinumarası": "32-909-7006"},
  {"band": 0, "kodu": 4, "zaman": "2:41", "serinumarası": "73-073-0753"},
  {"band": 1, "kodu": 9, "zaman": "18:54", "serinumarası": "66-744-0955"},
  {"band": 1, "kodu": 9, "zaman": "4:24", "serinumarası": "78-924-2414"},
  {"band": 0, "kodu": 7, "zaman": "4:13", "serinumarası": "18-960-4127"},
  {"band": 2, "kodu": 8, "zaman": "2:52", "serinumarası": "88-551-0934"},
  {"band": 1, "kodu": 20, "zaman": "6:55", "serinumarası": "37-963-7978"},
  {"band": 2, "kodu": 13, "zaman": "1:57", "serinumarası": "05-635-0456"},
  {"band": 1, "kodu": 20, "zaman": "18:14", "serinumarası": "28-827-6435"},
  {"band": 4, "kodu": 23, "zaman": "9:49", "serinumarası": "06-695-4495"},
  {"band": 4, "kodu": 17, "zaman": "21:58", "serinumarası": "32-339-4201"},
  {"band": 1, "kodu": 19, "zaman": "19:04", "serinumarası": "44-745-9955"},
  {"band": 1, "kodu": 15, "zaman": "20:23", "serinumarası": "87-054-8409"},
  {"band": 1, "kodu": 15, "zaman": "13:31", "serinumarası": "46-771-9272"},
  {"band": 1, "kodu": 6, "zaman": "14:41", "serinumarası": "73-860-7341"},
  {"band": 0, "kodu": 14, "zaman": "4:28", "serinumarası": "57-984-1234"},
  {"band": 0, "kodu": 0, "zaman": "2:44", "serinumarası": "23-047-2773"},
  {"band": 4, "kodu": 23, "zaman": "1:08", "serinumarası": "41-753-3106"},
  {"band": 0, "kodu": 1, "zaman": "2:07", "serinumarası": "89-434-0478"},
  {"band": 1, "kodu": 9, "zaman": "16:54", "serinumarası": "69-929-8087"},
  {"band": 1, "kodu": 2, "zaman": "13:33", "serinumarası": "40-335-8514"},
  {"band": 1, "kodu": 15, "zaman": "13:45", "serinumarası": "69-194-9911"},
  {"band": 2, "kodu": 6, "zaman": "23:22", "serinumarası": "71-417-3449"},
  {"band": 2, "kodu": 2, "zaman": "5:00", "serinumarası": "21-708-5692"},
  {"band": 2, "kodu": 8, "zaman": "20:07", "serinumarası": "55-554-4634"},
  {"band": 2, "kodu": 13, "zaman": "0:09", "serinumarası": "44-853-7024"},
  {"band": 1, "kodu": 23, "zaman": "23:32", "serinumarası": "40-651-4305"},
  {"band": 2, "kodu": 8, "zaman": "14:20", "serinumarası": "83-457-1739"},
  {"band": 3, "kodu": 22, "zaman": "6:12", "serinumarası": "99-553-6792"},
  {"band": 1, "kodu": 20, "zaman": "11:49", "serinumarası": "70-624-1986"},
  {"band": 3, "kodu": 9, "zaman": "23:14", "serinumarası": "78-882-0630"},
  {"band": 2, "kodu": 22, "zaman": "14:56", "serinumarası": "53-997-3759"},
  {"band": 0, "kodu": 11, "zaman": "3:24", "serinumarası": "82-044-3173"},
  {"band": 4, "kodu": 24, "zaman": "4:49", "serinumarası": "37-095-6020"},
  {"band": 4, "kodu": 22, "zaman": "19:20", "serinumarası": "81-524-7146"},
  {"band": 3, "kodu": 0, "zaman": "15:20", "serinumarası": "18-806-4273"},
  {"band": 4, "kodu": 3, "zaman": "14:26", "serinumarası": "54-744-6833"},
  {"band": 4, "kodu": 8, "zaman": "13:02", "serinumarası": "50-235-6870"},
  {"band": 0, "kodu": 20, "zaman": "11:29", "serinumarası": "97-293-7480"},
  {"band": 2, "kodu": 24, "zaman": "2:21", "serinumarası": "95-165-0835"},
  {"band": 4, "kodu": 19, "zaman": "20:07", "serinumarası": "34-747-8738"},
  {"band": 3, "kodu": 10, "zaman": "5:34", "serinumarası": "56-106-6641"},
  {"band": 3, "kodu": 19, "zaman": "23:06", "serinumarası": "70-182-8860"},
  {"band": 1, "kodu": 9, "zaman": "16:32", "serinumarası": "21-002-9307"},
  {"band": 2, "kodu": 0, "zaman": "17:43", "serinumarası": "02-830-5742"},
  {"band": 3, "kodu": 9, "zaman": "3:37", "serinumarası": "60-199-8965"},
  {"band": 1, "kodu": 11, "zaman": "19:57", "serinumarası": "14-377-5606"},
  {"band": 1, "kodu": 12, "zaman": "16:19", "serinumarası": "77-116-4553"},
  {"band": 0, "kodu": 17, "zaman": "13:07", "serinumarası": "55-664-4787"},
  {"band": 0, "kodu": 4, "zaman": "5:10", "serinumarası": "97-963-1170"},
  {"band": 2, "kodu": 6, "zaman": "10:25", "serinumarası": "54-810-2611"},
  {"band": 4, "kodu": 13, "zaman": "6:16", "serinumarası": "71-203-3882"},
  {"band": 4, "kodu": 13, "zaman": "22:26", "serinumarası": "99-788-0353"},
  {"band": 2, "kodu": 16, "zaman": "2:17", "serinumarası": "29-364-7466"},
  {"band": 0, "kodu": 6, "zaman": "4:03", "serinumarası": "50-101-1552"},
  {"band": 1, "kodu": 13, "zaman": "0:54", "serinumarası": "89-620-6458"},
  {"band": 3, "kodu": 8, "zaman": "18:44", "serinumarası": "65-664-9178"},
  {"band": 0, "kodu": 11, "zaman": "16:27", "serinumarası": "16-056-1325"},
  {"band": 1, "kodu": 3, "zaman": "14:52", "serinumarası": "06-814-4967"},
  {"band": 0, "kodu": 8, "zaman": "3:28", "serinumarası": "59-731-3141"},
  {"band": 4, "kodu": 16, "zaman": "11:12", "serinumarası": "46-898-5977"},
  {"band": 1, "kodu": 4, "zaman": "3:24", "serinumarası": "03-110-4916"},
  {"band": 3, "kodu": 6, "zaman": "0:36", "serinumarası": "84-950-9956"},
  {"band": 3, "kodu": 20, "zaman": "21:37", "serinumarası": "87-815-9358"},
  {"band": 1, "kodu": 20, "zaman": "16:53", "serinumarası": "09-625-1694"},
  {"band": 0, "kodu": 8, "zaman": "9:54", "serinumarası": "87-265-5754"},
  {"band": 3, "kodu": 8, "zaman": "4:38", "serinumarası": "80-649-9561"},
  {"band": 2, "kodu": 19, "zaman": "1:29", "serinumarası": "41-560-1315"},
  {"band": 2, "kodu": 11, "zaman": "6:21", "serinumarası": "95-901-4103"},
  {"band": 0, "kodu": 21, "zaman": "5:25", "serinumarası": "47-788-6876"},
  {"band": 4, "kodu": 14, "zaman": "2:27", "serinumarası": "74-762-9741"},
  {"band": 1, "kodu": 7, "zaman": "8:16", "serinumarası": "69-921-6978"},
  {"band": 4, "kodu": 8, "zaman": "13:43", "serinumarası": "98-965-8489"},
  {"band": 3, "kodu": 19, "zaman": "8:54", "serinumarası": "58-149-1646"},
  {"band": 4, "kodu": 12, "zaman": "16:52", "serinumarası": "10-202-8879"},
  {"band": 2, "kodu": 1, "zaman": "18:36", "serinumarası": "41-756-5287"},
  {"band": 1, "kodu": 9, "zaman": "8:17", "serinumarası": "58-051-0039"},
  {"band": 4, "kodu": 1, "zaman": "16:24", "serinumarası": "85-518-3267"},
  {"band": 0, "kodu": 11, "zaman": "21:29", "serinumarası": "66-734-9362"},
  {"band": 0, "kodu": 16, "zaman": "6:12", "serinumarası": "69-527-9532"},
  {"band": 0, "kodu": 22, "zaman": "13:10", "serinumarası": "45-216-2178"},
  {"band": 2, "kodu": 13, "zaman": "18:43", "serinumarası": "39-649-2474"},
  {"band": 1, "kodu": 3, "zaman": "0:58", "serinumarası": "30-655-7777"},
  {"band": 3, "kodu": 10, "zaman": "16:21", "serinumarası": "71-273-8527"},
  {"band": 3, "kodu": 16, "zaman": "9:23", "serinumarası": "31-421-0201"},
  {"band": 1, "kodu": 11, "zaman": "4:09", "serinumarası": "36-801-3250"},
  {"band": 3, "kodu": 12, "zaman": "4:33", "serinumarası": "71-358-2663"},
  {"band": 4, "kodu": 24, "zaman": "7:38", "serinumarası": "59-373-4142"},
  {"band": 4, "kodu": 0, "zaman": "10:15", "serinumarası": "90-988-3030"},
  {"band": 0, "kodu": 6, "zaman": "16:15", "serinumarası": "79-174-0740"},
  {"band": 0, "kodu": 14, "zaman": "17:57", "serinumarası": "06-944-2509"},
  {"band": 0, "kodu": 14, "zaman": "11:47", "serinumarası": "91-303-4119"},
  {"band": 4, "kodu": 15, "zaman": "15:38", "serinumarası": "79-838-0632"},
  {"band": 3, "kodu": 23, "zaman": "15:33", "serinumarası": "22-411-8087"},
  {"band": 2, "kodu": 16, "zaman": "6:45", "serinumarası": "73-423-7023"},
  {"band": 3, "kodu": 2, "zaman": "20:49", "serinumarası": "81-028-6422"},
  {"band": 1, "kodu": 24, "zaman": "5:31", "serinumarası": "93-035-0004"},
  {"band": 2, "kodu": 8, "zaman": "17:58", "serinumarası": "55-393-0722"},
  {"band": 2, "kodu": 22, "zaman": "0:59", "serinumarası": "67-469-6031"},
  {"band": 1, "kodu": 19, "zaman": "0:43", "serinumarası": "20-227-5882"},
  {"band": 3, "kodu": 18, "zaman": "16:03", "serinumarası": "38-007-0985"},
  {"band": 3, "kodu": 12, "zaman": "11:36", "serinumarası": "02-608-2880"},
  {"band": 0, "kodu": 14, "zaman": "20:21", "serinumarası": "66-205-9136"},
  {"band": 4, "kodu": 5, "zaman": "7:42", "serinumarası": "55-897-5200"},
  {"band": 0, "kodu": 24, "zaman": "23:48", "serinumarası": "25-890-4093"},
  {"band": 2, "kodu": 20, "zaman": "3:47", "serinumarası": "80-717-2124"},
  {"band": 4, "kodu": 15, "zaman": "8:14", "serinumarası": "73-355-1896"},
  {"band": 4, "kodu": 11, "zaman": "2:13", "serinumarası": "72-386-3173"},
  {"band": 0, "kodu": 14, "zaman": "14:06", "serinumarası": "64-164-3907"},
  {"band": 3, "kodu": 17, "zaman": "10:30", "serinumarası": "44-971-8137"},
  {"band": 2, "kodu": 10, "zaman": "5:05", "serinumarası": "09-792-7345"},
  {"band": 4, "kodu": 2, "zaman": "15:07", "serinumarası": "28-787-1859"},
  {"band": 1, "kodu": 22, "zaman": "11:21", "serinumarası": "65-167-0071"},
  {"band": 2, "kodu": 4, "zaman": "5:55", "serinumarası": "04-158-4763"},
  {"band": 4, "kodu": 17, "zaman": "12:07", "serinumarası": "56-702-1755"},
  {"band": 1, "kodu": 13, "zaman": "2:50", "serinumarası": "78-039-9822"},
  {"band": 2, "kodu": 4, "zaman": "22:20", "serinumarası": "50-568-9165"},
  {"band": 0, "kodu": 23, "zaman": "10:57", "serinumarası": "02-725-0140"},
  {"band": 0, "kodu": 23, "zaman": "13:54", "serinumarası": "85-496-2658"},
  {"band": 4, "kodu": 12, "zaman": "10:00", "serinumarası": "76-236-9606"},
  {"band": 3, "kodu": 12, "zaman": "22:47", "serinumarası": "65-408-3281"},
  {"band": 2, "kodu": 13, "zaman": "11:41", "serinumarası": "53-795-4406"},
  {"band": 4, "kodu": 15, "zaman": "15:01", "serinumarası": "31-811-8858"},
  {"band": 4, "kodu": 16, "zaman": "22:52", "serinumarası": "25-779-2135"},
  {"band": 3, "kodu": 22, "zaman": "7:31", "serinumarası": "32-035-9162"},
  {"band": 1, "kodu": 10, "zaman": "11:04", "serinumarası": "93-331-5504"},
  {"band": 0, "kodu": 2, "zaman": "9:40", "serinumarası": "14-832-0004"},
  {"band": 2, "kodu": 8, "zaman": "22:43", "serinumarası": "80-897-4745"},
  {"band": 4, "kodu": 1, "zaman": "14:53", "serinumarası": "67-037-9995"},
  {"band": 0, "kodu": 12, "zaman": "21:45", "serinumarası": "65-463-7707"},
  {"band": 4, "kodu": 7, "zaman": "2:04", "serinumarası": "32-327-9264"},
  {"band": 0, "kodu": 5, "zaman": "4:56", "serinumarası": "00-825-9896"},
  {"band": 0, "kodu": 10, "zaman": "20:50", "serinumarası": "19-044-0293"},
  {"band": 4, "kodu": 11, "zaman": "15:36", "serinumarası": "95-569-6700"},
  {"band": 1, "kodu": 18, "zaman": "21:28", "serinumarası": "58-369-1499"},
  {"band": 3, "kodu": 18, "zaman": "12:16", "serinumarası": "21-723-2467"},
  {"band": 2, "kodu": 14, "zaman": "2:45", "serinumarası": "55-201-5591"},
  {"band": 1, "kodu": 12, "zaman": "18:08", "serinumarası": "99-017-5921"},
  {"band": 1, "kodu": 1, "zaman": "13:44", "serinumarası": "44-037-3917"},
  {"band": 1, "kodu": 12, "zaman": "18:54", "serinumarası": "71-412-4193"},
  {"band": 4, "kodu": 4, "zaman": "0:10", "serinumarası": "50-235-4990"},
  {"band": 4, "kodu": 22, "zaman": "1:27", "serinumarası": "12-108-7398"},
  {"band": 0, "kodu": 19, "zaman": "17:41", "serinumarası": "45-546-5491"},
  {"band": 1, "kodu": 21, "zaman": "2:59", "serinumarası": "62-743-5400"},
  {"band": 4, "kodu": 21, "zaman": "21:45", "serinumarası": "10-043-8725"},
  {"band": 1, "kodu": 10, "zaman": "5:13", "serinumarası": "83-462-1515"},
  {"band": 2, "kodu": 3, "zaman": "3:41", "serinumarası": "42-786-1506"},
  {"band": 3, "kodu": 24, "zaman": "7:37", "serinumarası": "34-810-4045"},
  {"band": 0, "kodu": 9, "zaman": "16:50", "serinumarası": "37-161-1809"},
  {"band": 0, "kodu": 24, "zaman": "16:35", "serinumarası": "00-550-9432"},
  {"band": 4, "kodu": 21, "zaman": "3:56", "serinumarası": "32-385-2960"},
  {"band": 3, "kodu": 15, "zaman": "20:03", "serinumarası": "56-395-4159"},
  {"band": 2, "kodu": 7, "zaman": "19:32", "serinumarası": "34-054-7146"},
  {"band": 1, "kodu": 8, "zaman": "2:24", "serinumarası": "74-386-4985"},
  {"band": 3, "kodu": 7, "zaman": "17:28", "serinumarası": "25-112-9353"},
  {"band": 4, "kodu": 8, "zaman": "14:31", "serinumarası": "09-401-1091"},
  {"band": 0, "kodu": 5, "zaman": "8:25", "serinumarası": "96-156-3640"},
  {"band": 0, "kodu": 13, "zaman": "10:53", "serinumarası": "87-164-0057"},
  {"band": 3, "kodu": 13, "zaman": "7:41", "serinumarası": "62-027-3372"},
  {"band": 0, "kodu": 8, "zaman": "23:44", "serinumarası": "14-511-6708"},
  {"band": 3, "kodu": 2, "zaman": "23:58", "serinumarası": "19-143-9133"},
  {"band": 3, "kodu": 20, "zaman": "6:14", "serinumarası": "64-648-3434"},
  {"band": 2, "kodu": 22, "zaman": "16:16", "serinumarası": "84-311-1456"},
  {"band": 1, "kodu": 2, "zaman": "8:05", "serinumarası": "09-846-1563"},
  {"band": 3, "kodu": 15, "zaman": "12:38", "serinumarası": "19-990-8617"},
  {"band": 0, "kodu": 18, "zaman": "19:58", "serinumarası": "81-491-1593"},
  {"band": 3, "kodu": 14, "zaman": "21:23", "serinumarası": "81-071-1447"},
  {"band": 0, "kodu": 22, "zaman": "7:00", "serinumarası": "03-319-6912"},
  {"band": 3, "kodu": 18, "zaman": "23:38", "serinumarası": "56-806-2851"},
  {"band": 4, "kodu": 19, "zaman": "10:21", "serinumarası": "90-274-1501"},
  {"band": 1, "kodu": 4, "zaman": "9:15", "serinumarası": "56-832-2951"},
  {"band": 4, "kodu": 15, "zaman": "20:56", "serinumarası": "75-212-7442"},
  {"band": 3, "kodu": 6, "zaman": "3:05", "serinumarası": "55-478-3167"},
  {"band": 3, "kodu": 1, "zaman": "8:27", "serinumarası": "16-939-4396"},
  {"band": 3, "kodu": 13, "zaman": "18:39", "serinumarası": "43-528-3376"},
  {"band": 2, "kodu": 9, "zaman": "21:41", "serinumarası": "64-967-9408"},
  {"band": 2, "kodu": 23, "zaman": "18:25", "serinumarası": "02-294-8260"},
  {"band": 1, "kodu": 9, "zaman": "1:57", "serinumarası": "17-878-7171"},
  {"band": 3, "kodu": 4, "zaman": "21:39", "serinumarası": "10-192-5852"},
  {"band": 3, "kodu": 17, "zaman": "8:54", "serinumarası": "72-784-3921"},
  {"band": 4, "kodu": 7, "zaman": "8:52", "serinumarası": "42-408-4203"},
  {"band": 1, "kodu": 6, "zaman": "6:57", "serinumarası": "83-087-5076"},
  {"band": 1, "kodu": 0, "zaman": "16:24", "serinumarası": "71-088-5312"},
  {"band": 3, "kodu": 6, "zaman": "18:43", "serinumarası": "85-794-4725"},
  {"band": 4, "kodu": 19, "zaman": "7:09", "serinumarası": "71-623-5284"},
  {"band": 3, "kodu": 19, "zaman": "13:10", "serinumarası": "60-100-0708"},
  {"band": 4, "kodu": 2, "zaman": "7:23", "serinumarası": "08-470-8688"},
  {"band": 4, "kodu": 24, "zaman": "13:55", "serinumarası": "26-930-1750"},
  {"band": 2, "kodu": 13, "zaman": "22:33", "serinumarası": "79-253-2051"},
  {"band": 2, "kodu": 22, "zaman": "1:35", "serinumarası": "55-788-1189"},
  {"band": 1, "kodu": 23, "zaman": "10:54", "serinumarası": "63-929-9631"},
  {"band": 0, "kodu": 10, "zaman": "4:36", "serinumarası": "65-196-5794"},
  {"band": 2, "kodu": 23, "zaman": "11:59", "serinumarası": "02-237-4429"},
  {"band": 2, "kodu": 9, "zaman": "3:38", "serinumarası": "80-018-3892"},
  {"band": 2, "kodu": 7, "zaman": "4:00", "serinumarası": "31-172-0896"},
  {"band": 2, "kodu": 22, "zaman": "8:50", "serinumarası": "95-379-7375"},
  {"band": 1, "kodu": 7, "zaman": "18:03", "serinumarası": "85-357-1016"},
  {"band": 1, "kodu": 14, "zaman": "3:44", "serinumarası": "05-233-1683"},
  {"band": 0, "kodu": 14, "zaman": "13:26", "serinumarası": "64-266-6883"},
  {"band": 2, "kodu": 5, "zaman": "9:59", "serinumarası": "35-169-5137"},
  {"band": 1, "kodu": 23, "zaman": "22:27", "serinumarası": "16-989-8038"},
  {"band": 0, "kodu": 15, "zaman": "11:24", "serinumarası": "46-978-7970"},
  {"band": 2, "kodu": 11, "zaman": "1:48", "serinumarası": "46-398-0721"},
  {"band": 2, "kodu": 0, "zaman": "6:31", "serinumarası": "03-685-7217"},
  {"band": 4, "kodu": 9, "zaman": "6:01", "serinumarası": "77-937-2392"},
  {"band": 1, "kodu": 14, "zaman": "7:25", "serinumarası": "72-178-0752"},
  {"band": 0, "kodu": 11, "zaman": "17:21", "serinumarası": "03-909-9684"},
  {"band": 3, "kodu": 20, "zaman": "20:28", "serinumarası": "42-591-5869"},
  {"band": 4, "kodu": 11, "zaman": "8:08", "serinumarası": "00-237-4815"},
  {"band": 4, "kodu": 20, "zaman": "21:11", "serinumarası": "74-618-7384"},
  {"band": 4, "kodu": 23, "zaman": "2:09", "serinumarası": "66-591-2034"},
  {"band": 3, "kodu": 24, "zaman": "13:47", "serinumarası": "12-553-7629"},
  {"band": 4, "kodu": 4, "zaman": "16:50", "serinumarası": "70-668-0160"},
  {"band": 0, "kodu": 13, "zaman": "20:55", "serinumarası": "99-934-3204"},
  {"band": 4, "kodu": 0, "zaman": "5:20", "serinumarası": "32-545-7054"},
  {"band": 4, "kodu": 23, "zaman": "14:47", "serinumarası": "66-832-1866"},
  {"band": 4, "kodu": 3, "zaman": "11:24", "serinumarası": "83-672-5583"},
  {"band": 1, "kodu": 19, "zaman": "7:49", "serinumarası": "40-025-7342"},
  {"band": 1, "kodu": 14, "zaman": "16:07", "serinumarası": "22-846-6392"},
  {"band": 3, "kodu": 7, "zaman": "23:08", "serinumarası": "71-508-0539"},
  {"band": 3, "kodu": 4, "zaman": "11:37", "serinumarası": "56-575-2785"},
  {"band": 1, "kodu": 11, "zaman": "5:25", "serinumarası": "79-673-5656"},
  {"band": 3, "kodu": 9, "zaman": "23:29", "serinumarası": "09-484-8558"},
  {"band": 3, "kodu": 5, "zaman": "20:13", "serinumarası": "89-741-4440"},
  {"band": 4, "kodu": 17, "zaman": "20:32", "serinumarası": "64-057-7988"},
  {"band": 4, "kodu": 22, "zaman": "12:46", "serinumarası": "79-415-7003"},
  {"band": 0, "kodu": 6, "zaman": "22:11", "serinumarası": "36-499-1933"},
  {"band": 4, "kodu": 1, "zaman": "5:13", "serinumarası": "20-157-0169"},
  {"band": 4, "kodu": 23, "zaman": "17:05", "serinumarası": "58-336-7485"},
  {"band": 3, "kodu": 6, "zaman": "15:54", "serinumarası": "30-385-4802"},
  {"band": 2, "kodu": 5, "zaman": "18:46", "serinumarası": "57-020-1834"},
  {"band": 0, "kodu": 12, "zaman": "2:12", "serinumarası": "64-838-8658"},
  {"band": 4, "kodu": 0, "zaman": "0:49", "serinumarası": "50-223-5034"},
  {"band": 2, "kodu": 11, "zaman": "14:57", "serinumarası": "50-302-0420"},
  {"band": 0, "kodu": 18, "zaman": "3:08", "serinumarası": "36-971-6929"},
  {"band": 3, "kodu": 0, "zaman": "12:12", "serinumarası": "52-221-8631"},
  {"band": 1, "kodu": 0, "zaman": "19:16", "serinumarası": "60-109-7575"},
  {"band": 0, "kodu": 15, "zaman": "13:45", "serinumarası": "15-536-8804"},
  {"band": 2, "kodu": 22, "zaman": "3:10", "serinumarası": "11-345-6006"},
  {"band": 3, "kodu": 14, "zaman": "11:52", "serinumarası": "09-517-1273"},
  {"band": 1, "kodu": 4, "zaman": "17:23", "serinumarası": "55-039-2466"},
  {"band": 4, "kodu": 10, "zaman": "0:47", "serinumarası": "68-515-2484"},
  {"band": 0, "kodu": 21, "zaman": "14:22", "serinumarası": "78-789-5830"},
  {"band": 3, "kodu": 24, "zaman": "17:33", "serinumarası": "76-407-1019"},
  {"band": 1, "kodu": 2, "zaman": "2:47", "serinumarası": "47-281-5171"},
  {"band": 1, "kodu": 9, "zaman": "6:18", "serinumarası": "67-991-9142"},
  {"band": 4, "kodu": 15, "zaman": "20:41", "serinumarası": "69-565-0738"},
  {"band": 3, "kodu": 21, "zaman": "9:37", "serinumarası": "49-299-3247"},
  {"band": 2, "kodu": 17, "zaman": "8:55", "serinumarası": "48-625-5304"},
  {"band": 2, "kodu": 21, "zaman": "11:50", "serinumarası": "11-620-3872"},
  {"band": 0, "kodu": 6, "zaman": "11:49", "serinumarası": "91-462-2316"},
  {"band": 1, "kodu": 9, "zaman": "13:44", "serinumarası": "88-714-7947"},
  {"band": 1, "kodu": 7, "zaman": "0:52", "serinumarası": "93-254-9184"},
  {"band": 4, "kodu": 19, "zaman": "0:02", "serinumarası": "54-630-3332"},
  {"band": 4, "kodu": 0, "zaman": "9:31", "serinumarası": "10-479-2928"},
  {"band": 3, "kodu": 6, "zaman": "9:20", "serinumarası": "30-934-5895"},
  {"band": 0, "kodu": 24, "zaman": "19:23", "serinumarası": "27-534-7011"},
  {"band": 2, "kodu": 4, "zaman": "8:19", "serinumarası": "95-334-6117"},
  {"band": 4, "kodu": 6, "zaman": "23:22", "serinumarası": "37-788-0541"},
  {"band": 2, "kodu": 22, "zaman": "1:53", "serinumarası": "31-249-4543"},
  {"band": 0, "kodu": 5, "zaman": "15:57", "serinumarası": "78-585-7516"},
  {"band": 4, "kodu": 24, "zaman": "9:09", "serinumarası": "66-766-3220"},
  {"band": 3, "kodu": 3, "zaman": "15:27", "serinumarası": "81-464-0019"},
  {"band": 1, "kodu": 23, "zaman": "21:27", "serinumarası": "43-114-0822"},
  {"band": 3, "kodu": 8, "zaman": "12:27", "serinumarası": "19-523-9036"},
  {"band": 4, "kodu": 14, "zaman": "15:50", "serinumarası": "90-905-5910"},
  {"band": 0, "kodu": 2, "zaman": "22:17", "serinumarası": "44-280-0816"},
  {"band": 4, "kodu": 16, "zaman": "14:37", "serinumarası": "16-804-6645"},
  {"band": 3, "kodu": 16, "zaman": "16:34", "serinumarası": "32-028-0154"},
  {"band": 0, "kodu": 23, "zaman": "2:22", "serinumarası": "15-381-2509"},
  {"band": 0, "kodu": 2, "zaman": "15:43", "serinumarası": "37-403-4806"},
  {"band": 3, "kodu": 24, "zaman": "15:07", "serinumarası": "78-832-9151"},
  {"band": 3, "kodu": 17, "zaman": "11:12", "serinumarası": "37-683-7118"},
  {"band": 4, "kodu": 12, "zaman": "13:53", "serinumarası": "60-752-5751"},
  {"band": 0, "kodu": 6, "zaman": "11:22", "serinumarası": "64-821-9051"},
  {"band": 0, "kodu": 0, "zaman": "22:21", "serinumarası": "54-730-2637"},
  {"band": 1, "kodu": 14, "zaman": "20:08", "serinumarası": "20-977-0345"},
  {"band": 1, "kodu": 0, "zaman": "12:09", "serinumarası": "59-186-3933"},
  {"band": 2, "kodu": 12, "zaman": "11:25", "serinumarası": "42-660-4567"},
  {"band": 4, "kodu": 23, "zaman": "10:17", "serinumarası": "24-513-9661"},
  {"band": 0, "kodu": 19, "zaman": "20:27", "serinumarası": "69-663-4446"},
  {"band": 0, "kodu": 22, "zaman": "2:03", "serinumarası": "81-262-9606"},
  {"band": 2, "kodu": 2, "zaman": "0:18", "serinumarası": "64-049-6866"},
  {"band": 4, "kodu": 4, "zaman": "9:18", "serinumarası": "78-203-0352"},
  {"band": 0, "kodu": 4, "zaman": "20:54", "serinumarası": "87-634-8083"},
  {"band": 4, "kodu": 23, "zaman": "13:45", "serinumarası": "25-087-4855"},
  {"band": 2, "kodu": 0, "zaman": "21:13", "serinumarası": "59-611-9841"},
  {"band": 3, "kodu": 17, "zaman": "2:04", "serinumarası": "22-152-0488"},
  {"band": 4, "kodu": 4, "zaman": "17:11", "serinumarası": "97-277-2698"},
  {"band": 4, "kodu": 21, "zaman": "20:50", "serinumarası": "27-623-2021"},
  {"band": 2, "kodu": 15, "zaman": "2:22", "serinumarası": "29-593-9011"},
  {"band": 4, "kodu": 18, "zaman": "2:16", "serinumarası": "29-718-1454"},
  {"band": 0, "kodu": 22, "zaman": "21:08", "serinumarası": "23-765-3564"},
  {"band": 3, "kodu": 23, "zaman": "8:18", "serinumarası": "79-528-3084"},
  {"band": 3, "kodu": 6, "zaman": "12:45", "serinumarası": "94-496-1024"},
  {"band": 3, "kodu": 20, "zaman": "7:57", "serinumarası": "00-862-9447"},
  {"band": 0, "kodu": 12, "zaman": "12:12", "serinumarası": "37-078-1514"},
  {"band": 2, "kodu": 15, "zaman": "23:55", "serinumarası": "55-957-1150"},
  {"band": 0, "kodu": 17, "zaman": "19:51", "serinumarası": "37-953-6087"},
  {"band": 3, "kodu": 17, "zaman": "19:17", "serinumarası": "05-180-4601"},
  {"band": 2, "kodu": 7, "zaman": "14:03", "serinumarası": "56-739-1068"},
  {"band": 1, "kodu": 19, "zaman": "13:16", "serinumarası": "93-831-4496"},
  {"band": 2, "kodu": 11, "zaman": "10:26", "serinumarası": "70-059-7586"},
  {"band": 0, "kodu": 2, "zaman": "10:47", "serinumarası": "67-266-9724"},
  {"band": 0, "kodu": 6, "zaman": "2:02", "serinumarası": "14-520-2267"},
  {"band": 2, "kodu": 9, "zaman": "19:53", "serinumarası": "78-464-3580"},
  {"band": 4, "kodu": 4, "zaman": "17:12", "serinumarası": "90-058-1228"},
  {"band": 0, "kodu": 24, "zaman": "7:15", "serinumarası": "77-372-6922"},
  {"band": 4, "kodu": 7, "zaman": "14:56", "serinumarası": "11-219-7272"},
  {"band": 4, "kodu": 8, "zaman": "12:15", "serinumarası": "97-629-9525"},
  {"band": 4, "kodu": 24, "zaman": "9:33", "serinumarası": "47-650-9851"},
  {"band": 0, "kodu": 10, "zaman": "19:07", "serinumarası": "38-557-4641"},
  {"band": 0, "kodu": 1, "zaman": "10:51", "serinumarası": "73-246-1411"},
  {"band": 0, "kodu": 1, "zaman": "10:04", "serinumarası": "92-914-2505"},
  {"band": 3, "kodu": 7, "zaman": "22:01", "serinumarası": "76-552-1276"},
  {"band": 3, "kodu": 11, "zaman": "3:40", "serinumarası": "68-329-4644"},
  {"band": 1, "kodu": 17, "zaman": "10:51", "serinumarası": "81-757-9143"},
  {"band": 1, "kodu": 2, "zaman": "12:18", "serinumarası": "06-289-7201"},
  {"band": 2, "kodu": 16, "zaman": "1:57", "serinumarası": "50-853-0585"},
  {"band": 0, "kodu": 24, "zaman": "23:17", "serinumarası": "58-082-6342"},
  {"band": 4, "kodu": 21, "zaman": "9:07", "serinumarası": "76-712-6964"},
  {"band": 1, "kodu": 9, "zaman": "8:49", "serinumarası": "71-537-4954"},
  {"band": 3, "kodu": 2, "zaman": "21:19", "serinumarası": "73-987-7005"},
  {"band": 2, "kodu": 16, "zaman": "7:26", "serinumarası": "91-007-4114"},
  {"band": 4, "kodu": 8, "zaman": "11:34", "serinumarası": "68-856-8133"},
  {"band": 0, "kodu": 3, "zaman": "2:14", "serinumarası": "39-647-5398"},
  {"band": 3, "kodu": 15, "zaman": "14:38", "serinumarası": "50-829-0735"},
  {"band": 1, "kodu": 9, "zaman": "1:18", "serinumarası": "81-717-7720"},
  {"band": 0, "kodu": 16, "zaman": "18:07", "serinumarası": "86-755-0322"},
  {"band": 2, "kodu": 10, "zaman": "20:31", "serinumarası": "30-558-8393"},
  {"band": 0, "kodu": 9, "zaman": "14:53", "serinumarası": "44-495-2672"},
  {"band": 2, "kodu": 14, "zaman": "20:12", "serinumarası": "17-425-3231"},
  {"band": 2, "kodu": 15, "zaman": "21:44", "serinumarası": "47-739-2040"},
  {"band": 4, "kodu": 18, "zaman": "2:37", "serinumarası": "63-399-9756"},
  {"band": 3, "kodu": 0, "zaman": "10:41", "serinumarası": "52-473-8792"},
  {"band": 2, "kodu": 19, "zaman": "2:19", "serinumarası": "55-938-6530"},
  {"band": 2, "kodu": 8, "zaman": "14:23", "serinumarası": "95-199-1357"},
  {"band": 0, "kodu": 1, "zaman": "23:39", "serinumarası": "52-000-3557"}
];
