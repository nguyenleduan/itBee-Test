import 'package:accordion/accordion.dart';
import 'package:accordion/accordion_section.dart';
import 'package:accordion/controllers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:itbeesolutionstest/config/task_model.dart';
import 'package:itbeesolutionstest/screens/home/bloc/home_bloc.dart';
import 'package:itbeesolutionstest/utils/color_constant.dart';
import 'package:itbeesolutionstest/utils/size_utils.dart';
import 'package:search_app_bar_page/search_app_bar_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen> {
  final HomeBloc _bloc = HomeBloc();

  static const headerStyle = TextStyle(
      color: Color(0xffffffff), fontSize: 18, fontWeight: FontWeight.bold);
  static const contentStyleHeader = TextStyle(
      color: Color(0xff999999), fontSize: 14, fontWeight: FontWeight.w700);
  static const contentStyle = TextStyle(
      color: Color(0xff999999), fontSize: 14, fontWeight: FontWeight.normal);
  static const loremIpsum =
      '''Lorem ipsum is typically a corrupted version of 'De finibus bonorum et malorum', a 1st century BC text by the Roman statesman and philosopher Cicero, with words altered, added, and removed to make it nonsensical and improper Latin.''';
  static const slogan =
      'Do not forget to play around with all sorts of colors, backgrounds, borders, etc.';

  @override
  void initState() {
    _bloc.add(LoadTasks());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      bloc: _bloc,
      listener: (context, state) {},
      builder: (context, state) {
        if (state is TaskLoaded) {
          return Scaffold(
            body: SearchAppBarPage<TaskModel>(
              magnifyGlassColor: Colors.black,
              searchAppBarBackgroundColor: ColorConstant.welcomeBack,
              searchAppBarCenterTitle: true,
              searchAppBarHintText: 'Search for a name',
              searchAppBarTitle: const Text(
                'ITBee Test',
                style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
              ),
              onSubmit: (query, listFiltered) {},
              listFull: state.tasks,
              stringFilter: (TaskModel task) => task.title,
              obxListBuilder: (BuildContext context, List<TaskModel> list,
                  bool isModSearch) {
                return Accordion(
                    headerBorderColor: Colors.blueGrey,
                    headerBorderColorOpened: Colors.transparent,
                    // headerBorderWidth: 1,
                    headerBackgroundColorOpened: Colors.green,
                    contentBackgroundColor: Colors.white,
                    contentBorderColor: Colors.green,
                    contentBorderWidth: 3,
                    contentHorizontalPadding: 20,
                    scaleWhenAnimating: true,
                    openAndCloseAnimation: true,
                    headerPadding:
                        const EdgeInsets.symmetric(vertical: 7, horizontal: 15),
                    sectionOpeningHapticFeedback: SectionHapticFeedback.heavy,
                    sectionClosingHapticFeedback: SectionHapticFeedback.light,
                    children: mapData(list));
              },
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                final newTask = TaskModel(
                  title: 'Công việc ngày mai',
                  description: 'Mô tả công việc',
                  status: 0,
                  dueDate: '2025-03-21',
                  priority: Priority.high,
                  createdAt: DateTime.now().toIso8601String(),
                  updatedAt: DateTime.now().toIso8601String(),
                );
                _bloc.add(AddTask(newTask));
              },
              child: Icon(Icons.add),
            ),
          );
        }
        return Center(child: CircularProgressIndicator());
      },
    );
  }

  List<AccordionSection> mapData(List<TaskModel> tasks) {
    List<AccordionSection> sections = [];
    for (var item in tasks) {
      sections.add(AccordionSection(
          isOpen: true,
          contentVerticalPadding: 20,
          leftIcon: const Icon(Icons.note_alt, color: Colors.white),
          header: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(item.title ?? '', style: headerStyle),
                    Text('Dua Date: ${item.dueDate ?? ''}',
                        style: TextStyle(color: Colors.white)),
                    Text(
                        'Priority: ${item.priority?.name == 'high' ? 'HIGH' : 'MEDIUM'}',
                        style: TextStyle(color: Colors.white)),
                  ],
                ),
              ),
              if(item.status == 1)
                Icon(Icons.check_circle, color: Colors.white,size: getSize(45),)
            ],
          ),
          content: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Icons.arrow_upward: Mũi tên hướng lên có thể tượng trưng cho việc "tăng" hoặc "ưu tiên hơn", vì vậy nó phù hợp cho trạng thái MEDIUM.•Icons.arrow_right_alt: đây là biểu tượng mũi tên qua phải, nó sẽ là icon mặc đị',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                    ),
                    textAlign: TextAlign.start,
                  )),
              const SizedBox(height: 10),
              Container(
                margin: getMargin(top: 10),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Status: ${(item.status ?? 0) == 0 ? 'Todo' : 'Done'}',
                              style: contentStyleHeader),
                          Text(
                              'Created Date: ${item.getCreateDate }',
                              style: contentStyleHeader),
                        ],
                      ),
                    ),
                    Container(
                      width: getSize(30),
                      height: getSize(30),
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.green,
                      ),
                      child: IconButton(
                        padding: EdgeInsets.zero,
                        iconSize: 20,
                        icon: const Icon(Icons.edit, color: Colors.white),
                        onPressed: () {},
                      ),
                    ),
                    SizedBox(
                      width: getSize(15),
                    ),
                    Container(
                      width: getSize(30),
                      height: getSize(30),
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.red,
                      ),
                      child: IconButton(
                        padding: EdgeInsets.zero,
                        iconSize: 20,
                        icon: const Icon(Icons.delete, color: Colors.white),
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )));
    }
    return sections;
  }
}
