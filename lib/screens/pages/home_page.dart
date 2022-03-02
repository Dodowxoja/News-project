import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:work/services/comments_api.dart';
import 'package:work/services/nbu_api.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  String NetImg = 'https://source.unsplash.com/random/';

  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: Future.wait([NBUApi.getData(), CommentsApi.getData()]),
        builder: (context, AsyncSnapshot snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          } else if (snapshot.hasError) {
            return const Center(child: Text("ERROR"));
          } else {
            return Column(
              children: [
                SizedBox(
                  height: 50,
                  child: TabBar(
                    controller: _tabController,
                    tabs: const [
                      Tab(
                        icon: Icon(Icons.home),
                        text: "News",
                      ),
                      Tab(
                        icon: Icon(Icons.home),
                        text: "Currency",
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 25),
                Expanded(
                  flex: 1,
                  child: SizedBox(
                    height: 100,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset('assets/images/svg/title.svg')
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 15,
                  child: SizedBox(
                    height: double.infinity,
                    width: double.infinity,
                    child: ListView.builder(
                      itemBuilder: (_, __) {
                        return Container(
                          padding: const EdgeInsets.only(bottom: 20),
                          height: 182,
                          child: InkWell(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      height: 140,
                                      width: 137,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: NetworkImage(NetImg),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 10),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          height: 80,
                                          width: 211,
                                          child: SingleChildScrollView(
                                            child: Text(
                                              snapshot.data[1][__]['body']
                                                  .toString(),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(height: 10),
                                        Container(
                                          alignment: Alignment.centerLeft,
                                          height: 23,
                                          width: 211,
                                          child: Text(
                                            '${snapshot.data[0][__]['cb_price']}',
                                            style:
                                                const TextStyle(fontSize: 13),
                                          ),
                                        ),
                                        const SizedBox(height: 10),
                                        SizedBox(
                                          height: 24,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              SizedBox(
                                                width: 240,
                                                child: Row(
                                                  children: [
                                                    Text(
                                                      snapshot.data[0][__]
                                                              ['code']
                                                          .toString(),
                                                      style: const TextStyle(
                                                          color:
                                                              Color(0xff69BDFD),
                                                          fontSize: 13),
                                                    ),
                                                    const SizedBox(width: 10),
                                                    const Icon(
                                                      Icons.circle,
                                                      size: 6,
                                                      color: Colors.grey,
                                                    ),
                                                    const SizedBox(width: 10),
                                                    Text(
                                                      '$__\m ago',
                                                      style: const TextStyle(
                                                          color: Colors.grey,
                                                          fontSize: 13),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              SizedBox(
                                                width: 24,
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.end,
                                                  children: const [
                                                    Icon(
                                                      Icons.more_horiz,
                                                      size: 24,
                                                    ),
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                const Divider(
                                    color: Color(0xFFEEEEEE), height: 1),
                              ],
                            ),
                            onTap: () {},
                          ),
                        );
                      },
                      itemCount: 24,
                    ),
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}
