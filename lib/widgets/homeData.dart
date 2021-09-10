import 'dart:convert';

import 'package:amazon_prime/colors.dart';
import 'package:amazon_prime/models/search_list_model.dart';
import 'package:amazon_prime/utils.dart';
import 'package:amazon_prime/widgets/styleWidget.dart';
import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:http/http.dart'as http;

Map data;

class HomeData extends StatefulWidget {
  const HomeData({Key key}) : super(key: key);

  @override
  _HomeDataState createState() => _HomeDataState();
}

class _HomeDataState extends State<HomeData> {
  Future <Search> getTopMovies()async{
    String url='https://www.omdbapi.com/?apikey=$apiKey&type=movie&s=kong';
    final response = await http.get(Uri.parse(url));
    if(response.statusCode==200)
      {
        data=jsonDecode(response.body);
        return Search.fromMap(data);
      }
    else{
      throw Exception('Could not fetch data');
    }
  }

  List <String> languages=[
    'English','Hindi','Malayalam','Tamil','Urdu','Telugu','Kannada','Punjabi','Marathi'
  ];

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
          textStyling('Top Movies', 18, white, FontWeight.bold),
          Container(
            padding: EdgeInsets.only(left: 5,right: 5),
            height: 150,
            child: FutureBuilder(
              future: getTopMovies(),
              builder: (BuildContext context,snapshot){
                if(snapshot.hasData){
                  return ListView.builder(
                    physics: ClampingScrollPhysics(),
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: data['Search'].length,
                    itemBuilder: (BuildContext context,index){
                      Search s1= Search.fromMap(data);
                      return Container(
                        margin: EdgeInsets.only(left: 10,right: 10),
                        height: 80,
                        clipBehavior: Clip.antiAlias,
                        width: 200,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: Image.network(s1.search[index].poster,fit: BoxFit.fill,scale: 0.5,filterQuality: FilterQuality.high,),
                      );
                    },
                  );
                }else{
                  return Center(child: CircularProgressIndicator(),);
                }
              },
            ),
          ),
          textStyling('Watch in Your Language', 18, white, FontWeight.bold),
          Container(
            padding: EdgeInsets.only(left: 5,right: 5),
            height: 120,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: languages.length,
              itemBuilder: (BuildContext context,index){
                return Container(
                  margin: EdgeInsets.only(left: 10,right: 10),
                  height: 100,
                  clipBehavior: Clip.antiAlias,
                  width: 140,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      colors: [
                        Color(0xff2E3192),
                        Color(0xff1BFFFF),
                      ]
                    ),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Center(
                    child: Text(languages[index],style: TextStyle(fontSize: 23,color: Colors.white,fontWeight: FontWeight.bold),),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
