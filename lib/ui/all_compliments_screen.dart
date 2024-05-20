import 'package:complimentapp/data/compliment_provider.dart';
import 'package:complimentapp/data/shared_pref_provider.dart';
import 'package:complimentapp/ui/compliment_detail_screen.dart';
import 'package:complimentapp/ui/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AllComplimentsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Provider.of<SharedPrefProvider>(context).getKey();
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            Container(
              height: double.infinity,
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/noti_back.png"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Provider.of<SharedPrefProvider>(context).data == 0
                ? Center(
                    child: Container(
                      child: Text(
                        "No Compliment for today !!!\n Come Tomorrow 😊.",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontFamily: 'monster',
                        ),
                      ),
                    ),
                  )
                : Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(left: 20, top: 30),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => HomeScreen(),
                                ),
                              );
                            },
                            child: Image.asset(
                              "assets/images/back_arrow.png",
                              height: 30,
                              width: 30,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: ListView.builder(
                              itemCount:
                                  Provider.of<SharedPrefProvider>(context).data,
                              shrinkWrap: true,
                              itemBuilder: (context, int index) {
                                return InkWell(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            ComplimentDetailScreen(
                                          payload: index.toString(),
                                        ),
                                      ),
                                    );
                                  },
                                  child: Card(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text(
                                            "Day: ${index + 1}",
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 16.0,
                                              fontFamily: 'monster',
                                            ),
                                          ),
                                          SizedBox(width: 15.0),
                                          Flexible(
                                              child: Text(
                                            Provider.of<ComplimentProvider>(
                                                    context)
                                                .compliments[index]
                                                .text,
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 15.0,
                                              fontFamily: 'monster',
                                            ),
                                          )),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              }),
                        ),
                      )
                    ],
                  ),
          ],
        ),
      ),
    );
  }
}
