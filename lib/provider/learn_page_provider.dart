// import 'package:flutter/material.dart';
// class LearningPageProvider extends StatelessWidget {
//   const LearningPageProvider({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: Center(
//         child: Text("Learning Page"),
//       ),
//     );
//   }
// }


// Sample Work


import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class LearningPageProvider extends StatelessWidget {
  final List<String> videoLinks = [
    'https://www.youtube.com/watch?v=gEk6JLJNg0U',
    'https://www.youtube.com/watch?v=X2YgM1Zw4_E',
    'https://www.youtube.com/watch?v=X2YgM1Zw4_E',
    'https://www.youtube.com/watch?v=X2YgM1Zw4_E',
    'https://www.youtube.com/watch?v=X2YgM1Zw4_E',
    'https://www.youtube.com/watch?v=X2YgM1Zw4_E',
    'https://www.youtube.com/watch?v=X2YgM1Zw4_E',
    // Add more YouTube video links as needed
  ];


  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: ListView.builder(
        itemCount: videoLinks.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('Video ${index + 1}'),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => VideoPlayerPage(videoLink: videoLinks[index]),
              ));
            },
          );
        },
      ),
    );
  }
}

class VideoPlayerPage extends StatelessWidget {
  final String videoLink;
  VideoPlayerPage({required this.videoLink});

  @override
  Widget build(BuildContext context) {
    final YoutubePlayerController _controller = YoutubePlayerController(
      initialVideoId: 'gEk6JLJNg0U',
      flags: YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('Video Player'),
      ),
      body: Center(
        child: YoutubePlayer(
          controller: _controller,
          showVideoProgressIndicator: true,
        ),
      ),
    );
  }
}
