import 'package:flutter/material.dart';
import 'package:homeworkout_app/utils/color_utils.dart';
import 'package:homeworkout_app/view/menu/menu_view.dart';
import 'package:homeworkout_app/view/woukout/main_woukout_page.dart';
import 'package:homeworkout_app/widget/common_appbar.dart';
import 'package:homeworkout_app/widget/global.dart';
class MainViewPage extends StatefulWidget {
  final int currentIndex,curentTabWorkoutIndex;

  const MainViewPage({ this.currentIndex, this.curentTabWorkoutIndex});

  @override
  _MainViewPageState createState() => _MainViewPageState();
}

class _MainViewPageState extends State<MainViewPage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: CustomAppBar(
         height: MediaQuery.of(context).padding.top,
         color: ColorUtils.MAIN_GRADIENT_1,
         child: Container(),
       ),
      body: SafeArea(child: IndexedStack(
        index: _currentIndex,
        children: [
          MainWorkoutView(),
          MenuView()
        ],
      )),
      bottomNavigationBar: _widgetBottomNavigationBar(),
    );
  }
  Widget _widgetBottomNavigationBar() {
    return BottomNavigationBar(
      items: <BottomNavigationBarItem>[
        // BottomNavigationBarItem(
        //   icon: ImageIcon(AssetImage("assets/icons/ic_home.png"), size: 25,),
        //   title: Text("Trang chủ", style: TextStyle(fontSize: 11),),
        // ),
        // BottomNavigationBarItem(
        //   icon: ImageIcon(AssetImage("assets/icons/ic_my_fitness.png"), size: 25,),
        //   title: Text("Tôi", style: TextStyle(fontSize: 11),),
        // ),
        BottomNavigationBarItem(
          icon: ImageIcon(AssetImage(getAssetsIcon("ic_workouts.png")), size: 25,),
          title: Text("Workouts", style: TextStyle(fontSize: 11),),
        ),
        // BottomNavigationBarItem(
        //   icon: ImageIcon(AssetImage("assets/icons/ic_shop.png"), size: 25,),
        //   title: Text("Shop", style: TextStyle(fontSize: 11),),
        // ),
        BottomNavigationBarItem(
          icon: ImageIcon(AssetImage(getAssetsIcon("ic_menu_different.png")), size: 25,),
          title: Text("Menu", style: TextStyle(fontSize: 11),),
        )
      ],
      type: BottomNavigationBarType.fixed,
      unselectedItemColor: ColorUtils.gray3,
      selectedItemColor: ColorUtils.blueAccent,
      currentIndex: _currentIndex,
//       onTap: (index) {
//         if(index==0) UpdateStatisticBloc().countNotificationUnread();
// //        _currentIndex = index;
// //        if(index==1) myFitnessView.myFitnessState.widget.isRefresh=true;
//         setState(() {
//           _currentIndex = index;
//           if(index==1) myFitnessKey.currentState.reloadAccount();
//         });
//       },
    );
  }
}
