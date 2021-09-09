import 'dart:convert';

import 'package:amazon_prime/colors.dart';
import 'package:amazon_prime/models/search_list_model.dart';
import 'package:amazon_prime/utils.dart';
import 'package:amazon_prime/widgets/styleWidget.dart';
import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:http/http.dart'as http;


class HomeData extends StatefulWidget {
  const HomeData({Key key}) : super(key: key);

  @override
  _HomeDataState createState() => _HomeDataState();
}

class _HomeDataState extends State<HomeData> {
  Future <Search> getTopMovies()async{
    String url='http://www.omdbapi.com/?apikey=$apiKey&type=movie&s=tiger';
    final response = await http.get(Uri.parse(url));
    if(response.statusCode==200)
      {
        final data=jsonDecode(response.body);
        final search = Search.fromJson(data);
        print(data);
        return search;
      }
    else{
      throw Exception('Could not fetch data');
    }
  }

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return Container(
      height: height,
      width: width,
      color: bg,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //POSTER RELEASE
          Container(
            width: width,
            height: height*0.25,
            child: Carousel(
              autoplay: false,
              dotColor: Colors.grey[600],
              dotSize: 5,
              indicatorBgPadding: 10,
              dotBgColor: Colors.grey[900].withOpacity(0.5),
              images: [
                Image.network('https://www.scified.com/articles/breaking-godzilla-vs-kong-trailer-release-date-officially-revealed-4.jpg',fit: BoxFit.cover,),
                Image.network('https://akm-img-a-in.tosshub.com/indiatoday/images/story/202107/pjimage_38.jpg?rRT5IctR_IfOJGe0hPE1eTxOF.cgcB.V&size=770:433',fit: BoxFit.cover,),
                Image.network('https://www.scified.com/articles/breaking-godzilla-vs-kong-trailer-release-date-officially-revealed-4.jpg',fit: BoxFit.cover,),
                Image.network('https://akm-img-a-in.tosshub.com/indiatoday/images/story/202107/pjimage_38.jpg?rRT5IctR_IfOJGe0hPE1eTxOF.cgcB.V&size=770:433',fit: BoxFit.cover,),
              ],
            ),
          ),
          //TOP MOVIES
          textStyling('Top Movies', 18, Colors.white, FontWeight.bold),
          Container(
            height: 150,
            child: FutureBuilder(
              future: getTopMovies(),
              builder: (BuildContext context,snapshot){
                if(snapshot.hasData){
                  final searchResult=snapshot.data;
                  print(searchResult);
                  return ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: searchResult.length,
                    itemBuilder: (BuildContext context,index){
                      return Container(
                        height: 100,
                        width: 250,
                        child: Image.network(''),
                      );
                    },
                  );
                }else{
                  return Center(child: CircularProgressIndicator(),);
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
