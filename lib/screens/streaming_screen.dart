import 'package:flutter/material.dart';
import 'package:social_embed_webview/platforms/facebook-video.dart';
import 'package:social_embed_webview/social_embed_webview.dart';

class StreamingScreen extends StatefulWidget {
  const StreamingScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _StreamingScreen();
}

class _StreamingScreen extends State<StreamingScreen> {
  String _getVideoLink() {
    return r"""https://fb.watch/cshqySZ0SM/""";
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(children: [
          SocialEmbed(
              socialMediaObj: FacebookVideoEmbedData(videoUrl: _getVideoLink()))
        ]),
      ),
    ));
  }
}
