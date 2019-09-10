import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../model/track.dart';

class TracksWidget extends StatefulWidget {
  @override
  _TracksWidgetState createState() => _TracksWidgetState();
}

class _TracksWidgetState extends State<TracksWidget> {
  Future<Track> track;

  @override
  Widget build(BuildContext context) {
    return new FutureBuilder<Track>(
      future: track,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          Track track = snapshot.data;
          return Column(children: <Widget>[
            Text(track.title),
            Text(track.artist),
            Image.network(track.imageurl),
          ]);
        } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
        }
        //By default, show a loading spinner.
        return CircularProgressIndicator();
      },
    );
  }

  @override
  void initState() {
    super.initState();
    track = fetchTrack();
  }

  Future<Track> fetchTrack() async {
    final response =
        await http.get('http://139.59.108.222:2199/rpc/drn1/streaminfo.get');

    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON.
      var responseJson = json.decode(response.body);
      // assume there is only one track to display
      // SO question mentioned 'display current track'
      var track = responseJson['data']
          .map((musicFileJson) => Track.fromJson(musicFileJson['track']))
          .first;
      return track;
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load post');
    }
  }
}
