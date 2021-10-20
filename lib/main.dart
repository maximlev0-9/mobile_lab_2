import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.dark(
          // primarySwatch: Colors.green,
          // primaryColor: Colors.black54
          ),
      home: const MyHomePage(title: 'Good afternoon'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _topOptions = [
    TopOption(name: "Daily Meditation"),
    TopOption(name: "Timer"),
    TopOption(name: "Downloads"),
    TopOption(name: "Sleep"),
  ];

  final _middleOptions = [
    MiddleOption(
        name: "Getting Started",
        description: "A short intro",
        imageSrc: "img1.jpg"),
    MiddleOption(
        name: "Learning to Sit", description: "Step 1", imageSrc: "img2.jpg"),
    MiddleOption(
        name: "Mindfulness", description: "Step 2", imageSrc: "img3.jpg"),
    MiddleOption(
        name: "Deepen Your Practice",
        description: "Step 3",
        imageSrc: "img4.jpg"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
              child: IconButton(
                icon: const Icon(Icons.more_vert),
                onPressed: () {},
              ),
            )
          ],
        ),
        body: OrientationBuilder(
          builder: (context, orientation) {
            var width = MediaQuery.of(context).size.width;
            int elementHeight = 160;
            return ListView(children: [
              GridView.count(
                childAspectRatio: width / (2 * 80),
                children: _topOptions.map((e) {
                  return Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        color: Colors.grey[800],
                      ),
                      margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
                      child: ListTile(
                        contentPadding: EdgeInsets.only(left: 15),
                        title: Text(
                          e.name,
                          maxLines: 1,
                        ),
                      ));
                }).toList(),
                crossAxisCount: 2,
                shrinkWrap: true,
              ),
              const Padding(
                  padding: EdgeInsets.fromLTRB(15, 30, 0, 10),
                  child: Text(
                    "Courses",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                    textAlign: TextAlign.start,
                  )),
              Container(
                  height: elementHeight + 100,
                  child: ListView(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      children: _middleOptions
                          .map((option) => Padding(
                                padding: const EdgeInsets.all(20),
                                child: SizedBox(
                                  width: elementHeight + 0,
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                            padding: const EdgeInsets.symmetric(vertical: 5),
                                            child: Image(
                                              image: AssetImage(
                                                'assets/' + option.imageSrc,
                                              ),
                                              fit: BoxFit.cover,
                                            ),
                                            // Image,
                                            height: elementHeight.toDouble()),
                                        Text(
                                          option.name,
                                          style: TextStyle(
                                            fontSize: 18,
                                          ),
                                        ),
                                        Text(
                                          option.description,
                                          style: TextStyle(
                                            color: Colors.grey,
                                          ),
                                        )
                                      ]),
                                ),
                              ))
                          .toList())),
              const Padding(
                  padding: EdgeInsets.fromLTRB(15, 30, 0, 10),
                  child: Text("Today's quote",
                      style: TextStyle(
                        fontSize: 20,
                      ))),
              Padding(
                padding: EdgeInsets.fromLTRB(15, 10, 15, 50),
                child: Text(
                    '"If the doors of perception were cleansed, everything would appear to man as it is, infinite" - William Blake'),
              )
            ]);
          },
        ));
  }
}

class TopOption {
  String name;

  TopOption({required this.name});
}

class MiddleOption {
  String name;
  String imageSrc;
  String description;

  MiddleOption(
      {required this.name, required this.imageSrc, required this.description});
}
