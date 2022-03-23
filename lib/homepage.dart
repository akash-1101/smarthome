import 'dart:async';
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:knob_widget/knob_widget.dart';
import 'package:smarthome/widgets/card_widget.dart';
import 'package:smarthome/widgets/list_tile_widget.dart';
import 'package:smarthome/widgets/switch_widget.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final double _minimum = 14;
  final double _maximum = 28;
  bool homeTemperature = false, plugWall = false, smartTv = false;
  late KnobController _controller;
  late double _knobValue;

  void valueChangedListener(double value) {
    if (mounted) {
      setState(() {
        _knobValue = value;
      });
    }
  }

  final audios = <Audio>[
    //Audio.network(
    //  'https://d14nt81hc5bide.cloudfront.net/U7ZRzzHfk8pvmW28sziKKPzK',
    //  metas: Metas(
    //    id: 'Invalid',
    //    title: 'Invalid',
    //    artist: 'Florent Champigny',
    //    album: 'OnlineAlbum',
    //    image: MetasImage.network(
    //        'https://image.shutterstock.com/image-vector/pop-music-text-art-colorful-600w-515538502.jpg'),
    //  ),
    //),
    Audio.network(
      'https://files.freemusicarchive.org/storage-freemusicarchive-org/music/Music_for_Video/springtide/Sounds_strange_weird_but_unmistakably_romantic_Vol1/springtide_-_03_-_We_Are_Heading_to_the_East.mp3',
      metas: Metas(
        id: 'Online',
        title: 'Song1',
        artist: 'Florent Champigny',
        album: 'OnlineAlbum',
        // image: MetasImage.network('https://www.google.com')
        image: const MetasImage.network(
            'https://image.shutterstock.com/image-vector/pop-music-text-art-colorful-600w-515538502.jpg'),
      ),
    ),
    Audio.network(
      'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3',
      //playSpeed: 2.0,
      metas: Metas(
        id: 'Rock',
        title: 'Rock',
        artist: 'Florent Champigny',
        album: 'RockAlbum',
        image: const MetasImage.network(
            'https://static.radio.fr/images/broadcasts/cb/ef/2075/c300.png'),
      ),
    ),
  ];
  late AssetsAudioPlayer _assetsAudioPlayer;
  final List<StreamSubscription> _subscriptions = [];

  @override
  void initState() {
    super.initState();
    _knobValue = _minimum;
    _controller = KnobController(
      initial: _knobValue,
      minimum: _minimum,
      maximum: _maximum,
      startAngle: 0,
      endAngle: 180,
    );
    _controller.addOnValueChangedListener(valueChangedListener);
    _assetsAudioPlayer = AssetsAudioPlayer.newPlayer();

    _subscriptions
        .add(_assetsAudioPlayer.playlistAudioFinished.listen((data) {}));
    _subscriptions
        .add(_assetsAudioPlayer.audioSessionId.listen((sessionId) {}));

    openPlayer();
  }

  int index = 0;
  void openPlayer() async {
    await _assetsAudioPlayer.open(
      Playlist(audios: audios, startIndex: index),
      showNotification: true,
      autoStart: true,
    );
  }

  @override
  void dispose() {
    _assetsAudioPlayer.dispose();
    super.dispose();
  }

  Audio find(List<Audio> source, String fromPath) {
    return source.firstWhere((element) => element.path == fromPath);
  }

  final assetsAudioPlayer = AssetsAudioPlayer();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(30),
          decoration: const BoxDecoration(
              gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Colors.purple,
              Colors.blueAccent,
            ],
          )),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.only(top: 10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                          color: Colors.transparent,
                          margin: const EdgeInsets.only(top: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "Good Morning",
                                style: TextStyle(
                                    fontSize: 28,
                                    color: Colors.white.withOpacity(0.8)),
                              ),
                              Text(
                                "Akash A",
                                style: TextStyle(
                                    fontSize: 32,
                                    color: Theme.of(context).cardColor),
                              ),
                            ],
                          )),
                      Card(
                        color: Colors.white10,
                        shadowColor: Colors.white10,
                        elevation: 50,
                        child: Container(
                          decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              color: Colors.transparent,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: Colors.white)),
                          child: IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.add,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Text(
                    "Living Room",
                    style: TextStyle(
                        fontSize: 20, color: Theme.of(context).cardColor),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: Card(
                        color: Colors.white,
                        elevation: 50,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        child: Container(
                          height: 220,
                          width: MediaQuery.of(context).size.width * 0.4,
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              color: Colors.transparent,
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(color: Colors.white)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              const Text(
                                "Home Temperature",
                                style: TextStyle(fontSize: 20),
                              ),
                              Text(
                                _controller.value.current.toInt().toString() +
                                    " \u2103",
                                style: const TextStyle(
                                    fontSize: 40, fontWeight: FontWeight.bold),
                              ),
                              SwitchW(homeTemperature, (value) {
                                setState(() {
                                  homeTemperature = value;
                                });
                                if (homeTemperature) {
                                  setRoomTemperature(context);
                                }
                              })
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: Card(
                        color: Colors.white24,
                        shadowColor: Colors.white24,
                        elevation: 50,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        child: Container(
                          height: 220,
                          width: MediaQuery.of(context).size.width * 0.4,
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              color: Colors.transparent,
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(color: Colors.white)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: const [
                                  Text(
                                    "Plug Wall",
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.white),
                                  ),
                                  Icon(
                                    Icons.arrow_forward_ios,
                                    color: Colors.white,
                                  )
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: const [
                                    ListTileWidget("Macbook"),
                                    ListTileWidget("HomePod"),
                                    ListTileWidget("Playstation"),
                                  ],
                                ),
                              ),
                              SwitchW(
                                plugWall,
                                (value) {
                                  setState(() {
                                    plugWall = value;
                                  });
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    CardW(
                      Container(
                        height: 200,
                        width: MediaQuery.of(context).size.width * 0.4,
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: Colors.white)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Text(
                                  "Play Music",
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.white),
                                ),
                                Icon(
                                  Icons.arrow_forward_ios,
                                  color: Colors.white,
                                )
                              ],
                            ),
                            StreamBuilder<Playing?>(
                                stream: _assetsAudioPlayer.current,
                                builder: (context, playing) {
                                  if (playing.data != null) {
                                    final myAudio = find(audios,
                                        playing.data!.audio.assetAudioPath);
                                    return Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Neumorphic(
                                            style: const NeumorphicStyle(
                                              depth: 8,
                                              surfaceIntensity: 1,
                                              shape: NeumorphicShape.concave,
                                              boxShape:
                                                  NeumorphicBoxShape.circle(),
                                            ),
                                            child: myAudio.metas.image?.path ==
                                                    null
                                                ? const SizedBox()
                                                : myAudio.metas.image?.type ==
                                                        ImageType.network
                                                    ? Image.network(
                                                        myAudio
                                                            .metas.image!.path,
                                                        height: 50,
                                                        width: 50,
                                                        fit: BoxFit.contain,
                                                      )
                                                    : Image.asset(
                                                        myAudio
                                                            .metas.image!.path,
                                                        height: 5,
                                                        width: 5,
                                                        fit: BoxFit.contain,
                                                      ),
                                          ),
                                        ),
                                        Text(myAudio.metas.title.toString(),
                                            style: const TextStyle(
                                                fontSize: 16,
                                                color: Colors.white))
                                      ],
                                    );
                                  }
                                  return const SizedBox.shrink();
                                }),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CardW(InkWell(
                                  onTap: () {
                                    _assetsAudioPlayer.previous();
                                  },
                                  child: const Padding(
                                    padding: EdgeInsets.all(4.0),
                                    child: Icon(
                                      Icons.arrow_back_ios_rounded,
                                      size: 30,
                                      color: Colors.white,
                                    ),
                                  ),
                                )),
                                InkWell(
                                  onTap: () async {
                                    await _assetsAudioPlayer.playOrPause();
                                  },
                                  child: CardW(StreamBuilder<bool>(
                                      stream: _assetsAudioPlayer.isPlaying,
                                      builder: (context, snapshot) {
                                        return Icon(
                                          snapshot.data == true
                                              ? Icons.pause_circle_rounded
                                              : Icons.play_arrow_rounded,
                                          size: 40,
                                          color: Colors.white,
                                        );
                                      })),
                                ),
                                CardW(Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: InkWell(
                                    onTap: () async {
                                      await _assetsAudioPlayer.next(
                                          keepLoopMode: false);
                                    },
                                    child: const Icon(
                                      Icons.arrow_forward_ios_rounded,
                                      size: 30,
                                      color: Colors.white,
                                    ),
                                  ),
                                ))
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    CardW(
                      Container(
                        height: 200,
                        width: MediaQuery.of(context).size.width * 0.4,
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: Colors.white)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: const [
                                    Text(
                                      "Smart Tv",
                                      style: TextStyle(
                                          fontSize: 20, color: Colors.white),
                                    ),
                                    Text(
                                      "Sony Tv",
                                      style: TextStyle(
                                          fontSize: 15, color: Colors.white),
                                    ),
                                  ],
                                ),
                                const Icon(
                                  Icons.arrow_forward_ios,
                                  color: Colors.white,
                                )
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: const [],
                              ),
                            ),
                            SwitchW(
                              smartTv,
                              (value) async {
                                setState(() {
                                  smartTv = value;
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<dynamic> setRoomTemperature(BuildContext context) {
    return showModalBottomSheet(
        context: context,
        backgroundColor: Colors.transparent,
        enableDrag: false,
        isScrollControlled: true,
        builder: (context) {
          return StatefulBuilder(
            builder: (BuildContext context, setState) {
              return Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20)),
                child: Wrap(
                  children: [
                    const Center(
                      child: Icon(Icons.arrow_drop_down_sharp,
                          color: Colors.grey, size: 40),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: const [
                            Text(
                              "Living Room",
                              style: TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "Home Temperature",
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                        SwitchW(
                          homeTemperature,
                          (value) {
                            setState(() {
                              homeTemperature = value;
                            });
                            if (!homeTemperature) {
                              Navigator.pop(context);
                            }
                          },
                        ),
                      ],
                    ),
                    Center(
                      child: Container(
                        margin: const EdgeInsets.all(20),
                        padding: const EdgeInsets.all(20),
                        child: Knob(
                          controller: _controller,
                          width: 250,
                          height: 250,
                          style: KnobStyle(
                            labelStyle: Theme.of(context).textTheme.bodyText1,
                            tickOffset: 5,
                            labelOffset: 10,
                            minorTicksPerInterval: 5,
                          ),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          children: const [
                            Text(
                              "Current temp",
                              style:  TextStyle(
                                  color: Colors.grey,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "25\u2103",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                        Column(
                          children:const [
                             Text(
                              "Current humidity",
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                             Text(
                              "54 %",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CardW(
                          Container(
                            padding: const EdgeInsets.all(20),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    const Text(
                                      "Heating",
                                      style:  TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18),
                                    ),
                                    Icon(
                                      Icons.circle,
                                      color: HexColor("ff9b75"),
                                      size: 10,
                                    )
                                  ],
                                ),
                                const Text(
                                  "24\u2103",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                          ),
                          color: Colors.grey.withOpacity(0.2),
                        ),
                        CardW(
                          Container(
                            padding: const EdgeInsets.all(20),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children:const [
                                     Text(
                                      "Cooling",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18),
                                    ),
                                     Icon(
                                      Icons.circle,
                                      color: Colors.blueAccent,
                                      size: 10,
                                    )
                                  ],
                                ),
                                const Text(
                                  "18\u2103",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                          ),
                          color: Colors.grey.withOpacity(0.2),
                        ),
                        CardW(
                          Container(
                            padding: const EdgeInsets.all(20),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children:const [
                                     Text(
                                      "Airwave",
                                      style:  TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18),
                                    ),
                                  ],
                                ),
                                const Text(
                                  "20\u2103",
                                  style:  TextStyle(
                                      color: Colors.black,
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                          ),
                          color: Colors.grey.withOpacity(0.2),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CardW(
                          Container(
                            width: MediaQuery.of(context).size.width * 0.4,
                            padding: const EdgeInsets.all(20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  children: const [
                                    Text(
                                      "Fan",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18),
                                    ),
                                    Text(
                                      "Off",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                                Image.asset("assets/fan.png",
                                    height: 50, color: Colors.grey)
                              ],
                            ),
                          ),
                          color: Colors.grey.withOpacity(0.2),
                        ),
                        CardW(
                          Container(
                            width: MediaQuery.of(context).size.width * 0.4,
                            padding: const EdgeInsets.all(20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children:const [
                                         Text(
                                          "Cooler",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18),
                                        ),
                                      ],
                                    ),
                                    const Text(
                                      "Off",
                                      style:  TextStyle(
                                          color: Colors.black,
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                                Image.asset("assets/snow.png",
                                    height: 50, color: Colors.grey)
                              ],
                            ),
                          ),
                          color: Colors.grey.withOpacity(0.2),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          );
        });
  }
}
