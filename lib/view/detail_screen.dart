import 'package:covid_report/view/world_states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

class DetailedScreen extends StatefulWidget {
  String image, name;
  int cases, deaths, recovered, active, criticle, test;

  DetailedScreen(
      {required this.active,
      required this.criticle,
      required this.image,
      required this.name,
      required this.test,
      required this.cases,
      required this.deaths,
      required this.recovered});
  @override
  State<DetailedScreen> createState() => _DetailedScreenState();
}

class _DetailedScreenState extends State<DetailedScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text(widget.name),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            alignment: Alignment.topCenter,
            children: [
              Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * .067),
                child: Card(
                  child: Column(
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * .068,
                      ),
                      ReusableRow(
                        title: "Total Cases",
                        value: widget.cases.toString(),
                      ),
                      ReusableRow(
                        title: "Recovered",
                        value: widget.recovered.toString(),
                      ),
                      ReusableRow(
                        title: "Active Cases",
                        value: widget.active.toString(),
                      ),
                      ReusableRow(
                        title: "Total Deaths",
                        value: widget.deaths.toString(),
                      ),
                    ],
                  ),
                ),
              ),
              CircleAvatar(
                backgroundImage: NetworkImage(widget.image),
                radius: 50,
              )
            ],
          ),
        ],
      ),
    );
  }
}
