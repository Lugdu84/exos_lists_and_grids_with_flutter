import 'package:exos_lists_grids/detail_view.dart';
import 'package:exos_lists_grids/model/data_source.dart';
import 'package:exos_lists_grids/navigator_helper.dart';
import 'package:flutter/material.dart';
import 'model/place.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  HomeViewState createState() => HomeViewState();
}

class HomeViewState extends State<HomeView> {
  List<Place> places = [];

  @override
  void initState() {
    super.initState();
    places = DataSource().allPlaces();
  }

  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
        appBar: AppBar(
          title: const Text("Exercices sur les lists et grids"),
        ),
        body: orientation == Orientation.portrait
            ? list(width: width / 4)
            : grid());
  }

  Widget list({required double width}) {
    return ListView.separated(
        itemBuilder: (BuildContext context, int index) {
          final place = places[index];
          return ListTile(
            onTap: () =>
                NavigatorHelper().toDetail(context: context, place: place),
            leading: Text(index.toString()),
            title: Text(
              place.name,
              style: TextStyle(color: Theme.of(context).primaryColor),
            ),
            trailing: Image.asset(
              place.getFolderPath(),
              width: width,
              fit: BoxFit.cover,
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return Divider(
            thickness: 1,
            color: Theme.of(context).primaryColor,
          );
        },
        itemCount: places.length);
  }

  Widget grid() {
    return GridView.builder(
        itemCount: places.length,
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
        itemBuilder: (BuildContext context, int index) {
          final place = places[index];
          return InkWell(
            onTap: () =>
                NavigatorHelper().toDetail(context: context, place: place),
            child: Card(
              child: Column(
                children: [
                  Expanded(
                      child: Image.asset(
                    place.getFolderPath(),
                    fit: BoxFit.cover,
                  )),
                  Padding(
                      padding: const EdgeInsets.all(5),
                      child: Text(
                        place.name,
                        style: TextStyle(color: Theme.of(context).primaryColor),
                        textAlign: TextAlign.center,
                      ))
                ],
              ),
            ),
          );
        });
  }
}
