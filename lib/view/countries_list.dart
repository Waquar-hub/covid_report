import 'package:covid_report/servies/state_service.dart';
import 'package:covid_report/view/detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CountriesList extends StatefulWidget {
  const CountriesList({super.key});

  @override
  State<CountriesList> createState() => _CountriesListState();
}

class _CountriesListState extends State<CountriesList> {
  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    StatesServices statesServices = StatesServices();
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: SafeArea(
          child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              onChanged: (value) {
                setState(() {});
              },
              controller: searchController,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                hintText: "Search with country name",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50.0),
                ),
              ),
            ),
          ),
          Expanded(
            child: FutureBuilder(
              future: statesServices.countriesListApi(),
              builder: (context, AsyncSnapshot<List<dynamic>> snapShot) {
                if (!snapShot.hasData) {
                  return ListView.builder(
                    itemCount: 4,
                    itemBuilder: (context, index) {
                      return Shimmer.fromColors(
                        baseColor: Colors.grey.shade700,
                        highlightColor: Colors.grey.shade100,
                        child: Column(
                          children: [
                            ListTile(
                              title: Container(
                                height: 10,
                                width: 89,
                                color: Colors.white,
                              ),
                              subtitle: Container(
                                height: 10,
                                width: 89,
                                color: Colors.white,
                              ),
                              leading: Container(
                                height: 50,
                                width: 50,
                                color: Colors.white,
                              ),
                            )
                          ],
                        ),
                      );
                    },
                  );
                } else {
                  return ListView.builder(
                    itemCount: snapShot.data!.length,
                    itemBuilder: (context, index) {
                      String name = snapShot.data![index]["country"];
                      if (searchController.text.isEmpty) {
                        return Column(
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => DetailedScreen(
                                        active: snapShot.data![index]["active"],
                                        criticle: snapShot.data![index]
                                            ["critical"],
                                        image: snapShot.data![index]
                                            ["countryInfo"]["flag"],
                                        name: name,
                                        test: snapShot.data![index]["tests"],
                                        cases: snapShot.data![index]["cases"],
                                        deaths: snapShot.data![index]["deaths"],
                                        recovered: snapShot.data![index]
                                            ["recovered"]),
                                  ),
                                );
                              },
                              child: ListTile(
                                title: Text(snapShot.data![index]["country"]),
                                subtitle: Text(
                                    snapShot.data![index]['cases'].toString()),
                                leading: Image(
                                  height: 50,
                                  width: 50,
                                  image: NetworkImage(
                                    snapShot.data![index]["countryInfo"]
                                        ["flag"],
                                  ),
                                ),
                              ),
                            )
                          ],
                        );
                      } else if (name.toLowerCase().contains(
                            searchController.text.toLowerCase(),
                          )) {
                        return Column(
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => DetailedScreen(
                                        active: snapShot.data![index]["active"],
                                        criticle: snapShot.data![index]
                                            ["critical"],
                                        image: snapShot.data![index]
                                            ["countryInfo"]["flag"],
                                        name: name,
                                        test: snapShot.data![index]["tests"],
                                        cases: snapShot.data![index]["cases"],
                                        deaths: snapShot.data![index]["deaths"],
                                        recovered: snapShot.data![index]
                                            ["recovered"]),
                                  ),
                                );
                              },
                              child: ListTile(
                                title: Text(snapShot.data![index]["country"]),
                                subtitle: Text(
                                    snapShot.data![index]['cases'].toString()),
                                leading: Image(
                                  height: 50,
                                  width: 50,
                                  image: NetworkImage(
                                    snapShot.data![index]["countryInfo"]
                                        ["flag"],
                                  ),
                                ),
                              ),
                            )
                          ],
                        );
                      } else {
                        return Container();
                      }
                    },
                  );
                }
              },
            ),
          ),
        ],
      )),
    );
  }
}
