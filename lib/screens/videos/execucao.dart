import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:flutter/material.dart';

class Execucao extends StatefulWidget {
  const Execucao({super.key});

  @override
  State<Execucao> createState() => _ExecucaoState();
}

class _ExecucaoState extends State<Execucao> {
  final List<String> _videoID = [
    'sqOw2Y6uDWQ',
    'rM6SDUdl9fs',
    'PCSEZejLkjk',
    'A3YYT8wvxHs',
    'sUzGwMyy_uo',
    'v15BcmivG8g',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(
            child: ListView.builder(
                itemCount: _videoID.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Container(
                      margin: EdgeInsets.symmetric(horizontal: 4),
                      child: YoutubePlayer(
                        controller: YoutubePlayerController(
                          initialVideoId: _videoID[index],
                          flags: YoutubePlayerFlags(autoPlay: false),
                        ),
                        showVideoProgressIndicator: true,
                        progressIndicatorColor: Colors.blueAccent,
                      ),
                    ),
                  );
                }),
          )
        ],
      )),
    );
  }
}
