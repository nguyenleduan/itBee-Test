
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:search_app_bar_page/search_app_bar_page.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({super.key});

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen>{
  List<String> lst = ['1','2','3'];
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 4), () {
      /// 👇🏼
    });

    Future.delayed(const Duration(seconds: 6), () {
    });
  }

  @override
  Widget build(BuildContext context) {
    return SearchAppBarPage<String>(
      magnifyGlassColor: Colors.black,
      searchAppBarCenterTitle: true,
      searchAppBarHintText: 'Search for a name',
      searchAppBarTitle: const Text(
        'Search Page',
        style: TextStyle(fontSize: 20),
      ),
      onSubmit: (query, listFiltered) {
        debugPrint('🚀 main.dart - query - $query');
      },
      listFull: lst,
      stringFilter: (String person) => person,
      obxListBuilder: (BuildContext context, List<String> list, bool isModSearch) {
        return ListView.builder(
          itemCount: list.length,
          itemBuilder: (_, index) {
            return Card(
                margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4)),
                // color: Theme.of(context).primaryColorDark,
                child: Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          'Name: ${list[index]}',
                          style: const TextStyle(fontSize: 16),
                        ),
                      ),
                      Expanded(
                        child: Text(
                          'Age:  123123',
                          style: const TextStyle(fontSize: 12),
                        ),
                      )
                    ],
                  ),
                ));
          },
        );
      },

    );
  }



  //
  // istView.builder(
  // itemCount: .length,
  // itemBuilder: (context, index) {
  // final task = state.tasks[index];
  // return Container(
  // color: ColorConstant.welcomeBack,
  // width: double.maxFinite,
  // child: Row(
  // children: [
  // Expanded(child: Column(children: [Text(task.title)])),
  // IconButton(
  // icon: Icon(Icons.delete, color: Colors.red),
  // onPressed: () {
  // //context.read<HomeBloc>().add(AddTest(task.id!));
  // },
  // ),
  // ],
  // ),
  // );







}