import 'package:flutter/material.dart';
import 'package:homeworkout_app/view/woukout/wworkout_library.dart';
import 'package:homeworkout_app/widget/font_utils.dart';
import 'package:homeworkout_app/widget/global.dart';

class MainWorkoutView extends StatefulWidget {
  final int index;

  const MainWorkoutView({Key key, this.index}) : super(key: key);

  @override
  _MainWorkoutViewState createState() => _MainWorkoutViewState();
}

class _MainWorkoutViewState extends State<MainWorkoutView> with SingleTickerProviderStateMixin{
  TabController _tabController;
  void _handleTabSelection() {
    setState(() {});
  }
  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 2);
    _tabController.addListener(_handleTabSelection);
    if (widget.index != null) _tabController.index = widget.index;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

      ),
      body: Column(
        children: [
          TabBar(
            isScrollable: false,
            controller: _tabController,
            indicatorColor:Color(0xff29ABE2),
            labelColor: Colors.black,
            unselectedLabelColor: Colors.grey,
            tabs: <Widget>[
              Tab(
                child: Text(
                  "Thư viện bài tập",
                  style: FontUtils.NORMAL.copyWith(
                      fontSize: setSp(16),
                      color: _tabController.index == 0
                          ? Color(0xff29ABE2)
                          : Colors.black),
                ),
              ),
              Tab(
                child: Text("Báo cáo",
                    style: FontUtils.NORMAL.copyWith(
                        fontSize: setSp(16),
                        color: _tabController.index == 0
                            ? Colors.black
                            : Color(0xff29ABE2))),
              )
            ],
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                WorkoutLibrary(),
                SizedBox()
                // ReportWorkPage(),
              ],
            ),
          )
        ],
      ),
    );
  }
}

