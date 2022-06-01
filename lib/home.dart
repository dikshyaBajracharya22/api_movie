import 'package:flutter/material.dart';
import 'package:movie_api/utils/text.dart';
import 'package:movie_api/widgets/now_playing.dart';
import 'package:movie_api/widgets/trending.dart';
import 'package:movie_api/widgets/tv.dart';
import 'package:tmdb_api/tmdb_api.dart';

class MyHome extends StatefulWidget {
  const MyHome({Key? key}) : super(key: key);

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  List trendingmovies = [];

  List nowplayingmovies = [];

  List upcomingmovies = [];
  final String apikey = '994b963181de1375604c1bdf85c8bfec';
  final readaccesstoken =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI5OTRiOTYzMTgxZGUxMzc1NjA0YzFiZGY4NWM4YmZlYyIsInN1YiI6IjYyN2EzNjhjYWJkZWMwMDA2NzcwOTRmNSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.FnLJXmEgTLGSD_kArOOaGyGeyb5GoTbBrPyxMG1_FA8';

  loadmovies() async {
    TMDB tmdbWithCustomLogs = TMDB(
      ApiKeys(apikey, readaccesstoken),
      logConfig: ConfigLogger(
        showLogs: true,
        showErrorLogs: true,
        
      ),
    );

    Map trendingresult = await tmdbWithCustomLogs.v3.trending.getTrending();

    Map nowplayingresult = await tmdbWithCustomLogs.v3.movies.getNowPlaying();

    Map upcomingresult = await tmdbWithCustomLogs.v3.movies.getUpcoming();

    print(upcomingresult);
    setState(() {
      trendingmovies = trendingresult['results'];

      nowplayingmovies = nowplayingresult['results'];

      upcomingmovies = upcomingresult['results'];
    });
    // print(trendingmovies);
    // print(tv);
    // print(topratedmovies);
  }

  @override
  void initState() {
    loadmovies();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 229, 231, 234),
      appBar: AppBar(
        
        centerTitle: true,
        
        title: modified_text(
          text: "Home Page ",
          color: Colors.black,
          size: 26,
        ),
        backgroundColor: Color.fromARGB(255, 107, 153, 199),
        elevation: 0,
      ),
      body: ListView(
        children: [
          TvShows(tvShows: upcomingmovies),
          NowPlaying(nowplaying: nowplayingmovies),
          TrendingMovies(
            trending: trendingmovies,
          ),
        ],
      ),
    );
  }
}
