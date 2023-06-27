import 'package:complimentapp/data/ui/compli_model.dart';
import 'package:complimentapp/ui/compliment_screen.dart';
import 'package:complimentapp/ui/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AllCompli extends StatefulWidget {
  @override
  _AllCompliState createState() => _AllCompliState();
}

class _AllCompliState extends State<AllCompli> {
  SharedPreferences? _prefs;
  int data = 0;
  List<CompliModel> complis = CompliModel.compli;

  @override
  void initState() {
    super.initState();
    getKey();
  }

  getKey() async {
    _prefs = await SharedPreferences.getInstance();
    setState(() {
      data = _prefs!.getInt("payload")!;
    });
    print(data);
  }

  @override
  Widget build(BuildContext context) {
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
                      fit: BoxFit.cover)),
            ),
            Column(
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
                                  builder: (context) => HomeScreen()),
                            );
                          },
                          child: Image.asset(
                            "assets/images/back_arrow.png",
                            height: 30,
                            width: 30,
                          ))),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: ListView.builder(
                        itemCount: data,
                        shrinkWrap: true,
                        itemBuilder: (context, int index) {
                          return InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Compli(
                                          payload: index.toString(),
                                        )),
                              );
                            },
                            child: Card(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      "Day: ${index + 1}",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 16,
                                          fontFamily: 'monster'),
                                    ),
                                    SizedBox(width: 15),
                                    Flexible(
                                        child: Text(
                                      complis[index].text,
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 15,
                                          fontFamily: 'monster'),
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
